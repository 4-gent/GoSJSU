/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-05-10 01:20:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.faculty;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.util.Map;
import com.gosjsu.student.Course;
import com.gosjsu.shared.StudentGradeDTO;

public final class grades_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("  <title>Manage Grades | goSJSU</title>\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/modern-dashboard.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\">\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("  <style>\n");
      out.write("    .semester-badge {\n");
      out.write("      background-color: #f0f0f0;\n");
      out.write("      color: #666;\n");
      out.write("      padding: 4px 10px;\n");
      out.write("      border-radius: 4px;\n");
      out.write("      font-size: 0.8rem;\n");
      out.write("      font-weight: 500;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .grade-form {\n");
      out.write("      background-color: white;\n");
      out.write("      border-radius: 8px;\n");
      out.write("      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);\n");
      out.write("      padding: 20px;\n");
      out.write("      margin-top: 20px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .grade-table {\n");
      out.write("      width: 100%;\n");
      out.write("      border-collapse: collapse;\n");
      out.write("      margin-top: 15px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .grade-table th {\n");
      out.write("      background-color: #f5f5f5;\n");
      out.write("      padding: 12px;\n");
      out.write("      text-align: left;\n");
      out.write("      font-weight: 600;\n");
      out.write("      color: #444;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .grade-table td {\n");
      out.write("      padding: 12px;\n");
      out.write("      border-bottom: 1px solid #eee;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .grade-table tr:last-child td {\n");
      out.write("      border-bottom: none;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .grade-input {\n");
      out.write("      width: 60px;\n");
      out.write("      padding: 8px;\n");
      out.write("      border: 1px solid #ddd;\n");
      out.write("      border-radius: 4px;\n");
      out.write("      text-align: center;\n");
      out.write("      font-size: 0.9rem;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .submit-btn {\n");
      out.write("      background-color: #0066cc;\n");
      out.write("      color: white;\n");
      out.write("      border: none;\n");
      out.write("      padding: 10px 20px;\n");
      out.write("      border-radius: 4px;\n");
      out.write("      font-weight: 500;\n");
      out.write("      cursor: pointer;\n");
      out.write("      margin-top: 15px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .submit-btn:hover {\n");
      out.write("      background-color: #0055aa;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .progress-bar {\n");
      out.write("      height: 10px;\n");
      out.write("      background-color: #e0e0e0;\n");
      out.write("      border-radius: 5px;\n");
      out.write("      overflow: hidden;\n");
      out.write("      margin-top: 5px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .progress-fill {\n");
      out.write("      height: 100%;\n");
      out.write("      background-color: #0066cc;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .course-card {\n");
      out.write("      background-color: white;\n");
      out.write("      border-radius: 8px;\n");
      out.write("      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);\n");
      out.write("      padding: 20px;\n");
      out.write("      margin-bottom: 15px;\n");
      out.write("      display: flex;\n");
      out.write("      justify-content: space-between;\n");
      out.write("      align-items: center;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .course-info h3 {\n");
      out.write("      margin: 0;\n");
      out.write("      font-size: 1.1rem;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .course-progress {\n");
      out.write("      width: 200px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .alert {\n");
      out.write("      padding: 15px;\n");
      out.write("      margin-bottom: 20px;\n");
      out.write("      border-radius: 4px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .alert-success {\n");
      out.write("      background-color: #e6f7ee;\n");
      out.write("      color: #00a650;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .alert-danger {\n");
      out.write("      background-color: #fee;\n");
      out.write("      color: #e30000;\n");
      out.write("    }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  <div class=\"dashboard-container\">\n");
      out.write("        <!-- Sidebar -->\n");
      out.write("        <aside class=\"sidebar\">\n");
      out.write("          <div class=\"sidebar-header\">\n");
      out.write("            <div class=\"logo\">\n");
      out.write("              <div class=\"logo-icon\">\n");
      out.write("                <div class=\"logo-square light\"></div>\n");
      out.write("                <div class=\"logo-square dark\"></div>\n");
      out.write("              </div>\n");
      out.write("              <h1>goSJSU</h1>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("      \n");
      out.write("          <nav class=\"sidebar-nav\">\n");
      out.write("            <ul>\n");
      out.write("              <li class=\"nav-item\" data-section=\"dashboard\">\n");
      out.write("                <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/faculty/dashboard\">\n");
      out.write("                  <i class=\"fas fa-th-large\"></i>\n");
      out.write("                  <span>Dashboard</span>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("          <li class=\"nav-item active\" data-section=\"grades\">\n");
      out.write("            <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/faculty/grades\">\n");
      out.write("              <i class=\"fas fa-chart-bar\"></i>\n");
      out.write("              <span>Grades</span>\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("          <li class=\"nav-item\" data-section=\"roster\">\n");
      out.write("            <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/faculty/rosters\">\n");
      out.write("              <i class=\"fas fa-users\"></i>\n");
      out.write("              <span>Class Rosters</span>\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("              <li class=\"nav-item\" data-section=\"profile\">\n");
      out.write("                <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/faculty/profile\">\n");
      out.write("                  <i class=\"fas fa-user\"></i>\n");
      out.write("                  <span>Profile</span>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"nav-item\" data-section=\"logout\">\n");
      out.write("                <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/logout\">\n");
      out.write("                  <i class=\"fas fa-sign-out-alt\"></i>\n");
      out.write("                  <span>Logout</span>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("            </ul>\n");
      out.write("          </nav>\n");
      out.write("        </aside>\n");
      out.write("\n");
      out.write("    <!-- Main Content -->\n");
      out.write("    <main class=\"main-content\">\n");
      out.write("      <!-- Header -->\n");
      out.write("      <header class=\"dashboard-header\">\n");
      out.write("        <h1>Grade Management</h1>\n");
      out.write("        <div class=\"date\" id=\"currentDate\"></div>\n");
      out.write("      </header>\n");
      out.write("\n");
      out.write("      ");
 if (request.getAttribute("errorMessage") != null) { 
      out.write("\n");
      out.write("        <div class=\"alert alert-danger\">\n");
      out.write("          ");
      out.print( request.getAttribute("errorMessage") );
      out.write("\n");
      out.write("        </div>\n");
      out.write("      ");
 } 
      out.write("\n");
      out.write("      \n");
      out.write("      ");
 if (request.getAttribute("successMessage") != null) { 
      out.write("\n");
      out.write("        <div class=\"alert alert-success\">\n");
      out.write("          ");
      out.print( request.getAttribute("successMessage") );
      out.write("\n");
      out.write("        </div>\n");
      out.write("      ");
 } 
      out.write("\n");
      out.write("      \n");
      out.write("      ");
 
        // Check if a specific course is selected
        Course course = (Course) request.getAttribute("course");
        if (course != null) {
          // Display grade entry form for the selected course
      
      out.write("\n");
      out.write("        <div class=\"section-header\">\n");
      out.write("          <h2>");
      out.print( course.getCourseName() );
      out.write(" (ID: ");
      out.print( course.getCourseId() );
      out.write(")</h2>\n");
      out.write("          <span class=\"semester-badge\">");
      out.print( request.getAttribute("currentSemester") );
      out.write("</span>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <form class=\"grade-form\" action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/faculty/grades\" method=\"post\">\n");
      out.write("          <input type=\"hidden\" name=\"courseId\" value=\"");
      out.print( course.getCourseId() );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"action\" value=\"submitGrades\">\n");
      out.write("          \n");
      out.write("          <table class=\"grade-table\">\n");
      out.write("            <thead>\n");
      out.write("              <tr>\n");
      out.write("                <th>ID</th>\n");
      out.write("                <th>Student Name</th>\n");
      out.write("                <th>Grade</th>\n");
      out.write("            </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("              ");
 
                List<StudentGradeDTO> studentGrades = (List<StudentGradeDTO>) request.getAttribute("studentGrades");
                if (studentGrades != null && !studentGrades.isEmpty()) {
                  for (StudentGradeDTO student : studentGrades) {
              
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                  <td>");
      out.print( student.getStudentNumber() );
      out.write("</td>\n");
      out.write("                  <td>");
      out.print( student.getLastName() );
      out.write(',');
      out.write(' ');
      out.print( student.getFirstName() );
      out.write("</td>\n");
      out.write("                  <td>\n");
      out.write("                    <input type=\"text\" class=\"grade-input\" name=\"grade_");
      out.print( student.getStudentId() );
      out.write("\" \n");
      out.write("                           value=\"");
      out.print( student.getGrade() != null ? student.getGrade() : "" );
      out.write("\" \n");
      out.write("                           placeholder=\"e.g. A\">\n");
      out.write("                      </td>\n");
      out.write("                  </tr>\n");
      out.write("              ");
 
                  }
                } else {
              
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                  <td colspan=\"3\" style=\"text-align: center;\">No students found for this course.</td>\n");
      out.write("                </tr>\n");
      out.write("              ");
 } 
      out.write("\n");
      out.write("          </tbody>\n");
      out.write("          </table>\n");
      out.write("\n");
      out.write("          ");
 if (studentGrades != null && !studentGrades.isEmpty()) { 
      out.write("\n");
      out.write("            <div style=\"text-align: right; margin-top: 20px;\">\n");
      out.write("              <button type=\"submit\" class=\"submit-btn\">Save Grades</button>\n");
      out.write("            </div>\n");
      out.write("          ");
 } 
      out.write("\n");
      out.write("          </form>\n");
      out.write("      ");
 } else { 
           // Display list of courses
      
      out.write("\n");
      out.write("        <div class=\"section-header\">\n");
      out.write("          <h2>Course Grade Management</h2>\n");
      out.write("          <span class=\"semester-badge\">");
      out.print( request.getAttribute("currentSemester") );
      out.write("</span>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"course-list\">\n");
      out.write("          ");
 
            List<Course> coursesTaught = (List<Course>) request.getAttribute("coursesTaught");
            Map<Integer, Integer> gradingProgress = (Map<Integer, Integer>) request.getAttribute("gradingProgress");
            
            if (coursesTaught != null && !coursesTaught.isEmpty()) {
              for (Course c : coursesTaught) {
                int progress = gradingProgress != null ? gradingProgress.getOrDefault(c.getCourseId(), 0) : 0;
          
      out.write("\n");
      out.write("            <div class=\"course-card\">\n");
      out.write("              <div class=\"course-info\">\n");
      out.write("                <h3>");
      out.print( c.getCourseName() );
      out.write("</h3>\n");
      out.write("                <div>Course ID: ");
      out.print( c.getCourseId() );
      out.write("</div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"course-progress\">\n");
      out.write("                <div>Grading Progress: ");
      out.print( progress );
      out.write("%</div>\n");
      out.write("                <div class=\"progress-bar\">\n");
      out.write("                  <div class=\"progress-fill\" style=\"width: ");
      out.print( progress );
      out.write("%;\"></div>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <div>\n");
      out.write("                <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/faculty/grades?courseId=");
      out.print( c.getCourseId() );
      out.write("\" class=\"submit-btn\">\n");
      out.write("                  Manage Grades\n");
      out.write("                </a>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          ");
 
              }
            } else {
          
      out.write("\n");
      out.write("            <div style=\"text-align: center; padding: 30px;\">\n");
      out.write("              <p>You are not currently assigned to any courses for the current semester.</p>\n");
      out.write("            </div>\n");
      out.write("          ");
 } 
      out.write("\n");
      out.write("      </div>\n");
      out.write("      ");
 } 
      out.write("\n");
      out.write("    </main>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <script>\n");
      out.write("    // Set current date\n");
      out.write("    function setCurrentDate() {\n");
      out.write("      const dateOptions = { \n");
      out.write("        weekday: 'long', \n");
      out.write("        year: 'numeric', \n");
      out.write("        month: 'long', \n");
      out.write("        day: 'numeric' \n");
      out.write("      };\n");
      out.write("      const currentDate = new Date().toLocaleDateString('en-US', dateOptions);\n");
      out.write("      \n");
      out.write("      document.getElementById('currentDate').innerText = currentDate;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    document.addEventListener('DOMContentLoaded', setCurrentDate);\n");
      out.write("  </script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
