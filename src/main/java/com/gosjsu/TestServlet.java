package com.gosjsu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/test")
public class TestServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>GoSJSU Test Servlet</h1>");
        out.println("<p>This is a simple test to verify the application is deployed correctly.</p>");
        out.println("<p>If you can see this page, it means the server is running but there might be issues with the main application.</p>");
        out.println("<p><a href=\"" + request.getContextPath() + "/\">Try going to the home page</a></p>");
        out.println("</body></html>");
    }
} 