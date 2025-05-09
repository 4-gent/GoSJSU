package com.gosjsu.faculty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gosjsu.utils.DBConnection;
import com.gosjsu.student.Course;
import com.gosjsu.student.Student;
import com.gosjsu.shared.StudentGradeDTO;

public class FacultyGradeService {
    
    /**
     * Get a course by its ID
     */
    public Course getCourseById(int courseId) throws SQLException {
        String query = "SELECT * FROM course WHERE courseID = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, courseId);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(resultSet.getInt("courseID"));
                course.setCourseName(resultSet.getString("name"));
                return course;
            }
        }
        return null;
    }
    
    /**
     * Check if a faculty teaches a specific course in a given semester
     */
    public boolean facultyTeachesCourse(int employeeId, int courseId, String semester) throws SQLException {
        String query = "SELECT COUNT(*) FROM teaches WHERE employeeID = ? AND courseID = ? AND semester = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, employeeId);
            statement.setInt(2, courseId);
            statement.setString(3, semester);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        }
        return false;
    }
    
    /**
     * Get all students enrolled in a course and their grades
     */
    public List<StudentGradeDTO> getStudentGradesForCourse(int courseId, String semester) throws SQLException {
        List<StudentGradeDTO> studentGrades = new ArrayList<>();
        String query = "SELECT s.studentID, s.student_id as studentNumber, s.firstName, s.lastName, g.grade " +
                       "FROM student s " +
                       "JOIN enrollment e ON s.studentID = e.studentID " +
                       "LEFT JOIN grade_report g ON s.studentID = g.studentID AND e.courseID = g.courseID AND e.semester = g.semester " +
                       "WHERE e.courseID = ? AND e.semester = ? " +
                       "ORDER BY s.lastName, s.firstName";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, courseId);
            statement.setString(2, semester);
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                StudentGradeDTO dto = new StudentGradeDTO();
                dto.setStudentId(resultSet.getInt("studentID"));
                dto.setStudentNumber(resultSet.getString("studentNumber"));
                dto.setFirstName(resultSet.getString("firstName"));
                dto.setLastName(resultSet.getString("lastName"));
                dto.setGrade(resultSet.getString("grade"));
                studentGrades.add(dto);
            }
        }
        
        return studentGrades;
    }
    
    /**
     * Get the grading progress for a course (percentage of grades submitted)
     */
    public int getGradingProgressForCourse(int employeeId, int courseId, String semester) throws SQLException {
        String query = "SELECT " +
                      "(SELECT COUNT(*) FROM enrollment WHERE courseID = ? AND semester = ?) AS total_students, " +
                      "(SELECT COUNT(*) FROM grade_report WHERE courseID = ? AND semester = ?) AS graded_students";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, courseId);
            statement.setString(2, semester);
            statement.setInt(3, courseId);
            statement.setString(4, semester);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                int totalStudents = resultSet.getInt("total_students");
                int gradedStudents = resultSet.getInt("graded_students");
                
                if (totalStudents == 0) {
                    return 100; // No students to grade
                }
                
                return (int) ((gradedStudents * 100.0) / totalStudents);
            }
        }
        
        return 0;
    }
    
    /**
     * Submit or update a grade for a student
     */
    public boolean submitGrade(int studentId, int courseId, String semester, String grade) throws SQLException {
        // First check if a grade already exists
        String checkQuery = "SELECT COUNT(*) FROM grade_report WHERE studentID = ? AND courseID = ? AND semester = ?";
        String insertQuery = "INSERT INTO grade_report (studentID, courseID, semester, grade, reportedOn) VALUES (?, ?, ?, ?, CURRENT_DATE)";
        String updateQuery = "UPDATE grade_report SET grade = ?, reportedOn = CURRENT_DATE WHERE studentID = ? AND courseID = ? AND semester = ?";
        
        try (Connection connection = DBConnection.getConnection()) {
            // Check if grade exists
            try (PreparedStatement checkStatement = connection.prepareStatement(checkQuery)) {
                checkStatement.setInt(1, studentId);
                checkStatement.setInt(2, courseId);
                checkStatement.setString(3, semester);
                ResultSet resultSet = checkStatement.executeQuery();
                
                if (resultSet.next() && resultSet.getInt(1) > 0) {
                    // Update existing grade
                    try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                        updateStatement.setString(1, grade);
                        updateStatement.setInt(2, studentId);
                        updateStatement.setInt(3, courseId);
                        updateStatement.setString(4, semester);
                        return updateStatement.executeUpdate() > 0;
                    }
                } else {
                    // Insert new grade
                    try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
                        insertStatement.setInt(1, studentId);
                        insertStatement.setInt(2, courseId);
                        insertStatement.setString(3, semester);
                        insertStatement.setString(4, grade);
                        return insertStatement.executeUpdate() > 0;
                    }
                }
            }
        }
    }
    
    /**
     * Get a specific student's grade for a course
     */
    public com.gosjsu.shared.Grade getStudentGrade(int studentId, int courseId, String semester) {
        String query = "SELECT grade, reportedOn FROM grade_report WHERE studentID = ? AND courseID = ? AND semester = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, studentId);
            statement.setInt(2, courseId);
            statement.setString(3, semester);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                com.gosjsu.shared.Grade grade = new com.gosjsu.shared.Grade();
                grade.setGrade(resultSet.getString("grade"));
                grade.setReportedOn(resultSet.getDate("reportedOn"));
                return grade;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving student grade", e);
        }
        
        return null;
    }
} 