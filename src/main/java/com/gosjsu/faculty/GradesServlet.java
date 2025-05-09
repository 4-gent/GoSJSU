package com.gosjsu.faculty;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gosjsu.student.Course;
import com.gosjsu.student.Student;
import com.gosjsu.shared.StudentGradeDTO;

public class GradesServlet extends HttpServlet {
    private static final String CURRENT_SEMESTER = "Fall 2025";
    private FacultyGradeService gradeService = new FacultyGradeService();
    private FacultyProfileService profileService = new FacultyProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer employeeId = (Integer) session.getAttribute("employeeId");
        
        System.out.println("GradesServlet - doGet - employeeId: " + employeeId);
        
        if (employeeId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        Faculty faculty = profileService.getFacultyProfile(employeeId);
        if (faculty == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Faculty not found");
            return;
        }
        
        String courseIdParam = req.getParameter("courseId");
        System.out.println("GradesServlet - doGet - courseId: " + courseIdParam);
        
        try {
            // If a specific course is selected
            if (courseIdParam != null && !courseIdParam.isEmpty()) {
                int courseId = Integer.parseInt(courseIdParam);
                Course course = gradeService.getCourseById(courseId);
                
                if (course == null) {
                    req.setAttribute("errorMessage", "Course not found");
                    req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
                    return;
                }
                
                // Check if faculty teaches this course
                if (!gradeService.facultyTeachesCourse(employeeId, courseId, CURRENT_SEMESTER)) {
                    req.setAttribute("errorMessage", "You are not authorized to manage grades for this course");
                    req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
                    return;
                }
                
                // Get enrolled students and their grades
                List<StudentGradeDTO> studentGrades = gradeService.getStudentGradesForCourse(courseId, CURRENT_SEMESTER);
                System.out.println("GradesServlet - Found " + studentGrades.size() + " students enrolled in course " + courseId);
                
                req.setAttribute("course", course);
                req.setAttribute("studentGrades", studentGrades);
                req.setAttribute("currentSemester", CURRENT_SEMESTER);
                req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
            } 
            // Show all courses taught by the faculty
            else {
                List<Course> coursesTaught = profileService.getCoursesTaught(employeeId, CURRENT_SEMESTER);
                
                // For each course, get grading progress
                Map<Integer, Integer> gradingProgress = new HashMap<>();
                for (Course course : coursesTaught) {
                    int courseId = course.getCourseId();
                    int progress = gradeService.getGradingProgressForCourse(employeeId, courseId, CURRENT_SEMESTER);
                    gradingProgress.put(courseId, progress);
                }
                
                req.setAttribute("coursesTaught", coursesTaught);
                req.setAttribute("gradingProgress", gradingProgress);
                req.setAttribute("currentSemester", CURRENT_SEMESTER);
                req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            req.getRequestDispatcher("/faculty/grades.jsp").forward(req, resp);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer employeeId = (Integer) session.getAttribute("employeeId");
        
        System.out.println("GradesServlet - doPost - employeeId: " + employeeId);
        
        if (employeeId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        String courseIdParam = req.getParameter("courseId");
        String action = req.getParameter("action");
        
        System.out.println("GradesServlet - doPost - courseId: " + courseIdParam + ", action: " + action);
        
        if (courseIdParam == null || action == null) {
            resp.sendRedirect(req.getContextPath() + "/faculty/grades");
            return;
        }
        
        try {
            int courseId = Integer.parseInt(courseIdParam);
            
            // Check if faculty teaches this course
            if (!gradeService.facultyTeachesCourse(employeeId, courseId, CURRENT_SEMESTER)) {
                req.setAttribute("errorMessage", "You are not authorized to manage grades for this course");
                resp.sendRedirect(req.getContextPath() + "/faculty/grades");
                return;
            }
            
            if ("submitGrades".equals(action)) {
                // Get all student IDs and their grades from the form
                Map<String, String[]> parameterMap = req.getParameterMap();
                boolean success = true;
                
                System.out.println("GradesServlet - Processing grade submissions for course " + courseId);
                
                for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                    String paramName = entry.getKey();
                    if (paramName.startsWith("grade_")) {
                        String studentIdStr = paramName.substring("grade_".length());
                        int studentId = Integer.parseInt(studentIdStr);
                        String grade = entry.getValue()[0];
                        
                        System.out.println("GradesServlet - Processing grade for studentId: " + studentId + ", grade: " + grade);
                        
                        if (grade != null && !grade.trim().isEmpty()) {
                            boolean result = gradeService.submitGrade(studentId, courseId, CURRENT_SEMESTER, grade);
                            System.out.println("GradesServlet - Grade submission result: " + (result ? "Success" : "Failed"));
                            if (!result) {
                                success = false;
                            }
                        }
                    }
                }
                
                if (success) {
                    req.setAttribute("successMessage", "Grades submitted successfully");
                    System.out.println("GradesServlet - All grades submitted successfully");
                } else {
                    req.setAttribute("errorMessage", "There was an error submitting some grades");
                    System.out.println("GradesServlet - Some grade submissions failed");
                }
            }
            
            resp.sendRedirect(req.getContextPath() + "/faculty/grades?courseId=" + courseId);
            
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/faculty/grades");
        }
    }
} 