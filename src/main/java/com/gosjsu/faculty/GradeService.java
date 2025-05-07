package com.gosjsu.faculty;

import com.gosjsu.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public String getGrade(String studentId, String courseId) throws SQLException {
        String query = "SELECT grade FROM Grade_Report WHERE studentID = ? AND courseID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, studentId);
            preparedStatement.setString(2, courseId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("grade");
            }
        }
        return null;
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
}