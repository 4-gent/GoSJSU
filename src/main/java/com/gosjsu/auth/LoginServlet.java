package com.gosjsu.auth;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate credentials against SJSU authentication service
        if (authenticateUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", getUserRole(username));

            // Redirect to role-specific dashboard
            String role = (String) session.getAttribute("role");
            if ("student".equals(role)) {
                response.sendRedirect("student/dashboard.jsp");
            } else if ("faculty".equals(role)) {
                response.sendRedirect("faculty/dashboard.jsp");
            } else if ("admin".equals(role)) {
                response.sendRedirect("admin/dashboard.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }

    private boolean authenticateUser(String username, String password) {
        // Implement authentication logic with SJSU service
        return true; // Placeholder for actual authentication
    }

    private String getUserRole(String username) {
        // Implement logic to retrieve user role based on username
        return "student"; // Placeholder for actual role retrieval
    }
}