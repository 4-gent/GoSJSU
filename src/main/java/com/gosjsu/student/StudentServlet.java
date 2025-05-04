package com.gosjsu.student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StudentServlet extends HttpServlet {
    private ProfileService profileService = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        Student student = profileService.getProfile(studentId);
        request.setAttribute("student", student);
        request.setAttribute("enrollments", profileService.getEnrollments(studentId));
        request.setAttribute("grades", profileService.getGrades(studentId));
        request.getRequestDispatcher("/WEB-INF/student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String field = request.getParameter("field");
        String value = request.getParameter("value");
        profileService.updateProfile(studentId, field, value);
        response.sendRedirect("student?studentId=" + studentId);
    }
}