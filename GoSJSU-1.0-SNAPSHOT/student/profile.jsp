<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Profile | goSJSU</title>
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
            <a href="${pageContext.request.contextPath}/student/dashboard?studentId=${param.studentId}">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item active" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile.jsp?studentId=${param.studentId}">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="registration">
            <a href="${pageContext.request.contextPath}/student/registration?studentId=${param.studentId}">
              <i class="fas fa-calendar-alt"></i>
              <span>Registration</span>
            </a>
          </li>
          <li class="nav-item" data-section="timetable">
            <a href="${pageContext.request.contextPath}/student/dashboard?studentId=${param.studentId}#timetable">
              <i class="fas fa-clock"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="${pageContext.request.contextPath}/student/dashboard?studentId=${param.studentId}#grades">
              <i class="fas fa-graduation-cap"></i>
              <span>Grades</span>
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
      
      <div class="profile-container" style="background-color: var(--surface); border-radius: var(--radius-md); box-shadow: var(--shadow); padding: 0; overflow: hidden;">
        <div class="profile-banner" style="position: relative; height: 200px; background: linear-gradient(135deg, #4338ca, #ec4899);">
          <div class="profile-banner-img"></div>
          <div class="profile-avatar-container" style="position: absolute; bottom: -40px; left: 50%; transform: translateX(-50%); width: 120px; height: 120px; border-radius: 50%; border: 4px solid var(--surface); overflow: hidden; background-color: var(--surface);">
            <img src="${pageContext.request.contextPath}/images/profile-avatar.jpg" alt="Profile avatar" class="profile-avatar" onerror="this.src='https://via.placeholder.com/120x120?text=MJ'" style="width: 100%; height: 100%; object-fit: cover;">
          </div>
        </div>
        
        <div class="profile-info" style="text-align: center; padding: 3rem 2rem 2rem;">
          <h2 class="profile-name" style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.25rem;">Marlon</h2>
          <p class="profile-email" style="font-size: 0.875rem; color: var(--text-secondary); margin-bottom: 0.5rem;">marlon.burog@sjsu.edu</p>
          <p class="profile-major" style="font-size: 1rem; font-weight: 500; color: var(--primary); margin-bottom: 1.5rem;">Software Engineer</p>
          
          <div class="profile-stats" style="display: flex; justify-content: center; gap: 4rem; margin-bottom: 2rem;">
            <div class="stat-item" style="text-align: center;">
              <h3 style="font-size: 1.25rem; font-weight: 700; margin-bottom: 0.25rem;">Year 3</h3>
              <p style="font-size: 0.875rem; color: var(--text-secondary);">Current Year</p>
            </div>
            <div class="stat-item" style="text-align: center;">
              <h3 style="font-size: 1.25rem; font-weight: 700; margin-bottom: 0.25rem;">123456789</h3>
              <p style="font-size: 0.875rem; color: var(--text-secondary);">Student ID</p>
            </div>
          </div>
          
          <div class="profile-section" style="background-color: var(--profile-section-bg, #f8fafc); border: 1px solid var(--profile-section-border, #e2e8f0); border-radius: var(--radius-md); padding: 1.5rem; margin-bottom: 1.5rem; text-align: left;">
            <h3 class="section-title" style="font-size: 1.125rem; font-weight: 600; margin-bottom: 1.25rem; color: var(--text-primary); position: relative; padding-left: 1rem; border-left: 3px solid var(--primary);">Personal</h3>
            <div class="profile-details" style="display: flex; flex-direction: column; gap: 1.5rem;">
              <div class="detail-row" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem;">
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">First name</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">MJ</p>
                </div>
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Major</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">Software Engineer</p>
                </div>
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Gender</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">Male</p>
                </div>
              </div>
              <div class="detail-row" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem;">
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Last Name</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">Marlon Burog</p>
                </div>
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Date of Birth</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">01/01/2001</p>
                </div>
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">City</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">San Jose</p>
                </div>
              </div>
            </div>
          </div>
          
          <div class="profile-section" style="background-color: var(--profile-section-bg, #f8fafc); border: 1px solid var(--profile-section-border, #e2e8f0); border-radius: var(--radius-md); padding: 1.5rem; margin-bottom: 1.5rem; text-align: left;">
            <h3 class="section-title" style="font-size: 1.125rem; font-weight: 600; margin-bottom: 1.25rem; color: var(--text-primary); position: relative; padding-left: 1rem; border-left: 3px solid var(--primary);">Contact</h3>
            <div class="profile-details" style="display: flex; flex-direction: column; gap: 1.5rem;">
              <div class="detail-row" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem;">
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Email</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">Marlon.Burog@sjsu.edu</p>
                </div>
                <div class="detail-item wide" style="display: flex; flex-direction: column; gap: 0.5rem; grid-column: span 2;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Postal Address</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">6969 Farpost CT<br>San Jose, CA 95121</p>
                </div>
              </div>
              <div class="detail-row" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem;">
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Mobile Number</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">0234567891</p>
                </div>
                <div class="detail-item" style="display: flex; flex-direction: column; gap: 0.5rem;">
                  <label style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 500;">Alternate Mobile Number</label>
                  <p style="font-size: 0.875rem; font-weight: 500;">0509876543</p>
                </div>
              </div>
            </div>
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
    });
  </script>
</body>
</html> 