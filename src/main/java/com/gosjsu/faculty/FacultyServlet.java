package com.gosjsu.faculty;

import com.gosjsu.utils.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/faculty")
public class FacultyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewEnrollments".equals(action)) {
            viewEnrollments(request, response);
        } else if ("manageGrades".equals(action)) {
            manageGrades(request, response);
        } else {
            response.sendRedirect("dashboard.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("assignGrade".equals(action)) {
            assignGrade(request, response);
        } else if ("modifyGrade".equals(action)) {
            modifyGrade(request, response);
        }
    }

    private void viewEnrollments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to retrieve and display student enrollments
    }

    private void manageGrades(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to retrieve and display grades for students
    }

    private void assignGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        String grade = request.getParameter("grade");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO Grade_Report (studentID, courseID, grade) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);
                statement.setString(2, courseId);
                statement.setString(3, grade);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("dashboard.jsp");
    }

    private void modifyGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        String grade = request.getParameter("grade");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "UPDATE Grade_Report SET grade = ? WHERE studentID = ? AND courseID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, grade);
                statement.setString(2, studentId);
                statement.setString(3, courseId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("dashboard.jsp");
    }
}