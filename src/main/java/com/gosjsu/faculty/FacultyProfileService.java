package com.gosjsu.faculty;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.gosjsu.utils.DBConnection;
import com.gosjsu.shared.Grade;
import com.gosjsu.student.Course;
import com.gosjsu.faculty.Faculty;

public class FacultyProfileService {
    public Faculty getFacultyProfile(int employeeId) {
        String query = "SELECT * FROM Faculty WHERE employeeID = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, employeeId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Faculty faculty = new Faculty();
                faculty.setId(resultSet.getInt("employeeID"));
                faculty.setFirstName(resultSet.getString("firstName"));
                faculty.setLastName(resultSet.getString("lastName"));
                faculty.setEmail(resultSet.getString("email"));
                return faculty;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching faculty profile", e);
        }
        return null;
    }

    public List<Course> getCoursesTaught(int employeeId) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.name " +
                    "FROM Course c " +
                    "JOIN teaches t ON c.courseID = t.courseID " +
                    "WHERE t.employeeID = ?";

        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, employeeId);
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
}