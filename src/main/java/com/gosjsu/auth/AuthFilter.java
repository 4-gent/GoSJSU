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

        HttpSession session = httpRequest.getSession(false);
        String requestedURI = httpRequest.getRequestURI();

        // Check if the user is logged in
        if (session == null || session.getAttribute("user") == null) {
            // User is not logged in, redirect to login page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/WEB-INF/views/login.jsp");
        } else {
            // User is logged in, check role-based access
            String userRole = (String) session.getAttribute("role");
            if (!isAuthorized(userRole, requestedURI)) {
                // User does not have access, redirect to error page
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
                return;
            }
            // User is authorized, continue with the request
            chain.doFilter(request, response);
        }
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