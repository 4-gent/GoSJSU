package com.gosjsu.report;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    private ReportGenerator reportGenerator;

    @Override
    public void init() throws ServletException {
        reportGenerator = new ReportGenerator();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("type");
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");

        if ("student".equals(reportType) && studentId != null) {
            reportGenerator.generateStudentReport(studentId, response);
        } else if ("course".equals(reportType) && courseId != null) {
            reportGenerator.generateCourseReport(courseId, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid report type or missing parameters.");
        }
    }
}