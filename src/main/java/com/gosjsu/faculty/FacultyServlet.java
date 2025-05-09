package com.gosjsu.faculty;

import com.gosjsu.utils.DBConnection;

import com.gosjsu.shared.StudentGradeDTO;
import com.gosjsu.shared.Grade;
import com.gosjsu.student.Course;
import com.gosjsu.student.Student;
import com.gosjsu.enrollment.EnrollmentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

public class FacultyServlet extends HttpServlet {
    private FacultyProfileService facultyProfileService = new FacultyProfileService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("listEnrollments".equals(action)) {
            viewEnrollments(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addEnrollment".equals(action)) {
            addEnrollment(request, response);
        } else if ("removeEnrollment".equals(action)) {
            removeEnrollment(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }

    private void viewEnrollments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        String employeeId = (String) request.getSession().getAttribute("employeeId");

        if (courseId == null || courseId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course ID is required to list enrollments.");
            return;
        }

        try {
            EnrollmentService enrollmentService = new EnrollmentService();
            List<Student> students = enrollmentService.getEnrollmentsForCourse(employeeId, courseId);
            request.setAttribute("students", students);
            request.setAttribute("courseId", courseId);
            request.getRequestDispatcher("/faculty/rosters.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving enrollments for the course.", e);
        }
    }

    private void addEnrollment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO enrollment (studentID, courseID) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);
                statement.setString(2, courseId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/faculty/rosters?courseId=" + courseId);
    }

    private void removeEnrollment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "DELETE FROM enrollment WHERE studentID = ? AND courseID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);
                statement.setString(2, courseId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/faculty/rosters?courseId=" + courseId);
    }
}