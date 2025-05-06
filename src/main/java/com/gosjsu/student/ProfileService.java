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
        String query = "SELECT * FROM students WHERE student_id = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             
            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setStudentId(resultSet.getString("student_id"));
                student.setFirstName(resultSet.getString("first_name"));
                student.setLastName(resultSet.getString("last_name"));
                student.setEmail(resultSet.getString("email"));
                student.setMajor(resultSet.getString("major"));
                // Handle date of birth instead of age
                if (resultSet.getDate("date_of_birth") != null) {
                    student.setDateOfBirth(resultSet.getDate("date_of_birth"));
                }
                student.setGender(resultSet.getString("gender"));
                student.setCity(resultSet.getString("city"));
                student.setPostalAddress(resultSet.getString("postal_address"));
                student.setMobileNumber(resultSet.getString("mobile_number"));
                student.setAlternateMobileNumber(resultSet.getString("alternate_mobile_number"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching student profile", e);
        }
        
        return student;
    }

    public boolean updateStudentProfile(Student student) {
        String query = "UPDATE students SET first_name = ?, last_name = ?, email = ?, major = ?, " +
                       "gender = ?, date_of_birth = ?, city = ?, postal_address = ?, " +
                       "mobile_number = ?, alternate_mobile_number = ? WHERE student_id = ?";
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
            preparedStatement.setString(11, student.getStudentId());
            
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

        updateStudentProfile(student);
    }
}