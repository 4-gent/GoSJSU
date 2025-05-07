package com.gosjsu.faculty;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// Removing the @WebServlet annotation to avoid URL mapping conflict with FacultyServlet
public class FacultyDashboardServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
    String facultyId = req.getParameter("facultyId");
    req.setAttribute("facultyId", facultyId);
    req.getRequestDispatcher("/faculty/dashboard.jsp")
       .forward(req, resp);
  }
} 