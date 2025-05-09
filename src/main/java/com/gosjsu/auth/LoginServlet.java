package com.gosjsu.auth;

import com.gosjsu.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the login page for GET requests
        response.sendRedirect(request.getContextPath() + "/student/login.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username"); // student_id or employee_id
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        System.out.println("Doing login servlet");

        try (Connection conn = DBConnection.getConnection()) {
            int id = authenticateUser(conn, username, password, role); // Get studentID or employeeID
            if (id != -1) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username); // Store student_id or employee_id
                session.setAttribute("password", password); // Optional: Store password if needed
                System.out.println("User authenticated successfully");
                System.out.println("Role: " + role);
                System.out.println("Username: " + username);
                System.out.println("ID: " + id);

                if ("student".equals(role)) {
                    session.setAttribute("studentId", id); // Store studentID (incremental number)
                    session.setAttribute("student_id", username); // Store student_id (username)
                    System.out.println("Redirecting to: " + request.getContextPath() + "/student/dashboard?studentId=" + username);
                    response.sendRedirect(request.getContextPath() + "/student/dashboard?studentId=" + username);
                } else if ("faculty".equals(role)) {
                    session.setAttribute("employeeId", id); // Store employeeID (incremental number)
                    session.setAttribute("employee_id", username); // Store employee_id (username)
                    System.out.println("Redirecting to: " + request.getContextPath() + "/faculty/dashboard?employeeId=" + username);
                    response.sendRedirect(request.getContextPath() + "/faculty/dashboard?employeeId=" + username);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
                if ("student".equals(role)) {
                    request.getRequestDispatcher("/student/login.jsp").forward(request, response);
                } else if ("faculty".equals(role)) {
                    request.getRequestDispatcher("/faculty/login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    private int authenticateUser(Connection conn, String username, String password, String role) throws SQLException {
        String query;
        if ("student".equals(role)) {
            query = "SELECT studentID FROM student WHERE student_id = ? AND password = ?";
        } else if ("faculty".equals(role)) {
            query = "SELECT employeeID FROM faculty WHERE employee_id = ? AND password = ?";
        } else {
            return -1; // Invalid role
        }

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username); // student_id or employee_id
            pstmt.setString(2, password); // password
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1); // Return studentID or employeeID (incremental number)
                }
            }
        }
        return -1; // Authentication failed
    }
}