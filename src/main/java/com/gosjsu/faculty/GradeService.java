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

    public GradeService() {
        // No longer storing connection as instance variable
    }

    public void assignGrade(String studentId, String courseId, String grade) throws SQLException {
        String query = "INSERT INTO grade_report (studentID, courseID, grade) VALUES (?, ?, ?) " +
                    "ON DUPLICATE KEY UPDATE grade = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, studentId);
            preparedStatement.setString(2, courseId);
            preparedStatement.setString(3, grade);
            preparedStatement.setString(4, grade);
            preparedStatement.executeUpdate();
        }
    }

    public void updateGrade(String studentId, String courseId, String newGrade) throws SQLException {
        String query = "UPDATE grade_report SET grade = ? WHERE studentID = ? AND courseID = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, newGrade);
            preparedStatement.setString(2, studentId);
            preparedStatement.setString(3, courseId);
            preparedStatement.executeUpdate();
        }
    }

    public List<StudentGradeDTO> getGradesForCourse(String courseId) throws SQLException {
        List<StudentGradeDTO> grades = new ArrayList<>();
        String query = "SELECT s.studentID, s.student_id as studentNumber, s.firstName, s.lastName, c.name as courseName, g.grade " +
                       "FROM grade_report g " +
                       "JOIN student s ON g.studentID = s.studentID " +
                       "JOIN course c ON g.courseID = c.courseID " +
                       "WHERE g.courseID = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, courseId);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                StudentGradeDTO grade = new StudentGradeDTO();
                grade.setStudentId(resultSet.getInt("studentID"));
                grade.setStudentNumber(resultSet.getString("studentNumber"));
                grade.setFirstName(resultSet.getString("firstName"));
                grade.setLastName(resultSet.getString("lastName"));
                grade.setCourseName(resultSet.getString("courseName"));
                grade.setGrade(resultSet.getString("grade"));
                grades.add(grade);
            }
        }
        return grades;
    }

    public List<Grade> getGradesForStudent(String studentId) throws SQLException {
        List<Grade> grades = new ArrayList<>();
        String query = "SELECT g.courseID, g.grade, g.reportedOn, g.semester, c.name as courseName " +
                       "FROM grade_report g " +
                       "JOIN course c ON g.courseID = c.courseID " +
                       "WHERE g.studentID = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                Grade grade = new Grade();
                grade.setCourseId(resultSet.getString("courseID"));
                grade.setGrade(resultSet.getString("grade"));
                grade.setReportedOn(resultSet.getTimestamp("reportedOn"));
                grade.setCourseName(resultSet.getString("courseName"));
                grade.setSemester(resultSet.getString("semester"));
                grades.add(grade);
            }
        }
        return grades;
    }
    
    public List<Grade> getGradesForStudent(int studentId) throws SQLException {
        return getGradesForStudent(String.valueOf(studentId));
    }
    
    public List<StudentGradeDTO> getGradesForFacultyCourse(String facultyId, String courseId) throws SQLException {
        List<StudentGradeDTO> grades = new ArrayList<>();
        String query = "SELECT s.studentID, s.student_id as studentNumber, s.firstName, s.lastName, c.name as courseName, g.grade " +
                    "FROM grade_report g " +
                    "JOIN student s ON g.studentID = s.studentID " +
                    "JOIN course c ON g.courseID = c.courseID " +
                    "JOIN teaches t ON g.courseID = t.courseID " +
                    "WHERE t.employeeID = ? AND g.courseID = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, facultyId);
            preparedStatement.setString(2, courseId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                StudentGradeDTO grade = new StudentGradeDTO();
                grade.setStudentId(resultSet.getInt("studentID"));
                grade.setStudentNumber(resultSet.getString("studentNumber"));
                grade.setFirstName(resultSet.getString("firstName"));
                grade.setLastName(resultSet.getString("lastName"));
                grade.setCourseName(resultSet.getString("courseName"));
                grade.setGrade(resultSet.getString("grade"));
                grades.add(grade);

                System.out.println("Added faculty course grade: " + grade.getStudentId() + " - " + grade.getFirstName() + " " + grade.getLastName());
            }
            
            // Debug output
            for (StudentGradeDTO grade : grades) {
                System.out.println("Student ID: " + grade.getStudentId());
                System.out.println("First Name: " + grade.getFirstName());
                System.out.println("Last Name: " + grade.getLastName());
                System.out.println("Course Name: " + grade.getCourseName());
                System.out.println("Grade: " + grade.getGrade());
                System.out.println("-----------------------------");
            }
        }
        return grades;
    }
    
    public List<Course> getCoursesForFaculty(String employeeId) throws SQLException {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.name " +
                    "FROM teaches t " +
                    "JOIN course c ON t.courseID = c.courseID " +
                    "WHERE t.employeeID = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
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
    
    public List<Course> getCoursesForFaculty(int employeeId) throws SQLException {
        return getCoursesForFaculty(String.valueOf(employeeId));
    }
}