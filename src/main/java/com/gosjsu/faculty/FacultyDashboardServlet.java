package com.gosjsu.faculty;

import com.gosjsu.student.Course;
import com.gosjsu.student.Student;
import com.gosjsu.shared.StudentGradeDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

// Removed WebServlet annotation since it's defined in web.xml
public class FacultyDashboardServlet extends HttpServlet {
    private static final String CURRENT_SEMESTER = "Fall 2025";
    private FacultyProfileService facultyProfileService = new FacultyProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Integer employeeId = (Integer) session.getAttribute("employeeId"); // Retrieve employeeId from session

        System.out.println("Faculty Dashboard Servlet employeeId: " + employeeId);

        if (employeeId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Fetch faculty profile
        Faculty faculty = facultyProfileService.getFacultyProfile(employeeId);
        if (faculty == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Faculty not found");
            return;
        }

        // Fetch courses taught by the faculty for the current semester
        List<Course> coursesTaught = facultyProfileService.getCoursesTaught(employeeId, CURRENT_SEMESTER);

        // Get total student count across all courses
        int totalStudents = facultyProfileService.getTotalStudentsCount(employeeId, CURRENT_SEMESTER);
        
        // Get pending grade submissions
        int pendingGrades = facultyProfileService.getPendingGradeSubmissions(employeeId, CURRENT_SEMESTER);

        System.out.println("Dashboard Courses Taught: " + coursesTaught);
        System.out.println("Total students: " + totalStudents);
        System.out.println("Pending grades: " + pendingGrades);

        // Set attributes for the JSP
        req.setAttribute("faculty", faculty);
        req.setAttribute("firstName", faculty.getFirstName());
        req.setAttribute("lastName", faculty.getLastName());
        req.setAttribute("coursesTaught", coursesTaught);
        req.setAttribute("totalStudents", totalStudents);
        req.setAttribute("pendingGrades", pendingGrades);
        req.setAttribute("currentSemester", CURRENT_SEMESTER);

        // Forward to the faculty dashboard JSP
        req.getRequestDispatcher("/faculty/dashboard.jsp").forward(req, resp);
    }
}