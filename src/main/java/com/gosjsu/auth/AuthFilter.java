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

        // Allow unauthenticated access to public login pages and initial dashboards
        String uri = httpRequest.getRequestURI();
        if (uri.endsWith("/login") || uri.endsWith("/login.jsp") ||
            uri.endsWith("/student/login.jsp") || uri.endsWith("/faculty/login.jsp") ||
            uri.endsWith("/student/dashboard") || uri.endsWith("/faculty/dashboard") ||
            uri.endsWith("/student/profile") || uri.endsWith("/student/profile.jsp") ||
            uri.endsWith("/student/timetable") || uri.endsWith("/student/grades")) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = httpRequest.getSession(false);
        String requestedURI = uri;
        // Check if the user is logged in by looking for "username" in session
        if (session == null || session.getAttribute("username") == null) {
            // Redirect unauthenticated users back to their portal's login page or home
            String ctx = httpRequest.getContextPath();
            if (uri.startsWith(ctx + "/student/")) {
                httpResponse.sendRedirect(ctx + "/student/login.jsp");
            } else if (uri.startsWith(ctx + "/faculty/")) {
                httpResponse.sendRedirect(ctx + "/faculty/login.jsp");
            } else {
                httpResponse.sendRedirect(ctx + "/index.jsp");
            }
            return;
        }
        // User is logged in, check role-based access
        String userRole = (String) session.getAttribute("role");
        if (!isAuthorized(userRole, requestedURI)) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }
        // User is authorized, continue with the request
        chain.doFilter(request, response);
    }

    private boolean isAuthorized(String role, String uri) {
        // Implement role-based access control logic here
        // Example: return true if the user has access to the requested URI
        return true; // Placeholder for actual authorization logic
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}