package com.gosjsu.faculty;

import com.gosjsu.student.Course;
import com.gosjsu.faculty.FacultyProfileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/faculty/dashboard")
public class FacultyDashboardServlet extends HttpServlet {
    private FacultyProfileService facultyProfileService = new FacultyProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Integer employeeId = (Integer) session.getAttribute("employeeId"); // Retrieve employeeId from session

        System.out.println("Faculty Dashboard Servlet employeeId: " + employeeId);

        // Fetch faculty profile
        Faculty faculty = facultyProfileService.getFacultyProfile(employeeId);
        if (faculty == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Faculty not found");
            return;
        }

        // Fetch courses taught by the faculty
        List<Course> coursesTaught = facultyProfileService.getCoursesTaught(employeeId);

        System.out.println("Dashboard Courses Taught: " + coursesTaught);

        System.out.println("Dashboard Courses Taught:");
        if (coursesTaught != null && !coursesTaught.isEmpty()) {
            for (Course course : coursesTaught) {
                System.out.println("Course ID: " + course.getCourseId() + ", Course Name: " + course.getCourseName());
            }
        } else {
            System.out.println("No enrollments found.");
        }

        // Set attributes for the JSP
        req.setAttribute("faculty", faculty);
        req.setAttribute("coursesTaught", coursesTaught);

        // Forward to the faculty dashboard JSP
        req.getRequestDispatcher("/faculty/dashboard.jsp").forward(req, resp);
    }
}