package com.gosjsu.student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/student/registration")
public class RegistrationServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
    String studentId = req.getParameter("studentId");
    req.setAttribute("studentId", studentId);
    req.getRequestDispatcher("/student/registration.jsp")
       .forward(req, resp);
  }
} 