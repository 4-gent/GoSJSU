package com.gosjsu.faculty;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.gosjsu.utils.DBConnection;
import com.gosjsu.shared.Grade;
import com.gosjsu.student.Course;
import com.gosjsu.faculty.Faculty;
import com.gosjsu.student.Student;

public class FacultyProfileService {
    public Faculty getFacultyProfile(int employeeId) {
        String query = "SELECT * FROM faculty WHERE employeeID = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, employeeId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Faculty faculty = new Faculty();
                faculty.setId(resultSet.getInt("employeeID"));
                faculty.setEmployeeId(resultSet.getString("employee_id"));
                faculty.setFirstName(resultSet.getString("firstName"));
                faculty.setLastName(resultSet.getString("lastName"));
                faculty.setEmail(resultSet.getString("email"));
                faculty.setDepartment(resultSet.getString("department"));
                
                // Try to get optional fields that may be null
                try { faculty.setGender(resultSet.getString("gender")); } catch (SQLException e) {}
                try { faculty.setDateOfBirth(resultSet.getDate("date_of_birth")); } catch (SQLException e) {}
                try { faculty.setCity(resultSet.getString("city")); } catch (SQLException e) {}
                try { faculty.setPostalAddress(resultSet.getString("postal_address")); } catch (SQLException e) {}
                try { faculty.setMobileNumber(resultSet.getString("mobile_number")); } catch (SQLException e) {}
                try { faculty.setAlternateMobileNumber(resultSet.getString("alternate_mobile_number")); } catch (SQLException e) {}
                
                System.out.println("Loaded faculty profile: " + faculty.getFirstName() + " " + faculty.getLastName());
                
                return faculty;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching faculty profile", e);
        }
        return null;
    }

    public List<Course> getCoursesTaught(int employeeId, String semester) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.name " +
                    "FROM course c " +
                    "JOIN teaches t ON c.courseID = t.courseID " +
                    "WHERE t.employeeID = ? AND t.semester = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, employeeId);
            preparedStatement.setString(2, semester);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(resultSet.getInt("courseID"));
                course.setCourseName(resultSet.getString("name"));
                courses.add(course);
                System.out.println("Added faculty course: " + course);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching courses taught", e);
        }
        return courses;
    }
    
    public List<Course> getCoursesTaught(int employeeId) {
        return getCoursesTaught(employeeId, "Fall 2025");
    }
    
    public int getTotalStudentsCount(int employeeId, String semester) {
        String query = "SELECT COUNT(DISTINCT e.studentID) AS total_students " +
                    "FROM enrollment e " +
                    "JOIN teaches t ON e.courseID = t.courseID AND e.semester = t.semester " +
                    "WHERE t.employeeID = ? AND t.semester = ?";
        
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, employeeId);
            preparedStatement.setString(2, semester);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("total_students");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error counting total students", e);
        }
        return 0;
    }
    
    public int getPendingGradeSubmissions(int employeeId, String semester) {
        String query = "SELECT COUNT(*) AS pending_grades " +
                    "FROM enrollment e " +
                    "JOIN teaches t ON e.courseID = t.courseID AND e.semester = t.semester " +
                    "LEFT JOIN grade_report g ON e.studentID = g.studentID AND e.courseID = g.courseID AND e.semester = g.semester " +
                    "WHERE t.employeeID = ? AND t.semester = ? AND g.grade IS NULL";
        
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, employeeId);
            preparedStatement.setString(2, semester);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("pending_grades");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error counting pending grade submissions", e);
        }
        return 0;
    }
    
    public List<Student> getStudentsInCourse(int courseId, String semester) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT s.studentID, s.student_id as studentNumber, s.firstName, s.lastName, s.email " +
                    "FROM Student s " +
                    "JOIN enrollment e ON s.studentID = e.studentID " +
                    "WHERE e.courseID = ? AND e.semester = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, courseId);
            preparedStatement.setString(2, semester);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("studentID"));
                student.setStudentNumber(resultSet.getString("studentNumber"));
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                student.setEmail(resultSet.getString("email"));
                students.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching students in course", e);
        }
        return students;
    }
}