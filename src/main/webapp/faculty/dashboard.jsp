<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gosjsu.student.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty Dashboard | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
          <li class="nav-item active" data-section="dashboard">
            <a href="${pageContext.request.contextPath}/faculty/dashboard">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="${pageContext.request.contextPath}/faculty/grades">
              <i class="fas fa-chart-bar"></i>
              <span>Grades</span>
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
        <h1>Welcome Professor ${requestScope.firstName} ${requestScope.lastName}</h1>
        <div class="date" id="currentDate"></div>
      </header>

      <!-- Overview Cards -->
      <div class="overview-cards">
        <div class="faculty-card blue">
          <h3>My Courses</h3>
          <div class="stat">4</div>
          <div class="sub">Spring 2025</div>
        </div>

        <div class="faculty-card green">
          <h3>Total Students</h3>
          <div class="stat">87</div>
          <div class="sub">Across all courses</div>
        </div>

        <div class="faculty-card purple">
          <h3>Grade Submissions</h3>
          <div class="stat">2</div>
          <div class="sub">Pending submissions</div>
        </div>
      </div>

      <!-- Additional Content -->
      <div class="content-grid">
        <!-- Left Column -->
        <div class="left-column">
          <!-- Today's Classes -->
            <div class="course-list-card">
              <div class="section-header">
                  <h2>Courses Taught</h2>
                  <a href="#" class="view-all">View All Courses <i class="fas fa-arrow-right"></i></a>
              </div>
              
              <div class="course-list">
                  <% 
                    // Retrieve the list of courses from the request attribute
                    List<Course> courses = (List<Course>) request.getAttribute("coursesTaught");
                    if (courses != null && !courses.isEmpty()) {
                      for (Course course : courses) {
                  %>
                  <li class="course-item">
                      <div class="course-info">
                          <span class="course-code"><%= course.getCourseId() %></span>
                          <span class="course-name"><%= course.getCourseName() %></span>
                      </div>
                      <div class="course-actions">
                          <a href="${pageContext.request.contextPath}/faculty/grades?courseId=<%= course.getCourseId() %>" class="view-grades-btn">View Grades</a>
                      </div>
                  </li>
                  <% 
                      }
                    } else { 
                  %>
                  <li class="no-courses">No courses available.</li>
                  <% 
                    } 
                  %>
              </div>
          </div>
        </div>
      </div>
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