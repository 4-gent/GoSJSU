<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gosjsu.student.Student" %>
<%@ page import="com.gosjsu.student.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Rosters | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .roster-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .roster-card {
      background-color: white;
      border-radius: 8px;
      padding: 1.5rem;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      margin-bottom: 1.5rem;
    }
    
    .course-selector {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
    }
    
    .selector-label {
      font-size: 1rem;
      font-weight: 600;
      color: #666;
    }
    
    .course-select {
      flex: 1;
      max-width: 300px;
      padding: 0.75rem 1rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: white;
      font-size: 0.95rem;
      color: #333;
    }
    
    .student-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .student-table th {
      text-align: left;
      padding: 1rem;
      font-size: 0.875rem;
      font-weight: 600;
      color: #666;
      border-bottom: 1px solid #eee;
    }
    
    .student-table td {
      padding: 1rem;
      font-size: 0.95rem;
      border-bottom: 1px solid #eee;
    }
    
    .student-table tr:last-child td {
      border-bottom: none;
    }
    
    .student-table tr:hover td {
      background-color: #f9f9f9;
    }
    
    .alert-box {
      padding: 1rem;
      border-radius: 4px;
      background-color: #e0f2fe;
      color: #0369a1;
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }
    
    .alert-icon {
      font-size: 1.25rem;
    }
    
    .roster-stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 1rem;
      margin-bottom: 1.5rem;
    }
    
    .stat-card {
      background-color: white;
      border-radius: 4px;
      padding: 1rem;
      border: 1px solid #eee;
    }
    
    .stat-value {
      font-size: 1.5rem;
      font-weight: 700;
      margin-bottom: 0.25rem;
    }
    
    .stat-label {
      font-size: 0.875rem;
      color: #666;
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
          <li class="nav-item active" data-section="rosters">
            <a href="${pageContext.request.contextPath}/faculty/rosters">
              <i class="fas fa-users"></i>
              <span>Class Rosters</span>
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
            <a href="#" id="logoutLink">
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
        <h1>Class Rosters</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="roster-container">
        <!-- Course Selector -->
        <div class="roster-card">
          <div class="course-selector">
            <div class="selector-label">Select Course:</div>
            <select class="course-select" id="courseSelect">
              <option value="0">-- Select a course --</option>
              <% if (request.getAttribute("coursesTaught") != null) { 
                   List<Course> courses = (List<Course>) request.getAttribute("coursesTaught");
                   for (Course course : courses) { %>
                      <option value="<%= course.getCourseId() %>"><%= course.getCourseName() %></option>
                   <% } 
                 } else { %>
                  <option value="1">Introduction to Programming</option>
                  <option value="2">Data Structures</option>
                  <option value="3">Database Systems</option>
              <% } %>
            </select>
          </div>
          
          <div class="alert-box">
            <div class="alert-icon">
              <i class="fas fa-info-circle"></i>
            </div>
            <div class="alert-content">
              Please select a course to view its roster.
            </div>
          </div>
          
          <!-- Student Table -->
          <div class="table-container">
            <table class="student-table" id="studentTable">
              <thead>
                <tr>
                  <th>Student ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Current Grade</th>
                </tr>
              </thead>
              <tbody>
                <% if (request.getAttribute("students") != null) { 
                     List<Student> students = (List<Student>) request.getAttribute("students");
                     for (Student student : students) { %>
                        <tr>
                          <td><%= student.getStudentNumber() %></td>
                          <td><%= student.getLastName() %>, <%= student.getFirstName() %></td>
                          <td><%= student.getEmail() %></td>
                          <td><%= request.getAttribute("grades" + student.getId()) != null ? request.getAttribute("grades" + student.getId()) : "Not Graded" %></td>
                </tr>
                     <% } 
                   } else { %>
                <tr>
                      <td colspan="4" style="text-align: center;">Select a course to view student roster</td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </main>
  </div>

  <!-- Logout Confirmation Modal -->
  <div id="logoutModal" class="modal">
    <div class="modal-content logout-modal">
      <div class="logout-header">
        <h2>Confirm Logout</h2>
        <span class="close-modal" id="closeLogoutModal">&times;</span>
      </div>
      <div class="logout-body">
        <p>Are you sure you want to log out of your account?</p>
        <div class="logout-actions">
          <button class="logout-cancel-btn">Cancel</button>
          <button class="logout-confirm-btn">Logout</button>
        </div>
      </div>
    </div>
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
    
    document.addEventListener('DOMContentLoaded', function() {
      setCurrentDate();
      
      // Logout Modal
      const logoutModal = document.getElementById('logoutModal');
      const logoutLink = document.getElementById('logoutLink');
      const closeLogoutModal = document.getElementById('closeLogoutModal');
      const cancelLogoutBtn = document.querySelector('.logout-cancel-btn');
      const confirmLogoutBtn = document.querySelector('.logout-confirm-btn');
      
      // Open logout modal when logout link is clicked
      logoutLink.addEventListener('click', function(e) {
        e.preventDefault();
        logoutModal.style.display = 'block';
        document.body.classList.add('modal-open');
      });
      
      // Close logout modal
      function closeLogoutModalFunc() {
        logoutModal.style.display = 'none';
        document.body.classList.remove('modal-open');
      }
      
      // Close modal when X is clicked
      closeLogoutModal.addEventListener('click', closeLogoutModalFunc);
      
      // Close modal when Cancel is clicked
      cancelLogoutBtn.addEventListener('click', closeLogoutModalFunc);
      
      // Handle logout confirmation
      confirmLogoutBtn.addEventListener('click', function() {
        window.location.href = "${pageContext.request.contextPath}/";
      });
      
      // Course selector
      const courseSelect = document.getElementById('courseSelect');
      
      courseSelect.addEventListener('change', function() {
        const selectedCourse = this.value;
        
        if (selectedCourse !== "0") {
          // Redirect to the roster page with the selected course
          window.location.href = "${pageContext.request.contextPath}/faculty/rosters?courseId=" + selectedCourse;
        }
      });
    });
  </script>
</body>
</html>
