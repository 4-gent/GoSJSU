<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.shared.Grade" %>
<%@ page import="com.gosjsu.student.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Grades | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .grades-section {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      margin-bottom: 20px;
      padding: 20px;
    }
    
    .grades-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .grades-table th {
      background-color: #f5f5f5;
      padding: 12px;
      text-align: left;
      font-weight: 600;
      color: #444;
    }
    
    .grades-table td {
      padding: 12px;
      border-bottom: 1px solid #eee;
    }
    
    .grades-table tr:hover {
      background-color: #f9f9f9;
    }
    
    .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .section-header h2 {
      font-size: 1.2rem;
      font-weight: 600;
      color: #333;
      margin: 0;
    }
    
    .no-grades {
      text-align: center;
      padding: 20px;
      color: #666;
      font-style: italic;
    }
    
    .grade-badge {
      display: inline-block;
      padding: 4px 8px;
      border-radius: 4px;
      font-weight: 600;
      background-color: #e6f0fd;
      color: #3b7dd8;
    }
    
    .grade-badge.a {
      background-color: #e3f6e4;
      color: #2e7d32;
    }
    
    .grade-badge.b {
      background-color: #e6f0fd;
      color: #1565c0;
    }
    
    .grade-badge.c {
      background-color: #fff8e1;
      color: #ff8f00;
    }
    
    .grade-badge.d {
      background-color: #ffebee;
      color: #c62828;
    }
    
    .grade-badge.f {
      background-color: #ffebee;
      color: #c62828;
    }
    
    .semester-filter {
      margin-bottom: 20px;
    }
    
    .semester-filter select {
      padding: 8px 16px;
      border-radius: 4px;
      border: 1px solid #ddd;
      background-color: #fff;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div class="dashboard-container">
    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="logo">
          <div class="logo-icon">
            <div class="logo-square light"></div>
            <div class="logo-square dark"></div>
          </div>
          <h1>goSJSU</h1>
        </div>
      </div>
      
      <nav class="sidebar-nav">
        <ul>
          <li class="nav-item" data-section="dashboard">
            <a href="${pageContext.request.contextPath}/student/dashboard">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="enrollment">
            <a href="${pageContext.request.contextPath}/student/enrollment">
              <i class="fas fa-book"></i>
              <span>Enrollment</span>
            </a>
          </li>
          <li class="nav-item" data-section="timetable">
            <a href="${pageContext.request.contextPath}/student/timetable">
              <i class="fas fa-calendar-alt"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item active" data-section="grades">
            <a href="${pageContext.request.contextPath}/student/grades">
              <i class="fas fa-graduation-cap"></i>
              <span>Grades</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="logout">
            <a href="${pageContext.request.contextPath}/">
              <i class="fas fa-sign-out-alt"></i>
              <span>Logout</span>
            </a>
          </li>
        </ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <section class="content-section active">
        <!-- Header -->
        <header class="dashboard-header">
          <h1>My Grades</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <!-- Grades Section -->
        <section class="grades-section">
          <div class="section-header">
            <h2>Grade Report</h2>
          </div>
          
          <% if (request.getAttribute("errorMessage") != null) { %>
          <div class="error-message" style="color: #e53935; background-color: #ffebee; padding: 10px; margin-bottom: 15px; border-radius: 4px;">
            <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("errorMessage") %>
          </div>
          <% } %>
          
          <div class="semester-filter">
            <label for="semesterSelect">Semester:</label>
            <select id="semesterSelect" onchange="filterBySemester()">
              <option value="all">All Semesters</option>
              <option value="Spring 2025">Spring 2025</option>
              <option value="Fall 2025">Fall 2025</option>
            </select>
          </div>
          
          <div class="grades-table-container">
            <table class="grades-table">
              <thead>
                <tr>
                  <th>Course Name</th>
                  <th>Grade</th>
                  <th>Date Reported</th>
                  <th>Semester</th>
                </tr>
              </thead>
              <tbody>
                <% 
                List<Grade> grades = (List<Grade>) request.getAttribute("grades");
                SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy");
                if (grades != null && !grades.isEmpty()) {
                  for (Grade grade : grades) {
                    String dateStr = grade.getReportedOn() != null ? dateFormat.format(grade.getReportedOn()) : "N/A";
                    String gradeClass = "";
                    if (grade.getGrade() != null) {
                      String firstChar = grade.getGrade().toLowerCase().substring(0, 1);
                      gradeClass = "grade-badge " + firstChar;
                    }
                %>
                <tr class="semester-row" data-semester="<%= grade.getSemester() %>">
                  <td><%= grade.getCourseName() != null ? grade.getCourseName() : "N/A" %></td>
                  <td><span class="<%= gradeClass %>"><%= grade.getGrade() != null ? grade.getGrade() : "Not Graded" %></span></td>
                  <td><%= dateStr %></td>
                  <td><%= grade.getSemester() != null ? grade.getSemester() : "N/A" %></td>
                </tr>
                <% 
                  }
                } else { 
                %>
                <tr>
                  <td colspan="4" class="no-grades">No grades available</td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </section>
      </section>
    </main>
  </div>

  <script>
    // Set current date
    function setCurrentDate() {
      const dateOptions = { 
        weekday: 'long', 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
      };
      const currentDate = new Date().toLocaleDateString('en-US', dateOptions);
      document.getElementById('currentDate').innerText = currentDate;
    }
    
    // Filter grades by semester
    function filterBySemester() {
      const semester = document.getElementById('semesterSelect').value;
      const rows = document.querySelectorAll('.semester-row');
      
      rows.forEach(row => {
        if (semester === 'all' || row.getAttribute('data-semester') === semester) {
          row.style.display = '';
        } else {
          row.style.display = 'none';
        }
      });
    }
    
    document.addEventListener('DOMContentLoaded', function() {
      setCurrentDate();
    });
  </script>
</body>
</html> 