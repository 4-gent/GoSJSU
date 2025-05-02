package com.gosjsu.student;

import com.gosjsu.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

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
                student.setId(resultSet.getInt("studentID"));
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                student.setEmail(resultSet.getString("email"));
                student.setMajor(resultSet.getString("major"));
                student.setAge(resultSet.getInt("age"));
                student.setContactInfo(resultSet.getString("contactInfo"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching student profile", e);
        }
        
        return student;
    }

    public boolean updateStudentProfile(Student student) {
        String query = "UPDATE Students SET firstName = ?, lastName = ?, email = ?, major = ?, age = ?, contactInfo = ? WHERE studentID = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getEmail());
            preparedStatement.setString(4, student.getMajor());
            preparedStatement.setInt(5, student.getAge());
            preparedStatement.setString(6, student.getContactInfo());
            preparedStatement.setInt(7, student.getId());
            
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating student profile", e);
        }
    }

    public Student getProfile(String studentId) {
        return getStudentProfile(studentId);
    }

    public List<Object> getEnrollments(String studentId) {
        // TODO: Implement actual enrollment retrieval
        return Collections.emptyList();
    }

    public List<Object> getGrades(String studentId) {
        // TODO: Implement actual grade retrieval
        return Collections.emptyList();
    }

    public void updateProfile(String studentId, String field, String value) {
        Student student = getProfile(studentId);
        if (student == null) {
            throw new RuntimeException("Student not found");
        }

        switch (field) {
            case "firstName":
                student.setFirstName(value);
                break;
            case "lastName":
                student.setLastName(value);
                break;
            case "email":
                student.setEmail(value);
                break;
            case "major":
                student.setMajor(value);
                break;
            case "age":
                student.setAge(Integer.parseInt(value));
                break;
            case "contactInfo":
                student.setContactInfo(value);
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }

        updateStudentProfile(student);
    }
}