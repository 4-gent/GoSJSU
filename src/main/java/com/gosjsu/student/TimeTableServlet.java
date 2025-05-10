package com.gosjsu.student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet that handles the timetable page requests.
 * Retrieves student's enrolled courses for the current semester.
 */
public class TimeTableServlet extends HttpServlet {
    
    // Current semester - must match EnrollmentServlet
    private static final String CURRENT_SEMESTER = "Fall 2025";
    private ProfileService profileService = new ProfileService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Student student = (Student) session.getAttribute("student");
        
        // If no student in session, try to get from student ID
        if (student == null) {
            Integer studentId = (Integer) session.getAttribute("studentId");
            if (studentId != null) {
                student = profileService.getStudentProfile(studentId);
                if (student != null) {
                    session.setAttribute("student", student);
                }
            }
        }
        
        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        // Get enrolled courses
        List<Course> enrollments = profileService.getEnrollments(student.getId());
        
        req.setAttribute("student", student);
        req.setAttribute("enrollments", enrollments);
        req.setAttribute("currentSemester", CURRENT_SEMESTER);
        
        req.getRequestDispatcher("/student/timetable.jsp").forward(req, resp);
    }
} 