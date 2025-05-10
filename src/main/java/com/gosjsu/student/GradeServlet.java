package com.gosjsu.student;

import com.gosjsu.faculty.GradeService;
import com.gosjsu.shared.Grade;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GradeServlet extends HttpServlet {
    private GradeService gradeService;

    @Override
    public void init() throws ServletException {
        super.init();
        gradeService = new GradeService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // Get student ID from session
        Integer studentId = (Integer) session.getAttribute("studentId");
        String username = (String) session.getAttribute("username");

        System.out.println("Student GradeServlet called with studentID: " + studentId);
        System.out.println("Student username from session: " + username);
        
        // If student ID is not in session, try to get it from request
        if (studentId == null) {
            String studentIdParam = req.getParameter("studentId");
            if (studentIdParam != null && !studentIdParam.isEmpty()) {
                try {
                    studentId = Integer.parseInt(studentIdParam);
                    System.out.println("Using studentId from request parameter: " + studentId);
                } catch (NumberFormatException e) {
                    System.err.println("Invalid student ID format: " + studentIdParam);
                }
            }
        }
        
        // If still no student ID and username exists, use username as student ID (String form)
        String studentIdStr = (studentId != null) ? studentId.toString() : username;
        
        if (studentIdStr == null || studentIdStr.isEmpty()) {
            System.err.println("No student ID available!");
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is required");
                    return;
                }
        
        List<Grade> grades = new ArrayList<>();
        
        try {
            System.out.println("Fetching grades for student ID: " + studentIdStr);
            // Create a new GradeService for each request to ensure fresh connection
            GradeService freshGradeService = new GradeService();
            grades = freshGradeService.getGradesForStudent(studentIdStr);
            System.out.println("Found " + (grades != null ? grades.size() : 0) + " grades");
        } catch (SQLException e) {
            System.err.println("Error fetching grades: " + e.getMessage());
            e.printStackTrace();
            // Set an error attribute instead of throwing an exception
            req.setAttribute("errorMessage", "Unable to fetch grades: " + e.getMessage());
        }
        
        // Set attributes for JSP
        req.setAttribute("grades", grades);
        
        // Forward to the JSP
        req.getRequestDispatcher("/student/grades.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String role = (String) session.getAttribute("role");

        if (!"faculty".equals(role)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Only faculty can edit grades");
            return;
        }

        String studentId = req.getParameter("studentId");
        String courseId = req.getParameter("courseId");
        String grade = req.getParameter("grade");

        try {
            // Create a fresh instance for each request
            GradeService freshGradeService = new GradeService();
            freshGradeService.updateGrade(studentId, courseId, grade);
            resp.sendRedirect(req.getContextPath() + "/grades?courseId=" + courseId);
        } catch (SQLException e) {
            System.err.println("Error updating grade: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("errorMessage", "Unable to update grade: " + e.getMessage());
            req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
        }
    }
}