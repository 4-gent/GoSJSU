package com.gosjsu.student;

import com.gosjsu.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileService {

    public Student getStudentProfile(String studentId) {
        Student student = null;
        String query = "SELECT * FROM Students WHERE studentID = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             
            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getString("studentID"));
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                student.setAge(resultSet.getInt("age"));
                student.setContactInfo(resultSet.getString("contactInfo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return student;
    }

    public boolean updateStudentProfile(Student student) {
        String query = "UPDATE Students SET firstName = ?, lastName = ?, age = ?, contactInfo = ? WHERE studentID = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setInt(3, student.getAge());
            preparedStatement.setString(4, student.getContactInfo());
            preparedStatement.setString(5, student.getId());
            
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}