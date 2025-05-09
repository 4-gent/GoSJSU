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
        int studentId = Integer.parseInt(request.getParameter("studentId")); // Parse String to int
        Student student = profileService.getStudentProfile(studentId); // Use int studentId
        request.setAttribute("student", student);
        request.setAttribute("enrollments", profileService.getEnrollments(studentId));
        request.setAttribute("grades", profileService.getGrades(studentId));
        request.getRequestDispatcher("/student/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId")); // Parse String to int
        String field = request.getParameter("field");
        String value = request.getParameter("value");

        // Fetch the existing student profile
        Student student = profileService.getStudentProfile(studentId);
        if (student == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
            return;
        }

        // Update the specific field
        switch (field) {
            case "firstName":
                student.setFirstName(value);
                break;
            case "lastName":
                student.setLastName(value);
                break;
            case "email":
                student.setEmail(value);
                break;
            case "major":
                student.setMajor(value);
                break;
            case "gender":
                student.setGender(value);
                break;
            case "city":
                student.setCity(value);
                break;
            case "postalAddress":
                student.setPostalAddress(value);
                break;
            case "mobileNumber":
                student.setMobileNumber(value);
                break;
            case "alternateMobileNumber":
                student.setAlternateMobileNumber(value);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid field: " + field);
                return;
        }

        // Update the student profile
        profileService.updateStudentProfile(student);

        // Redirect back to the student page
        response.sendRedirect("student?studentId=" + studentId);
    }
}