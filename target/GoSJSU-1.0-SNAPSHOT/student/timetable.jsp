<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.student.Student, com.gosjsu.student.Course" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Timetable | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    /* Timetable specific styles */
    .timetable-container {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 30px;
      margin-bottom: 30px;
    }
    
    .timetable-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .timetable-header h2 {
      font-size: 1.5rem;
      font-weight: 600;
      color: #333;
      margin: 0;
    }
    
    .semester-badge {
      background-color: #f0f0f0;
      color: #666;
      padding: 4px 10px;
      border-radius: 4px;
      font-size: 0.8rem;
      font-weight: 500;
    }
    
    .timetable-grid {
      width: 100%;
      border-collapse: collapse;
    }
    
    .timetable-grid th {
      background-color: #f5f5f5;
      padding: 15px;
      text-align: left;
      font-weight: 600;
      color: #444;
    }
    
    .timetable-grid td {
      padding: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .timetable-grid tr:last-child td {
      border-bottom: none;
    }
    
    .timetable-grid tr:hover {
      background-color: #f9f9f9;
    }
    
    .course-code {
      font-weight: 600;
      color: #0066cc;
      margin-bottom: 5px;
    }
    
    .day-badge {
      display: inline-block;
      background-color: #e6f2ff;
      color: #0066cc;
      padding: 5px 10px;
      border-radius: 4px;
      font-weight: 500;
      font-size: 0.85rem;
      }
      
    .location {
      color: #666;
      font-size: 0.9rem;
      }
      
    .no-classes {
      text-align: center;
      padding: 30px;
      color: #666;
      font-style: italic;
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
          <li class="nav-item active" data-section="timetable">
            <a href="#">
              <i class="fas fa-calendar-alt"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile" id="profileLink">
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
      <!-- Timetable Section -->
      <section class="content-section active">
        <!-- Header -->
        <header class="dashboard-header">
          <h1>Class Timetable</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <!-- Timetable Container -->
        <div class="timetable-container">
          <div class="timetable-header">
            <h2>Your Schedule</h2>
            <span class="semester-badge"><%= request.getAttribute("currentSemester") %></span>
              </div>
              
          <% List<Course> enrollments = (List<Course>) request.getAttribute("enrollments"); %>
          
          <% if (enrollments != null && !enrollments.isEmpty()) { %>
            <table class="timetable-grid">
            <thead>
              <tr>
                <th>Course</th>
                <th>Days</th>
                <th>Time</th>
                <th>Location</th>
              </tr>
            </thead>
            <tbody>
                <% for (Course course : enrollments) { 
                    // Generate simple schedule data for demonstration
                    String days = (course.getCourseId() % 2 == 0) ? "MW" : "TTh";
                    String time = "0" + (8 + (course.getCourseId() % 3)) + ":00 - " + (10 + (course.getCourseId() % 3)) + ":00";
                    String location = "Room " + (100 + (course.getCourseId() * 10));
                %>
                  <tr>
                    <td>
                      <div class="course-code"><%= course.getCourseId() %></div>
                      <%= course.getCourseName() %>
                    </td>
                    <td><span class="day-badge"><%= days %></span></td>
                    <td><%= time %></td>
                    <td class="location"><%= location %></td>
              </tr>
                <% } %>
            </tbody>
          </table>
          <% } else { %>
            <div class="no-classes">
              <p>You are not enrolled in any classes for the current semester.</p>
            </div>
          <% } %>
        </div>
        
        <!-- Weekly Schedule View (Optional Enhancement) -->
        <div class="timetable-container">
          <div class="timetable-header">
            <h2>Weekly View</h2>
          </div>
          
          <p style="text-align: center; color: #666;">
            Weekly schedule view can be implemented here as an enhancement.
          </p>
        </div>
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
    
    document.addEventListener('DOMContentLoaded', setCurrentDate);
  </script>
</body>
</html> 