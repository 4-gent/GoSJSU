package com.gosjsu.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.gosjsu.student.Student;

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
            try {
                List<Student> students = crudService.getAllStudents();
                request.setAttribute("students", students);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
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

        switch(action) {
            case "addStudent":
                crudService.addStudent(request);
                break;
            case "updateStudent":
                crudService.updateStudent(request);
                break;
            case "deleteStudent":
                crudService.deleteStudent(request);
                break;
            // Additional cases for courses and faculty
        }

        response.sendRedirect("admin?action=view");
    }
}