package com.gosjsu.student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    private ProfileService profileService;

    @Override
    public void init() throws ServletException {
        profileService = new ProfileService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewProfile".equals(action)) {
            viewProfile(request, response);
        } else if ("enrollments".equals(action)) {
            viewEnrollments(request, response);
        } else if ("grades".equals(action)) {
            viewGrades(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void viewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to fetch and display student profile
        String studentId = request.getParameter("studentId");
        request.setAttribute("profile", profileService.getProfile(studentId));
        request.getRequestDispatcher("/WEB-INF/views/student/profile.jsp").forward(request, response);
    }

    private void viewEnrollments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to fetch and display student enrollments
        String studentId = request.getParameter("studentId");
        request.setAttribute("enrollments", profileService.getEnrollments(studentId));
        request.getRequestDispatcher("/WEB-INF/views/student/enrollments.jsp").forward(request, response);
    }

    private void viewGrades(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to fetch and display student grades
        String studentId = request.getParameter("studentId");
        request.setAttribute("grades", profileService.getGrades(studentId));
        request.getRequestDispatcher("/WEB-INF/views/student/grades.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            updateProfile(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic to update student profile
        String studentId = request.getParameter("studentId");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        profileService.updateProfile(studentId, phone, email);
        response.sendRedirect("student?action=viewProfile&studentId=" + studentId);
    }
}