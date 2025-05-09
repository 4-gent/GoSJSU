<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.faculty.Faculty" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty Profile | goSJSU</title>
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
          <li class="nav-item" data-section="dashboard">
            <a href="${pageContext.request.contextPath}/faculty/dashboard?employeeId=${param.employeeId}">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item active" data-section="profile">
            <a href="${pageContext.request.contextPath}/faculty/profile.jsp?employeeId=${param.employeeId}">
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
        <h1>Profile</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="profile-container">
        <% 
          Faculty faculty = (Faculty) request.getAttribute("faculty");
          if (faculty != null) { 
        %>
        <div class="profile-banner">
          <div class="profile-avatar-container">
            <!-- Placeholder for profile avatar -->
          </div>
        </div>

        <div class="profile-info">
          <h2 class="profile-name"><%= faculty.getFirstName() %> <%= faculty.getLastName() %></h2>
          <p class="profile-email"><%= faculty.getEmail() %></p>
          <p class="profile-department"><%= faculty.getDepartment() %></p>

          <div class="profile-stats">
            <div class="stat-item">
              <h3>Employee ID</h3>
              <p><%= faculty.getEmployeeId() %></p>
            </div>
            <div class="stat-item">
              <h3>Title</h3>
              <p><%= faculty.getTitle() %></p>
            </div>
          </div>

          <div class="profile-section">
            <h3>Contact</h3>
            <p>Email: <%= faculty.getEmail() %></p>
            <p>Office Phone: <%= faculty.getOfficePhone() %></p>
            <p>Mobile: <%= faculty.getMobilePhone() %></p>
          </div>

          <div class="profile-section">
            <h3>Office Information</h3>
            <p>Building: <%= faculty.getBuilding() %></p>
            <p>Office Number: <%= faculty.getOfficeNumber() %></p>
            <p>Office Hours: <%= faculty.getOfficeHours() %></p>
          </div>
        </div>
        <% 
          } else { 
        %>
        <p>Faculty profile not found.</p>
        <% } %>
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
    });
  </script>
</body>
</html>