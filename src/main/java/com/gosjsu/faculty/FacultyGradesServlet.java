package com.gosjsu.faculty;

import com.gosjsu.shared.StudentGradeDTO;
import com.gosjsu.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/faculty/grades")
public class FacultyGradesServlet extends HttpServlet {
    private GradeService gradeService = new GradeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // Use false to avoid creating a new session
        if (session == null || session.getAttribute("employeeId") == null) {
            System.out.println("No session or employeeId found. Redirecting to login.");
            resp.sendRedirect(req.getContextPath() + "/faculty/login.jsp");
            return;
        }

        String courseId = req.getParameter("courseId");
        if (courseId == null || courseId.isEmpty()) {
            System.out.println("No courseId provided. Redirecting to dashboard.");
            resp.sendRedirect(req.getContextPath() + "/faculty/dashboard");
            return;
        }

        Integer employeeId = (Integer) session.getAttribute("employeeId");
        System.out.println("FacultyGradesServlet handling request for employeeId: " + employeeId + ", courseId: " + courseId);

        try {
            // Fetch grades for the course
            List<StudentGradeDTO> grades = gradeService.getGradesForFacultyCourse(employeeId.toString(), courseId);
            req.setAttribute("grades", grades);
            req.setAttribute("courseId", courseId);

            // Forward to the grades JSP
            req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException("Error retrieving grades for the course.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String courseId = req.getParameter("courseId");

        if ("assignGrade".equals(action)) {
            assignGrade(req, resp, courseId);
        } else if ("modifyGrade".equals(action)) {
            modifyGrade(req, resp, courseId);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    private void assignGrade(HttpServletRequest req, HttpServletResponse resp, String courseId) throws IOException {
        String studentId = req.getParameter("studentId");
        String grade = req.getParameter("grade");

        try {
            gradeService.assignGrade(studentId, courseId, grade);
        } catch (SQLException e) {
            throw new RuntimeException("Error assigning grade", e);
        }

        resp.sendRedirect(req.getContextPath() + "/faculty/grades?courseId=" + courseId);
    }

    private void modifyGrade(HttpServletRequest req, HttpServletResponse resp, String courseId) throws IOException {
        String studentId = req.getParameter("studentId");
        String grade = req.getParameter("grade");

        try {
            gradeService.updateGrade(studentId, courseId, grade);
        } catch (SQLException e) {
            throw new RuntimeException("Error modifying grade", e);
        }

        resp.sendRedirect(req.getContextPath() + "/faculty/grades?courseId=" + courseId);
    }
}