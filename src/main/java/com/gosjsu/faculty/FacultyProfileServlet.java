package com.gosjsu.faculty;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FacultyProfileServlet extends HttpServlet {
    private FacultyProfileService profileService = new FacultyProfileService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer employeeId = (Integer) session.getAttribute("employeeId");
        
        System.out.println("FacultyProfileServlet - employeeId: " + employeeId);
        
        if (employeeId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        try {
            Faculty faculty = profileService.getFacultyProfile(employeeId);
            if (faculty == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Faculty profile not found");
                return;
            }
            
            req.setAttribute("faculty", faculty);
            req.getRequestDispatcher("/faculty/profile.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving faculty profile");
        }
    }
} 