<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.student.Student, com.gosjsu.student.Course, com.gosjsu.shared.Grade" %>
<%@ page import="com.gosjsu.shared.StudentGradeDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard | goSJSU</title>
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
            <a href="#">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
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
      <!-- Dashboard Section -->
      <section id="dashboard-section" class="content-section active">
        <!-- Header -->
        <header class="dashboard-header">
          <h1>Welcome, <%= ((Student) request.getAttribute("student")).getFirstName() %>!</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <!-- Overview Cards -->
        <section class="overview-cards">
          <div class="card blue">
            <h3>Total Courses</h3>
            <div class="stat"><%= ((List<Course>) request.getAttribute("enrollments")).size() %></div>
          </div>
          <div class="card green">
            <h3>Current GPA</h3>
            <div class="stat">3.75</div> <!-- Replace with dynamic GPA if available -->
          </div>
          <div class="card purple">
            <h3>Registration Status</h3>
            <div class="stat-badge">Open</div>
          </div>
        </section>

        <!-- Content Grid -->
        <div class="content-grid">
          <!-- Left Column -->
          <div class="left-column">
            <!-- Enrolled Classes -->
            <section class="classes-section">
              <div class="section-header">
                <h2>Enrolled Classes</h2>
              </div>
              
              <div class="classes-container">
                <% List<Course> enrollments = (List<Course>) request.getAttribute("enrollments"); %>
                <% for (Course course : enrollments) { %>
                  <div class="class-card gray">
                    <div class="class-info">
                      <div class="course-code"><%= course.getCourseId() %></div>
                      <div class="course-name"><%= course.getCourseName() %></div>
                    </div>
                  </div>
                <% } %>
              </div>
            </section>

            <!-- Grade Summary Section -->
            <section class="grades-section">
              <div class="section-header">
                <h2>Recent Grades</h2>
              </div>
              
              <div class="grades-table">
                <table>
                  <thead>
                    <tr>
                      <th>Course</th>
                      <th>Grade</th>
                      <th>Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% List<StudentGradeDTO> grades = (List<StudentGradeDTO>) request.getAttribute("grades"); %>
                    <% for (StudentGradeDTO grade : grades) { %>
                      <tr>
                        <td><%= grade.getCourseName() %></td>
                        <td><%= grade.getGrade() %></td>
                      </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
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