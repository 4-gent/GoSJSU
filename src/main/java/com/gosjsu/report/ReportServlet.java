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
        super.init();
        reportGenerator = new ReportGenerator();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String id = request.getParameter("id");

        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"report.pdf\"");

            if ("student".equals(type)) {
                reportGenerator.generateStudentReport(id, response);
            } else if ("course".equals(type)) {
                reportGenerator.generateCourseReport(id, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid report type");
            }
        } catch (Exception e) {
            throw new ServletException("Error generating report", e);
        }
    }
}