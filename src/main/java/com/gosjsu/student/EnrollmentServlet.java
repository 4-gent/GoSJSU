package com.gosjsu.student;

import com.gosjsu.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/student/enrollment")
public class EnrollmentServlet extends HttpServlet {

    // Current semester - used for enrollment
    private static final String CURRENT_SEMESTER = "Fall 2025";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Try to get student from session
        Student student = (Student) session.getAttribute("student");
        // If not in session, try request attribute and then store it in session
        if (student == null) {
            student = (Student) request.getAttribute("student");
            if (student != null) {
                session.setAttribute("student", student);
            }
        }
        
        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/student/login.jsp");
            return;
        }
        
        try {
            // Get all available courses
            List<Course> availableCourses = getAllCourses();
            request.setAttribute("availableCourses", availableCourses);
            
            // Get student's currently enrolled courses
            List<Course> enrolledCourses = getEnrolledCourses(student.getId());
            request.setAttribute("enrolledCourses", enrolledCourses);
            
            request.setAttribute("student", student);
            request.getRequestDispatcher("/student/enrollment.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving courses", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Similar check for student in doPost
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            student = (Student) request.getAttribute("student");
            if (student != null) {
                session.setAttribute("student", student);
            }
        }
        
        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/student/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        
        try {
            if ("enroll".equals(action)) {
                enrollStudentInCourse(student.getId(), courseId);
            } else if ("drop".equals(action)) {
                dropStudentFromCourse(student.getId(), courseId);
            }
            
            response.sendRedirect(request.getContextPath() + "/student/enrollment");
        } catch (SQLException e) {
            throw new ServletException("Error processing enrollment action", e);
        }
    }
    
    private List<Course> getAllCourses() throws SQLException {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT courseID, name FROM course";
        
        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(resultSet.getInt("courseID"));
                course.setCourseName(resultSet.getString("name"));
                courses.add(course);
            }
        }
        
        return courses;
    }
    
    private List<Course> getEnrolledCourses(int studentId) throws SQLException {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.name FROM course c " +
                       "JOIN enrollment e ON c.courseID = e.courseID " +
                       "WHERE e.studentID = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, studentId);
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(resultSet.getInt("courseID"));
                course.setCourseName(resultSet.getString("name"));
                courses.add(course);
            }
        }
        
        return courses;
    }
    
    private void enrollStudentInCourse(int studentId, int courseId) throws SQLException {
        String query = "INSERT INTO enrollment (studentID, courseID, semester, enrolledOn) VALUES (?, ?, ?, CURRENT_DATE)";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, studentId);
            statement.setInt(2, courseId);
            statement.setString(3, CURRENT_SEMESTER);
            statement.executeUpdate();
        }
    }
    
    private void dropStudentFromCourse(int studentId, int courseId) throws SQLException {
        String query = "DELETE FROM enrollment WHERE studentID = ? AND courseID = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, studentId);
            statement.setInt(2, courseId);
            statement.executeUpdate();
        }
    }
} 