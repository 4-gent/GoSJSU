<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.student.Student, com.gosjsu.student.Course" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Course Enrollment | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .available-courses, .enrolled-courses {
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      margin-bottom: 20px;
      overflow: hidden;
    }
    
    .course-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .course-table th, .course-table td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }
    
    .course-table th {
      background-color: #f5f5f7;
      font-weight: 600;
      color: #333;
    }
    
    .course-table tr:last-child td {
      border-bottom: none;
    }
    
    .action-button {
      padding: 6px 12px;
      border-radius: 6px;
      font-weight: 500;
      font-size: 14px;
      cursor: pointer;
      border: none;
      transition: all 0.2s ease;
    }
    
    .enroll-button {
      background-color: #4CAF50;
      color: white;
    }
    
    .drop-button {
      background-color: #f44336;
      color: white;
    }
    
    .action-button:hover {
      opacity: 0.9;
      transform: translateY(-1px);
    }
    
    .message-box {
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 8px;
      display: flex;
      align-items: center;
    }
    
    .message-box i {
      margin-right: 10px;
      font-size: 20px;
    }
    
    .success-message {
      background-color: #E8F5E9;
      color: #2E7D32;
      border: 1px solid #C8E6C9;
    }
    
    .error-message {
      background-color: #FFEBEE;
      color: #C62828;
      border: 1px solid #FFCDD2;
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
          <li class="nav-item active" data-section="enrollment">
            <a href="${pageContext.request.contextPath}/student/enrollment">
              <i class="fas fa-book"></i>
              <span>Enrollment</span>
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
      <!-- Enrollment Section -->
      <section id="enrollment-section" class="content-section active">
        <!-- Header -->
        <header class="dashboard-header">
          <h1>Course Enrollment</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <!-- Enrollment Content -->
        <div class="content-grid">
          <!-- Left Column -->
          <div class="left-column">
            <!-- Current Enrollments -->
            <section class="enrolled-courses">
              <div class="section-header">
                <h2>My Enrolled Courses</h2>
              </div>
              
              <% List<Course> enrolledCourses = (List<Course>) request.getAttribute("enrolledCourses"); %>
              <% if (enrolledCourses != null && !enrolledCourses.isEmpty()) { %>
                <table class="course-table">
                  <thead>
                    <tr>
                      <th>Course ID</th>
                      <th>Course Name</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% for (Course course : enrolledCourses) { %>
                      <tr>
                        <td><%= course.getCourseId() %></td>
                        <td><%= course.getCourseName() %></td>
                        <td>
                          <form action="${pageContext.request.contextPath}/student/enrollment" method="post">
                            <input type="hidden" name="action" value="drop">
                            <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">
                            <button type="submit" class="action-button drop-button">Drop</button>
                          </form>
                        </td>
                      </tr>
                    <% } %>
                  </tbody>
                </table>
              <% } else { %>
                <div class="message-box">
                  <i class="fas fa-info-circle"></i>
                  <p>You are not enrolled in any courses yet.</p>
                </div>
              <% } %>
            </section>

            <!-- Available Courses -->
            <section class="available-courses">
              <div class="section-header">
                <h2>Available Courses</h2>
              </div>
              
              <% List<Course> availableCourses = (List<Course>) request.getAttribute("availableCourses"); %>
              <% if (availableCourses != null && !availableCourses.isEmpty()) { %>
                <table class="course-table">
                  <thead>
                    <tr>
                      <th>Course ID</th>
                      <th>Course Name</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% 
                    for (Course course : availableCourses) {
                      boolean isEnrolled = false;
                      if (enrolledCourses != null) {
                        for (Course enrolled : enrolledCourses) {
                          if (enrolled.getCourseId() == course.getCourseId()) {
                            isEnrolled = true;
                            break;
                          }
                        }
                      }
                      if (!isEnrolled) {
                    %>
                      <tr>
                        <td><%= course.getCourseId() %></td>
                        <td><%= course.getCourseName() %></td>
                        <td>
                          <form action="${pageContext.request.contextPath}/student/enrollment" method="post">
                            <input type="hidden" name="action" value="enroll">
                            <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">
                            <button type="submit" class="action-button enroll-button">Enroll</button>
                          </form>
                        </td>
                      </tr>
                    <% 
                      }
                    } 
                    %>
                  </tbody>
                </table>
              <% } else { %>
                <div class="message-box">
                  <i class="fas fa-info-circle"></i>
                  <p>No courses are available for enrollment at this time.</p>
                </div>
              <% } %>
            </section>
          </div>
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