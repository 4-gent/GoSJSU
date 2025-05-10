package com.gosjsu.student;

import com.gosjsu.faculty.GradeService;
import com.gosjsu.shared.Grade;
import com.gosjsu.shared.StudentGradeDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpSession;

// Removing WebServlet annotation since it's defined in web.xml
public class StudentDashboardServlet extends HttpServlet {
    private ProfileService profileService = new ProfileService();
    private GradeService gradeService = new GradeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Integer studentId = (Integer) session.getAttribute("studentId"); // Retrieve studentID from session
        String username = (String) session.getAttribute("username");

        System.out.println("Student Dashboard Servlet studentID: " + studentId);
        System.out.println("Student Dashboard Servlet username: " + username);

        if (studentId == null && (username == null || username.isEmpty())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Use studentId if available, otherwise use username
        String studentIdStr = (studentId != null) ? studentId.toString() : username;
        
        // Use the overloaded methods that accept String parameters directly
        Student student = profileService.getStudentProfile(studentIdStr);
        if (student == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
            return;
        }

        List<Course> enrollments = profileService.getEnrollments(studentIdStr);
        List<StudentGradeDTO> studentGrades = profileService.getGrades(studentIdStr);
        
        // Get complete grade information for GPA calculation
        List<Grade> allGrades = null;
        try {
            allGrades = gradeService.getGradesForStudent(studentIdStr);
            System.out.println("Retrieved " + (allGrades != null ? allGrades.size() : 0) + " grades for GPA calculation");
        } catch (SQLException e) {
            System.err.println("Error retrieving grades for GPA calculation: " + e.getMessage());
            e.printStackTrace();
        }
        
        // Calculate GPA
        double gpa = 0.0;
        if (allGrades != null && !allGrades.isEmpty()) {
            gpa = GPACalculator.calculateGPA(allGrades);
            
            // Also calculate semester-specific GPAs
            double currentSemesterGPA = GPACalculator.calculateSemesterGPA(allGrades, "Fall 2025");
            double previousSemesterGPA = GPACalculator.calculateSemesterGPA(allGrades, "Spring 2025");
            
            req.setAttribute("currentSemesterGPA", currentSemesterGPA);
            req.setAttribute("previousSemesterGPA", previousSemesterGPA);
        }

        System.out.println("Dashboard Enrollments: " + enrollments);
        System.out.println("Dashboard Enrollments:");
        if (enrollments != null && !enrollments.isEmpty()) {
            for (Course course : enrollments) {
                System.out.println("Course ID: " + course.getCourseId() + ", Course Name: " + course.getCourseName());
            }
        } else {
            System.out.println("No enrollments found.");
        }
        
        System.out.println("Calculated GPA: " + gpa);
        
        req.setAttribute("student", student);
        req.setAttribute("enrollments", enrollments);
        req.setAttribute("grades", studentGrades);
        req.setAttribute("gpa", gpa);
        req.getRequestDispatcher("/student/dashboard.jsp").forward(req, resp);
    }
}