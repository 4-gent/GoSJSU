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
  <style>
    .semester-badge {
      background-color: #f0f0f0;
      color: #666;
      padding: 4px 10px;
      border-radius: 4px;
      font-size: 0.8rem;
      font-weight: 500;
      margin-left: 10px;
    }
    
    .quick-action-btn {
      display: inline-block;
      background-color: #0066cc;
      color: white;
      padding: 8px 15px;
      border-radius: 4px;
      text-decoration: none;
      font-size: 0.9rem;
      margin-top: 15px;
      transition: background-color 0.2s;
    }
    
    .quick-action-btn:hover {
      background-color: #0055aa;
    }
    
    .status-badge {
      display: inline-block;
      padding: 3px 8px;
      border-radius: 4px;
      font-size: 0.8rem;
      font-weight: 500;
    }
    
    .status-badge.completed {
      background-color: #e6f7ee;
      color: #00a650;
    }
    
    .status-badge.pending {
      background-color: #fff4e5;
      color: #ff9800;
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
        <h1>Welcome Professor ${requestScope.firstName} ${requestScope.lastName}</h1>
        <div class="date" id="currentDate"></div>
      </header>

      <!-- Overview Cards -->
      <div class="overview-cards">
        <div class="faculty-card blue">
          <h3>My Courses</h3>
          <div class="stat">${coursesTaught.size()}</div>
          <div class="sub"><span class="semester-badge">${currentSemester}</span></div>
        </div>

        <div class="faculty-card green">
          <h3>Total Students</h3>
          <div class="stat">${totalStudents}</div>
          <div class="sub">Across all courses</div>
        </div>

        <div class="faculty-card purple">
          <h3>Grade Submissions</h3>
          <div class="stat">${pendingGrades}</div>
          <div class="sub">Pending submissions</div>
        </div>
      </div>

      <!-- Course List with Grade Status -->
      <div class="content-grid">
        <div class="left-column">
          <div class="course-list-card">
            <div class="section-header">
              <h2>Courses & Grade Management</h2>
              <span class="semester-badge">${currentSemester}</span>
            </div>
            
            <% if (request.getAttribute("coursesTaught") != null && !((List<Course>)request.getAttribute("coursesTaught")).isEmpty()) { %>
              <div class="course-list">
                <% List<Course> courses = (List<Course>) request.getAttribute("coursesTaught"); %>
                <% for (Course course : courses) { %>
                  <div class="course-item">
                    <div class="course-info">
                      <div class="course-code"><%= course.getCourseId() %></div>
                      <div class="course-name"><%= course.getCourseName() %></div>
                    </div>
                    <div class="course-actions">
                      <a href="${pageContext.request.contextPath}/faculty/rosters?courseId=<%= course.getCourseId() %>" class="action-link">
                        <i class="fas fa-users"></i> View Roster
                      </a>
                      <a href="${pageContext.request.contextPath}/faculty/grades?courseId=<%= course.getCourseId() %>" class="action-link">
                        <i class="fas fa-chart-bar"></i> Manage Grades
                      </a>
                    </div>
                  </div>
                <% } %>
              </div>
              <div style="text-align: center; margin-top: 20px;">
                <a href="${pageContext.request.contextPath}/faculty/grades" class="quick-action-btn">
                  <i class="fas fa-tasks"></i> Manage All Grades
                </a>
              </div>
            <% } else { %>
              <div class="empty-state">
                <p>You are not currently assigned to any courses for ${currentSemester}.</p>
              </div>
            <% } %>
          </div>
          
          <!-- Recent Grade Submissions Summary -->
          <div class="course-list-card">
            <div class="section-header">
              <h2>Grade Submission Status</h2>
            </div>
            
            <% if (request.getAttribute("coursesTaught") != null && !((List<Course>)request.getAttribute("coursesTaught")).isEmpty()) { %>
              <div class="status-summary">
                <table class="status-table" style="width: 100%; border-collapse: collapse;">
                  <thead>
                    <tr>
                      <th style="text-align: left; padding: 10px;">Course</th>
                      <th style="text-align: center; padding: 10px;">Status</th>
                      <th style="text-align: right; padding: 10px;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% List<Course> courses = (List<Course>) request.getAttribute("coursesTaught"); %>
                    <% for (Course course : courses) { 
                        // For demo purposes, alternate between completed and pending
                        boolean isCompleted = course.getCourseId() % 2 == 0;
                    %>
                      <tr>
                        <td style="padding: 10px;"><%= course.getCourseName() %></td>
                        <td style="text-align: center; padding: 10px;">
                          <% if (isCompleted) { %>
                            <span class="status-badge completed">Completed</span>
                          <% } else { %>
                            <span class="status-badge pending">Pending</span>
                          <% } %>
                        </td>
                        <td style="text-align: right; padding: 10px;">
                          <a href="${pageContext.request.contextPath}/faculty/grades?courseId=<%= course.getCourseId() %>" class="action-link">
                            <% if (isCompleted) { %>
                              <i class="fas fa-eye"></i> View
                            <% } else { %>
                              <i class="fas fa-edit"></i> Submit
                            <% } %>
                          </a>
                        </td>
                      </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
            <% } else { %>
              <div class="empty-state">
                <p>No grade submission data available.</p>
              </div>
            <% } %>
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