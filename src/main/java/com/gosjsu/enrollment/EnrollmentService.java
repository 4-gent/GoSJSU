package com.gosjsu.enrollment;

import com.gosjsu.student.Student;
import com.gosjsu.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentService {
    public List<Student> getEnrollmentsForCourse(String employeeId, String courseId) throws SQLException {
        List<Student> students = new ArrayList<>();
        String query = "SELECT s.studentID, s.student_id, s.firstName, s.lastName " +
                       "FROM Student s " +
                       "JOIN Enrollment e ON s.studentID = e.studentID " +
                       "WHERE e.courseID = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, courseId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("studentID")); // Incremental number
                student.setStudentId(resultSet.getString("student_id")); // Username
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                students.add(student);
            }
        }
        return students;
    }
}