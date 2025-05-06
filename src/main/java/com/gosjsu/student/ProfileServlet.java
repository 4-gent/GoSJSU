package com.gosjsu.student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/student/profile")
public class ProfileServlet extends HttpServlet {
    private final ProfileService profileService = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String studentId = req.getParameter("studentId");
        
        // Fetch student profile from the service
        Student student = profileService.getStudentProfile(studentId);
        
        // Set student object as an attribute to be used in the JSP
        req.setAttribute("student", student);
        
        // Forward the request to the profile JSP in the student directory
        req.getRequestDispatcher("/student/profile.jsp")
           .forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        // Handle profile updates here if needed
        String studentId = req.getParameter("studentId");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String major = req.getParameter("major");
        String gender = req.getParameter("gender");
        String city = req.getParameter("city");
        String postalAddress = req.getParameter("postalAddress");
        String mobileNumber = req.getParameter("mobileNumber");
        String alternateMobileNumber = req.getParameter("alternateMobileNumber");
        String dateOfBirthStr = req.getParameter("dateOfBirth");
        
        // Create a student object with the form data
        Student student = new Student();
        student.setStudentId(studentId);
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setEmail(email);
        student.setMajor(major);
        student.setGender(gender);
        student.setCity(city);
        student.setPostalAddress(postalAddress);
        student.setMobileNumber(mobileNumber);
        student.setAlternateMobileNumber(alternateMobileNumber);
        
        // Parse date of birth if provided
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date dateOfBirth = dateFormat.parse(dateOfBirthStr);
                student.setDateOfBirth(dateOfBirth);
            } catch (ParseException e) {
                // Log or handle the error
                System.err.println("Error parsing date of birth: " + e.getMessage());
            }
        }
        
        // Update the student profile using the service
        profileService.updateStudentProfile(student);
        
        // Redirect back to profile page after update
        resp.sendRedirect(req.getContextPath() + "/student/profile?studentId=" + studentId);
    }
} 