package com.gosjsu.student;

import com.gosjsu.shared.Grade;
import com.gosjsu.shared.StudentGradeDTO;
import com.gosjsu.student.Course;

import com.gosjsu.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class ProfileService {

    public Student getStudentProfile(int studentId) {
        Student student = null;
        String query = "SELECT * FROM student WHERE studentID = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, studentId); // Use setInt for int parameter
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getInt("studentID")); // Incremental number
                student.setStudentId(resultSet.getString("student_id")); // Username
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                student.setEmail(resultSet.getString("email"));
                student.setMajor(resultSet.getString("major"));
                
                // Safely get date of birth - catch exception if column doesn't exist
                try {
                    java.sql.Date dob = resultSet.getDate("date_of_birth");
                    if (dob != null) {
                        student.setDateOfBirth(dob);
                    }
                } catch (SQLException e) {
                    System.out.println("date_of_birth column not found: " + e.getMessage());
                    // Continue execution - don't let this stop the method
                }
                
                student.setGender(resultSet.getString("gender"));
                student.setCity(resultSet.getString("city"));
                student.setPostalAddress(resultSet.getString("postal_address"));
                student.setMobileNumber(resultSet.getString("mobile_number"));
                student.setAlternateMobileNumber(resultSet.getString("alternate_mobile_number"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching student profile: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error fetching student profile", e);
        }
        System.out.println("Student profile fetched: " + student);
        return student;
    }

    public boolean updateStudentProfile(Student student) {
        String query = "UPDATE student SET firstName = ?, lastName = ?, email = ?, major = ?, " +
                    "gender = ?, date_of_birth = ?, city = ?, postal_address = ?, " +
                    "mobile_number = ?, alternate_mobile_number = ? WHERE studentID = ?";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getEmail());
            preparedStatement.setString(4, student.getMajor());
            preparedStatement.setString(5, student.getGender());
            preparedStatement.setDate(6, student.getDateOfBirth() != null ?
                    new java.sql.Date(student.getDateOfBirth().getTime()) : null);
            preparedStatement.setString(7, student.getCity());
            preparedStatement.setString(8, student.getPostalAddress());
            preparedStatement.setString(9, student.getMobileNumber());
            preparedStatement.setString(10, student.getAlternateMobileNumber());
            preparedStatement.setInt(11, student.getId()); // Use studentID (incremental number)

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.err.println("Error updating student profile: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error updating student profile", e);
        }
    }

    public Student getProfile(int studentId) {
        return getStudentProfile(studentId);
    }
    
    public List<StudentGradeDTO> getGrades(int studentId) {
        List<StudentGradeDTO> grades = new ArrayList<>();
        String query = "SELECT c.name AS courseName, g.grade, g.reportedOn " +
                    "FROM grade_report g " +
                    "JOIN course c ON g.courseID = c.courseID " +
                    "WHERE g.studentID = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, studentId); // Use setInt for int parameter
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                StudentGradeDTO grade = new StudentGradeDTO();
                grade.setCourseName(resultSet.getString("courseName"));
                grade.setGrade(resultSet.getString("grade"));
                grades.add(grade);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching grades: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error fetching grades", e);
        }
        return grades;
    }

    public void updateProfile(String studentId, String field, String value) {
        int studentIdInt = Integer.parseInt(studentId); // Convert String to int
        Student student = getProfile(studentIdInt); // Use int studentId
        if (student == null) {
            throw new RuntimeException("Student not found");
        }

        switch (field) {
            case "firstName":
            case "first_name":
                student.setFirstName(value);
                break;
            case "lastName":
            case "last_name":
                student.setLastName(value);
                break;
            case "email":
                student.setEmail(value);
                break;
            case "major":
                student.setMajor(value);
                break;
            case "gender":
                student.setGender(value);
                break;
            case "city":
                student.setCity(value);
                break;
            case "postalAddress":
            case "postal_address":
                student.setPostalAddress(value);
                break;
            case "mobileNumber":
            case "mobile_number":
                student.setMobileNumber(value);
                break;
            case "alternateMobileNumber":
            case "alternate_mobile_number":
                student.setAlternateMobileNumber(value);
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }

        updateStudentProfile(student); // Ensure this method exists
    }
    
    public List<Course> getEnrollments(int studentId) {
        System.out.println("Fetching enrollments for student ID: " + studentId);
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.name " +
                    "FROM enrollment e " +
                    "JOIN course c ON e.courseID = c.courseID " +
                    "WHERE e.studentID = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, studentId);
            System.out.println("Executing query: " + query);
            System.out.println("With studentID: " + studentId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int courseId = resultSet.getInt("courseID");
                String courseName = resultSet.getString("name");
                System.out.println("Fetched courseID: " + courseId + ", courseName: " + courseName);

                Course course = new Course();
                course.setCourseId(courseId);
                course.setCourseName(courseName);
                courses.add(course);
                System.out.println("Added course: " + course);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching enrollments: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error fetching enrollments", e);
        }

        return courses;
    }

    // Add overloaded methods that accept String parameters
    
    public Student getStudentProfile(String studentIdStr) {
        try {
            int studentId = Integer.parseInt(studentIdStr);
            return getStudentProfile(studentId);
        } catch (NumberFormatException e) {
            System.err.println("Invalid student ID format: " + studentIdStr);
            return null;
        }
    }
    
    public List<Course> getEnrollments(String studentIdStr) {
        try {
            int studentId = Integer.parseInt(studentIdStr);
            return getEnrollments(studentId);
        } catch (NumberFormatException e) {
            System.err.println("Invalid student ID format: " + studentIdStr);
            return new ArrayList<>();
        }
    }
    
    public List<StudentGradeDTO> getGrades(String studentIdStr) {
        try {
            int studentId = Integer.parseInt(studentIdStr);
            return getGrades(studentId);
        } catch (NumberFormatException e) {
            System.err.println("Invalid student ID format: " + studentIdStr);
            return new ArrayList<>();
        }
    }
}