package com.gosjsu.student;

import com.gosjsu.shared.Grade;
import com.gosjsu.shared.StudentGradeDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;

// Removing WebServlet annotation since it's defined in web.xml
public class StudentDashboardServlet extends HttpServlet {
    private ProfileService profileService = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Integer studentId = (Integer) session.getAttribute("studentId"); // Retrieve studentID from session

        System.out.println("Student Dashboard Servlet studentID: " + studentId);

        if (studentId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        Student student = profileService.getStudentProfile(studentId);
        if (student == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
            return;
        }

        List<Course> enrollments = profileService.getEnrollments(studentId);
        List<StudentGradeDTO> grades = profileService.getGrades(studentId);

        System.out.println("Dashboard Enrollments: " + enrollments);
        System.out.println("Dashboard Enrollments:");
        if (enrollments != null && !enrollments.isEmpty()) {
            for (Course course : enrollments) {
                System.out.println("Course ID: " + course.getCourseId() + ", Course Name: " + course.getCourseName());
            }
        } else {
            System.out.println("No enrollments found.");
        }
        req.setAttribute("student", student);
        req.setAttribute("enrollments", enrollments);
        req.setAttribute("grades", grades);
        req.getRequestDispatcher("/student/dashboard.jsp").forward(req, resp);
    }
}