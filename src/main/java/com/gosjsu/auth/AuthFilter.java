package com.gosjsu.auth;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String uri = httpRequest.getRequestURI();
        String ctx = httpRequest.getContextPath();

        // Skip static resources so that CSS, JS, and images are served without authentication
        if (uri.startsWith(ctx + "/css/") || uri.startsWith(ctx + "/js/") ||
            uri.startsWith(ctx + "/images/") || uri.matches(".*\\.(css|js|png|jpg|jpeg|gif)$")) {
            chain.doFilter(request, response);
            return;
        }

        // Allow authenticated users (session-based) to access secured pages without requiring parameters
        HttpSession existingSession = httpRequest.getSession(false);
        if (existingSession != null && (existingSession.getAttribute("studentId") != null || existingSession.getAttribute("employeeId") != null)) {
            chain.doFilter(request, response);
            return;
        }

        // DEMO MODE: Skip all authentication for demo purposes
        // Get student or faculty ID from request parameters
        String studentId = httpRequest.getParameter("studentId");
        String employeeId = httpRequest.getParameter("employeeId");
        
        // For demo, allow access directly as long as the ID parameter is present
        if (studentId != null || employeeId != null) {
            HttpSession session = httpRequest.getSession(true);
            
            if (studentId != null) {
                session.setAttribute("studentId", studentId);
                session.setAttribute("role", "student");
            } else if (employeeId != null) {
                session.setAttribute("employeeId", employeeId);
                session.setAttribute("role", "faculty");
            }
            
            // Always allow access in demo mode
            chain.doFilter(request, response);
            return;
        }
        
        // For paths without ID, check if they are public
        if (uri.endsWith("/login") || uri.endsWith("/login.jsp") ||
            uri.endsWith("/index.jsp") || uri.equals(ctx + "/")) {
            chain.doFilter(request, response);
            return;
        }
        
        // If no ID and not public page, redirect to home
        httpResponse.sendRedirect(ctx + "/");
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}