<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.gosjsu.student.Course" %>
<%@ page import="com.gosjsu.shared.StudentGradeDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Grades | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .semester-badge {
      background-color: #f0f0f0;
      color: #666;
      padding: 4px 10px;
      border-radius: 4px;
      font-size: 0.8rem;
      font-weight: 500;
    }
    
    .grade-form {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 20px;
      margin-top: 20px;
    }
    
    .grade-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }
    
    .grade-table th {
      background-color: #f5f5f5;
      padding: 12px;
      text-align: left;
      font-weight: 600;
      color: #444;
    }
    
    .grade-table td {
      padding: 12px;
      border-bottom: 1px solid #eee;
    }
    
    .grade-table tr:last-child td {
      border-bottom: none;
    }
    
    .grade-input {
      width: 60px;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
      text-align: center;
      font-size: 0.9rem;
    }
    
    .submit-btn {
      background-color: #0066cc;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      font-weight: 500;
      cursor: pointer;
      margin-top: 15px;
    }
    
    .submit-btn:hover {
      background-color: #0055aa;
    }
    
    .progress-bar {
      height: 10px;
      background-color: #e0e0e0;
      border-radius: 5px;
      overflow: hidden;
      margin-top: 5px;
    }
    
    .progress-fill {
      height: 100%;
      background-color: #0066cc;
    }
    
    .course-card {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 20px;
      margin-bottom: 15px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .course-info h3 {
      margin: 0;
      font-size: 1.1rem;
    }
    
    .course-progress {
      width: 200px;
    }
    
    .alert {
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 4px;
    }
    
    .alert-success {
      background-color: #e6f7ee;
      color: #00a650;
    }
    
    .alert-danger {
      background-color: #fee;
      color: #e30000;
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
            <a href="${pageContext.request.contextPath}/faculty/dashboard">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item active" data-section="grades">
            <a href="${pageContext.request.contextPath}/faculty/grades">
              <i class="fas fa-chart-bar"></i>
              <span>Grades</span>
            </a>
          </li>
          <li class="nav-item" data-section="roster">
            <a href="${pageContext.request.contextPath}/faculty/rosters">
              <i class="fas fa-users"></i>
              <span>Class Rosters</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/faculty/profile">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="logout">
            <a href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i>
              <span>Logout</span>
            </a>
          </li>
        </ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <!-- Header -->
      <header class="dashboard-header">
        <h1>Grade Management</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-danger">
          <%= request.getAttribute("errorMessage") %>
        </div>
      <% } %>
      
      <% if (request.getAttribute("successMessage") != null) { %>
        <div class="alert alert-success">
          <%= request.getAttribute("successMessage") %>
        </div>
      <% } %>
      
      <% 
        // Check if a specific course is selected
        Course course = (Course) request.getAttribute("course");
        if (course != null) {
          // Display grade entry form for the selected course
      %>
        <div class="section-header">
          <h2><%= course.getCourseName() %> (ID: <%= course.getCourseId() %>)</h2>
          <span class="semester-badge"><%= request.getAttribute("currentSemester") %></span>
        </div>
        
        <form class="grade-form" action="${pageContext.request.contextPath}/faculty/grades" method="post">
          <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">
          <input type="hidden" name="action" value="submitGrades">
          
          <table class="grade-table">
            <thead>
              <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Grade</th>
              </tr>
            </thead>
            <tbody>
              <% 
                List<StudentGradeDTO> studentGrades = (List<StudentGradeDTO>) request.getAttribute("studentGrades");
                if (studentGrades != null && !studentGrades.isEmpty()) {
                  for (StudentGradeDTO student : studentGrades) {
              %>
                <tr>
                  <td><%= student.getStudentNumber() %></td>
                  <td><%= student.getLastName() %>, <%= student.getFirstName() %></td>
                  <td>
                    <input type="text" class="grade-input" name="grade_<%= student.getStudentId() %>" 
                           value="<%= student.getGrade() != null ? student.getGrade() : "" %>" 
                           placeholder="e.g. A">
                  </td>
                </tr>
              <% 
                  }
                } else {
              %>
                <tr>
                  <td colspan="3" style="text-align: center;">No students found for this course.</td>
                </tr>
              <% } %>
            </tbody>
          </table>
          
          <% if (studentGrades != null && !studentGrades.isEmpty()) { %>
            <div style="text-align: right; margin-top: 20px;">
              <button type="submit" class="submit-btn">Save Grades</button>
            </div>
          <% } %>
        </form>
      <% } else { 
           // Display list of courses
      %>
        <div class="section-header">
          <h2>Course Grade Management</h2>
          <span class="semester-badge"><%= request.getAttribute("currentSemester") %></span>
        </div>
        
        <div class="course-list">
          <% 
            List<Course> coursesTaught = (List<Course>) request.getAttribute("coursesTaught");
            Map<Integer, Integer> gradingProgress = (Map<Integer, Integer>) request.getAttribute("gradingProgress");
            
            if (coursesTaught != null && !coursesTaught.isEmpty()) {
              for (Course c : coursesTaught) {
                int progress = gradingProgress != null ? gradingProgress.getOrDefault(c.getCourseId(), 0) : 0;
          %>
            <div class="course-card">
              <div class="course-info">
                <h3><%= c.getCourseName() %></h3>
                <div>Course ID: <%= c.getCourseId() %></div>
              </div>
              <div class="course-progress">
                <div>Grading Progress: <%= progress %>%</div>
                <div class="progress-bar">
                  <div class="progress-fill" style="width: <%= progress %>%;"></div>
                </div>
              </div>
              <div>
                <a href="${pageContext.request.contextPath}/faculty/grades?courseId=<%= c.getCourseId() %>" class="submit-btn">
                  Manage Grades
                </a>
              </div>
            </div>
          <% 
              }
            } else {
          %>
            <div style="text-align: center; padding: 30px;">
              <p>You are not currently assigned to any courses for the current semester.</p>
            </div>
          <% } %>
        </div>
      <% } %>
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
    
    document.addEventListener('DOMContentLoaded', setCurrentDate);
  </script>
</body>
</html>