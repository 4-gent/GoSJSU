package com.gosjsu.grades;

import com.gosjsu.faculty.GradeService;
import com.gosjsu.shared.Grade;
import com.gosjsu.shared.StudentGradeDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class GradeServlet extends HttpServlet {
    private GradeService gradeService = new GradeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String role = (String) session.getAttribute("role");
        String courseId = req.getParameter("courseId");
        String studentId = (String) session.getAttribute("username");

        try {
            if ("faculty".equals(role)) {
                // Faculty: View grades for a course
                if (courseId == null || courseId.isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course ID is required for faculty");
                    return;
                }
                List<StudentGradeDTO> grades = gradeService.getGradesForCourse(courseId);
                req.setAttribute("grades", grades);
                req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
            } else if ("student".equals(role)) {
                // Student: View their own grades
                if (studentId == null || studentId.isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is required");
                    return;
                }
                List<Grade> grades = gradeService.getGradesForStudent(studentId);
                req.setAttribute("grades", grades);
                req.getRequestDispatcher("/student/grades.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Unauthorized access");
            }
        } catch (SQLException e) {
            throw new ServletException("Error fetching grades", e);
        }
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
            gradeService.updateGrade(studentId, courseId, grade);
            resp.sendRedirect(req.getContextPath() + "/grades?courseId=" + courseId);
        } catch (SQLException e) {
            throw new ServletException("Error updating grade", e);
        }
    }
}