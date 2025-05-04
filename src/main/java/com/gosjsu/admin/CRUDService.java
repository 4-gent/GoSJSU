package com.gosjsu.admin;

import com.gosjsu.utils.DBConnection;
import com.gosjsu.student.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CRUDService {

    private Connection connection;

    public CRUDService() {
        try {
            connection = DBConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

    // public List<Student> readStudents() throws SQLException {
    //     List<Student> students = new ArrayList<>();
    //     String sql = "SELECT * FROM students";
    //     try (PreparedStatement pstmt = connection.prepareStatement(sql);
    //          ResultSet rs = pstmt.executeQuery()) {
    //         while (rs.next()) {
    //             Student student = new Student(rs.getInt("id"), rs.getString("first_name"), 
    //                                           rs.getString("last_name"), rs.getString("email"));
    //             students.add(student);
    //         }
    //     }
    //     return students;
    // }

    public void addStudent(javax.servlet.http.HttpServletRequest req) {
        // stub: extract params and INSERT
    }

    public void updateStudent(javax.servlet.http.HttpServletRequest req) {
        // stub: extract params and UPDATE
    }

    public void deleteStudent(javax.servlet.http.HttpServletRequest req) {
        // stub: extract id and DELETE
    }

    /**
     * Fetch all students.
     */
    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT id, first_name, last_name, email FROM students";
        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("first_name") + " " + rs.getString("last_name"));
                // optionally set email if you add that field
                students.add(s);
            }
        }
        return students;
    }

    /**
     * Fetch all courses.
     */
    public List<Object> getAllCourses() {
        List<Object> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses";
        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                // Create a Map to hold course data
                Map<String, Object> course = new HashMap<>();
                course.put("id", rs.getString("courseID"));
                course.put("name", rs.getString("courseName"));
                course.put("department", rs.getString("department"));
                course.put("credits", rs.getInt("credits"));
                courses.add(course);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching courses", e);
        }
        return courses;
    }

    /**
     * Fetch all faculty.
     */
    public List<Object> getAllFaculty() {
        List<Object> faculty = new ArrayList<>();
        String sql = "SELECT * FROM faculty";
        try (PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                // Create a Map to hold faculty data
                Map<String, Object> member = new HashMap<>();
                member.put("id", rs.getString("facultyID"));
                member.put("name", rs.getString("name"));
                member.put("department", rs.getString("department"));
                member.put("position", rs.getString("position"));
                faculty.add(member);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching faculty", e);
        }
        return faculty;
    }
}