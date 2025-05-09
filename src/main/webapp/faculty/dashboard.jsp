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
    :root {
      --primary: #4361ee;
      --primary-light: #4895ef;
      --primary-dark: #3a0ca3;
      --success: #4cc9f0;
      --success-light: #e6f7ee;
      --warning: #f72585;
      --warning-light: #fff4e5;
      --text-primary: #333;
      --text-secondary: #666;
      --bg-light: #f8f9fa;
      --border-light: #e9ecef;
      --border-radius: 10px;
      --shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      --transition: all 0.3s ease;
    }
    
    body {
      background-color: #f5f7fb;
      font-family: 'Inter', sans-serif;
    }
    
    .main-content {
      padding: 2rem;
      background-color: #f5f7fb;
    }
    
    .dashboard-header {
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    
    .dashboard-header h1 {
      font-size: 1.75rem;
      font-weight: 600;
      color: var(--text-primary);
      margin: 0;
    }
    
    .date {
      font-size: 0.95rem;
      color: var(--text-secondary);
      font-weight: 500;
    }
    
    .overview-cards {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 1.5rem;
      margin-bottom: 2rem;
    }
    
    .faculty-card {
      background: linear-gradient(135deg, var(--primary), var(--primary-light));
      color: white;
      border-radius: var(--border-radius);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      transition: var(--transition);
      position: relative;
      overflow: hidden;
    }
    
    .faculty-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }
    
    .faculty-card.green {
      background: linear-gradient(135deg, #4cc9f0, #4361ee);
    }
    
    .faculty-card.purple {
      background: linear-gradient(135deg, #7209b7, #f72585);
    }
    
    .faculty-card::before {
      content: '';
      position: absolute;
      top: -20px;
      right: -20px;
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.1);
    }
    
    .faculty-card h3 {
      font-size: 1.1rem;
      font-weight: 500;
      margin-top: 0;
      margin-bottom: 1rem;
      position: relative;
    }
    
    .faculty-card .stat {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
      position: relative;
    }
    
    .faculty-card .sub {
      font-size: 0.9rem;
      opacity: 0.8;
      position: relative;
    }
    
    .semester-badge {
      background-color: rgba(255, 255, 255, 0.2);
      color: white;
      padding: 4px 12px;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 500;
      margin-left: 10px;
      display: inline-block;
    }
    
    .section-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 1.5rem;
    }
    
    .section-header h2 {
      font-size: 1.25rem;
      font-weight: 600;
      margin: 0;
      color: var(--text-primary);
    }
    
    .course-list-card {
      background-color: white;
      border-radius: var(--border-radius);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .course-list {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 1rem;
    }
    
    .course-item {
      border: 1px solid var(--border-light);
      border-radius: 8px;
      padding: 1.25rem;
      transition: var(--transition);
    }
    
    .course-item:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      border-color: var(--primary-light);
    }
    
    .course-info {
      margin-bottom: 1rem;
    }
    
    .course-code {
      font-size: 0.85rem;
      color: var(--primary);
      font-weight: 600;
      margin-bottom: 0.25rem;
    }
    
    .course-name {
      font-size: 1rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .course-actions {
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
    }
    
    .action-link {
      display: inline-flex;
      align-items: center;
      padding: 0.5rem 0.75rem;
      background-color: #f8f9fa;
      color: var(--text-primary);
      border-radius: 4px;
      font-size: 0.85rem;
      text-decoration: none;
      transition: var(--transition);
    }
    
    .action-link:hover {
      background-color: var(--primary);
      color: white;
    }
    
    .action-link i {
      margin-right: 0.35rem;
    }
    
    .quick-action-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      background-color: var(--primary);
      color: white;
      padding: 0.75rem 1.25rem;
      border-radius: 6px;
      text-decoration: none;
      font-size: 0.95rem;
      font-weight: 500;
      margin-top: 1.25rem;
      transition: var(--transition);
    }
    
    .quick-action-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
    }
    
    .quick-action-btn i {
      margin-right: 0.5rem;
    }
    
    .status-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
    }
    
    .status-table th,
    .status-table td {
      padding: 1rem;
      text-align: left;
    }
    
    .status-table th {
      font-weight: 600;
      color: var(--text-secondary);
      font-size: 0.9rem;
      border-bottom: 1px solid var(--border-light);
    }
    
    .status-table td {
      border-bottom: 1px solid var(--border-light);
      font-size: 0.95rem;
    }
    
    .status-table tr:last-child td {
      border-bottom: none;
    }
    
    .status-table tr:hover td {
      background-color: #f8f9fa;
    }
    
    .status-badge {
      display: inline-block;
      padding: 0.35rem 0.75rem;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 500;
      text-align: center;
    }
    
    .status-badge.completed {
      background-color: var(--success-light);
      color: var(--success);
    }
    
    .status-badge.pending {
      background-color: var(--warning-light);
      color: var(--warning);
    }
    
    .empty-state {
      text-align: center;
      padding: 2rem;
      color: var(--text-secondary);
      border: 2px dashed var(--border-light);
      border-radius: 8px;
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
        <h1>Welcome, Professor ${requestScope.firstName} ${requestScope.lastName}</h1>
        <div class="date" id="currentDate"></div>
      </header>

      <!-- Overview Cards -->
      <div class="overview-cards">
        <div class="faculty-card">
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
          <h3>Pending Grades</h3>
          <div class="stat">${pendingGrades}</div>
          <div class="sub">Need your attention</div>
        </div>
      </div>

      <!-- Course List with Grade Status -->
      <div class="content-grid">
        <div class="course-list-card">
          <div class="section-header">
            <h2>My Courses</h2>
            <span class="semester-badge" style="background-color: var(--primary); color: white;">${currentSemester}</span>
          </div>
          
          <% if (request.getAttribute("coursesTaught") != null && !((List<Course>)request.getAttribute("coursesTaught")).isEmpty()) { %>
            <div class="course-list">
              <% List<Course> courses = (List<Course>) request.getAttribute("coursesTaught"); %>
              <% for (Course course : courses) { %>
                <div class="course-item">
                  <div class="course-info">
                    <div class="course-code">Course #<%= course.getCourseId() %></div>
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
            <div style="text-align: center; margin-top: 1.5rem;">
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
              <table class="status-table">
                <thead>
                  <tr>
                    <th>Course</th>
                    <th style="text-align: center;">Status</th>
                    <th style="text-align: right;">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <% List<Course> courses = (List<Course>) request.getAttribute("coursesTaught"); %>
                  <% for (Course course : courses) { 
                      // For demo purposes, alternate between completed and pending
                      boolean isCompleted = course.getCourseId() % 2 == 0;
                  %>
                    <tr>
                      <td><%= course.getCourseName() %></td>
                      <td style="text-align: center;">
                        <% if (isCompleted) { %>
                          <span class="status-badge completed">Completed</span>
                        <% } else { %>
                          <span class="status-badge pending">Pending</span>
                        <% } %>
                      </td>
                      <td style="text-align: right;">
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