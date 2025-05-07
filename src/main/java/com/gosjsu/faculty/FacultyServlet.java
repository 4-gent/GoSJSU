package com.gosjsu.faculty;

import com.gosjsu.utils.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FacultyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        String facultyId = request.getParameter("facultyId");
        
        // Debug information to console
        System.out.println("FacultyServlet handling path: " + path);
        System.out.println("Faculty ID: " + facultyId);
        
        if (facultyId == null || facultyId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        // Set facultyId as request attribute to make it available in JSPs
        request.setAttribute("facultyId", facultyId);

        // Use exact path matching to avoid recursive forwarding
        if (path.equals("/faculty/dashboard")) {
            request.getRequestDispatcher("/faculty/dashboard.jsp").forward(request, response);
        } else if (path.equals("/faculty/courses")) {
            request.getRequestDispatcher("/faculty/courses.jsp").forward(request, response);
        } else if (path.equals("/faculty/rosters")) {
            request.getRequestDispatcher("/faculty/rosters.jsp").forward(request, response);
        } else if (path.equals("/faculty/grades")) {
            request.getRequestDispatcher("/faculty/grades.jsp").forward(request, response);
        } else if (path.equals("/faculty/reports")) {
            request.getRequestDispatcher("/faculty/reports.jsp").forward(request, response);
        } else if (path.equals("/faculty/profile")) {
            request.getRequestDispatcher("/faculty/profile.jsp").forward(request, response);
        } else if (path.equals("/faculty")) {
            // Direct /faculty path to dashboard without causing recursion
            response.sendRedirect(request.getContextPath() + "/faculty/dashboard?facultyId=" + facultyId);
        } else {
            String action = request.getParameter("action");

            if ("viewEnrollments".equals(action)) {
                viewEnrollments(request, response);
            } else if ("manageGrades".equals(action)) {
                manageGrades(request, response);
            } else {
                // Redirect to dashboard instead of forwarding to avoid recursion
                response.sendRedirect(request.getContextPath() + "/faculty/dashboard?facultyId=" + facultyId);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String facultyId = request.getParameter("facultyId");
        
        // Set facultyId as request attribute
        request.setAttribute("facultyId", facultyId);

        if ("assignGrade".equals(action)) {
            assignGrade(request, response);
        } else if ("modifyGrade".equals(action)) {
            modifyGrade(request, response);
        } else {
            // Default to dashboard for unrecognized actions
            response.sendRedirect(request.getContextPath() + "/faculty/dashboard?facultyId=" + facultyId);
        }
    }

    private void viewEnrollments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to retrieve and display student enrollments
        String facultyId = request.getParameter("facultyId");
        request.getRequestDispatcher("/faculty/rosters.jsp").forward(request, response);
    }

    private void manageGrades(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to retrieve and display grades for students
        String facultyId = request.getParameter("facultyId");
        request.getRequestDispatcher("/faculty/grades.jsp").forward(request, response);
    }

    private void assignGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        String grade = request.getParameter("grade");
        String facultyId = request.getParameter("facultyId");

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

        response.sendRedirect(request.getContextPath() + "/faculty/dashboard?facultyId=" + facultyId);
    }

    private void modifyGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        String grade = request.getParameter("grade");
        String facultyId = request.getParameter("facultyId");

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

        response.sendRedirect(request.getContextPath() + "/faculty/dashboard?facultyId=" + facultyId);
    }
}