package com.gosjsu.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private CRUDService crudService;

    @Override
    public void init() throws ServletException {
        super.init();
        crudService = new CRUDService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("view".equals(action)) {
            // Logic to view records
            request.setAttribute("students", crudService.getAllStudents());
            request.setAttribute("courses", crudService.getAllCourses());
            request.setAttribute("faculty", crudService.getAllFaculty());
            request.getRequestDispatcher("/WEB-INF/views/admin/crud.jsp").forward(request, response);
        } else {
            // Default action or redirect to dashboard
            response.sendRedirect("dashboard.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "addStudent":
                // Logic to add a student
                crudService.addStudent(request);
                break;
            case "updateStudent":
                // Logic to update a student
                crudService.updateStudent(request);
                break;
            case "deleteStudent":
                // Logic to delete a student
                crudService.deleteStudent(request);
                break;
            // Additional cases for courses and faculty
        }

        response.sendRedirect("admin?action=view");
    }
}