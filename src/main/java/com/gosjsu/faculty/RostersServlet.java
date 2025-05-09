package com.gosjsu.faculty;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gosjsu.student.Course;
import com.gosjsu.student.Student;
import com.gosjsu.shared.Grade;

public class RostersServlet extends HttpServlet {
    private static final String CURRENT_SEMESTER = "Fall 2025";
    private FacultyProfileService profileService = new FacultyProfileService();
    private FacultyGradeService gradeService = new FacultyGradeService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer employeeId = (Integer) session.getAttribute("employeeId");
        
        System.out.println("RostersServlet - employeeId: " + employeeId);
        
        if (employeeId == null) {
            // Redirect to login if not logged in
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        // Get the courses taught by this faculty member
        List<Course> coursesTaught = profileService.getCoursesTaught(employeeId, CURRENT_SEMESTER);
        req.setAttribute("coursesTaught", coursesTaught);
        
        // Check if a course is selected
        String courseIdStr = req.getParameter("courseId");
        if (courseIdStr != null && !courseIdStr.isEmpty()) {
            int courseId = Integer.parseInt(courseIdStr);
            
            // Get the students enrolled in this course
            List<Student> students = profileService.getStudentsInCourse(courseId, CURRENT_SEMESTER);
            req.setAttribute("students", students);
            
            // Get grades for each student in this course
            for (Student student : students) {
                Grade grade = gradeService.getStudentGrade(student.getId(), courseId, CURRENT_SEMESTER);
                if (grade != null) {
                    req.setAttribute("grades" + student.getId(), grade.getGrade());
                }
            }
        }
        
        req.getRequestDispatcher("/faculty/rosters.jsp").forward(req, resp);
    }
} 