package com.gosjsu.admin;

import com.gosjsu.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CRUDService {

    private Connection connection;

    public CRUDService() {
        connection = DBConnection.getConnection();
    }

    public void createStudent(String firstName, String lastName, String email) throws SQLException {
        String sql = "INSERT INTO students (first_name, last_name, email) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.executeUpdate();
        }
    }

    public List<Student> readStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students";
        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Student student = new Student(rs.getInt("id"), rs.getString("first_name"), 
                                              rs.getString("last_name"), rs.getString("email"));
                students.add(student);
            }
        }
        return students;
    }

    public void updateStudent(int id, String firstName, String lastName, String email) throws SQLException {
        String sql = "UPDATE students SET first_name = ?, last_name = ?, email = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setInt(4, id);
            pstmt.executeUpdate();
        }
    }

    public void deleteStudent(int id) throws SQLException {
        String sql = "DELETE FROM students WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}