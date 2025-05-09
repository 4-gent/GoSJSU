package com.gosjsu.faculty;

import com.gosjsu.utils.DBConnection;
import com.gosjsu.shared.Grade;
import com.gosjsu.shared.StudentGradeDTO;
import com.gosjsu.student.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GradeService {

    private Connection connection;

    public GradeService() {
        try {
            this.connection = DBConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Failed to initialize database connection", e);
        }
    }

    public void assignGrade(String studentId, String courseId, String grade) throws SQLException {
        String query = "INSERT INTO Grade_Report (studentID, courseID, grade) VALUES (?, ?, ?) " +
                    "ON DUPLICATE KEY UPDATE grade = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, studentId);
            preparedStatement.setString(2, courseId);
            preparedStatement.setString(3, grade);
            preparedStatement.setString(4, grade);
            preparedStatement.executeUpdate();
        }
    }

    public void updateGrade(String studentId, String courseId, String newGrade) throws SQLException {
        String query = "UPDATE Grade_Report SET grade = ? WHERE studentID = ? AND courseID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, newGrade);
            preparedStatement.setString(2, studentId);
            preparedStatement.setString(3, courseId);
            preparedStatement.executeUpdate();
        }
    }

    public List<StudentGradeDTO> getGradesForCourse(String courseId) throws SQLException {
        List<StudentGradeDTO> grades = new ArrayList<>();
        String query = "SELECT s.student_id, s.firstName, s.lastName, g.grade, g.courseID " +
                       "FROM Grade_Report g " +
                       "JOIN Student s ON g.studentID = s.studentID " +
                       "WHERE g.courseID = ?";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, courseId);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                StudentGradeDTO grade = new StudentGradeDTO();
                grade.setStudentId(resultSet.getString("student_id"));
                grade.setFirstName(resultSet.getString("firstName"));
                grade.setLastName(resultSet.getString("lastName"));
                grade.setGrade(resultSet.getString("grade"));
                grade.setCourseId(resultSet.getString("courseID"));
                grades.add(grade);
            }
        }
        return grades;
    }

    public List<Grade> getGradesForStudent(String studentId) throws SQLException {
        List<Grade> grades = new ArrayList<>();
        String query = "SELECT courseID, grade, reportedOn " +
                       "FROM Grade_Report " +
                       "WHERE studentID = ?";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                Grade grade = new Grade();
                grade.setCourseId(resultSet.getString("courseID"));
                grade.setGrade(resultSet.getString("grade"));
                grade.setReportedOn(resultSet.getTimestamp("reportedOn"));
                grades.add(grade);
            }
        }
        return grades;
    }
    public List<StudentGradeDTO> getGradesForFacultyCourse(String facultyId, String courseId) throws SQLException {
        List<StudentGradeDTO> grades = new ArrayList<>();
        String query = "SELECT s.student_id, s.firstName, s.lastName, g.grade, g.courseID " +
                    "FROM Grade_Report g " +
                    "JOIN Student s ON g.studentID = s.studentID " +
                    "JOIN Teaches t ON g.courseID = t.courseID " +
                    "WHERE t.employeeID = ? AND g.courseID = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, facultyId);
            preparedStatement.setString(2, courseId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                StudentGradeDTO grade = new StudentGradeDTO();
                grade.setStudentId(resultSet.getString("student_id"));
                grade.setFirstName(resultSet.getString("firstName"));
                grade.setLastName(resultSet.getString("lastName"));
                grade.setGrade(resultSet.getString("grade"));
                grade.setCourseId(resultSet.getString("courseID"));
                grades.add(grade);

                System.out.println("Added faculty course grade: " + grade);
            }
            for (StudentGradeDTO grade : grades) {
                System.out.println("Student ID: " + grade.getStudentId());
                System.out.println("First Name: " + grade.getFirstName());
                System.out.println("Last Name: " + grade.getLastName());
                System.out.println("Course ID: " + grade.getCourseId());
                System.out.println("Grade: " + grade.getGrade());
                System.out.println("-----------------------------");
            }
        }
        return grades;
    }
    public List<Course> getCoursesForFaculty(String employeeId) throws SQLException {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.name " +
                    "FROM Teaches t " +
                    "JOIN Course c ON t.courseID = c.courseID " +
                    "WHERE t.employeeID = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, employeeId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(resultSet.getInt("courseID"));
                course.setCourseName(resultSet.getString("name"));
                courses.add(course);
            }
        }
        return courses;
    }
}