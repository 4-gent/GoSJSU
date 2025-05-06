package com.gosjsu.faculty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/faculty/dashboard")
public class FacultyDashboardServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
    String empId = req.getParameter("employeeId");
    req.setAttribute("employeeId", empId);
    req.getRequestDispatcher("/faculty/dashboard.jsp")
       .forward(req, resp);
  }
} 