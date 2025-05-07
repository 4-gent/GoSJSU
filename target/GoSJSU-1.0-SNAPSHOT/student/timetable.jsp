<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Timetable | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .timetable-controls {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 2rem;
      flex-wrap: wrap;
      gap: 1rem;
    }
    
    .semester-selector {
      display: flex;
      align-items: center;
    }
    
    .semester-selector label {
      margin-right: 0.5rem;
      font-weight: 500;
      color: #4b5563;
    }
    
    .select-control {
      padding: 0.5rem 1rem;
      border-radius: 0.375rem;
      border: 1px solid #e5e7eb;
      background-color: white;
      font-size: 0.875rem;
      color: #4b5563;
      min-width: 150px;
    }
    
    .week-navigation {
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }
    
    .week-nav-btn {
      display: flex;
      align-items: center;
      padding: 0.5rem 1rem;
      border: 1px solid #e5e7eb;
      border-radius: 0.375rem;
      background-color: white;
      color: #4b5563;
      font-size: 0.875rem;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .week-nav-btn:hover {
      border-color: #4a6cf7;
      color: #4a6cf7;
    }
    
    .current-week {
      font-weight: 500;
      color: #4b5563;
    }
    
    .view-options {
      display: flex;
      border: 1px solid #e5e7eb;
      border-radius: 0.375rem;
      overflow: hidden;
    }
    
    .view-option-btn {
      padding: 0.5rem 1rem;
      background-color: white;
      color: #4b5563;
      border: none;
      font-size: 0.875rem;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .view-option-btn.active {
      background-color: #4a6cf7;
      color: white;
    }
    
    .timetable-container {
      border-radius: 0.5rem;
      overflow: hidden;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      border: 1px solid #e5e7eb;
    }
    
    .timetable-header {
      display: grid;
      grid-template-columns: 80px repeat(5, 1fr);
      background-color: #f9fafb;
    }
    
    .time-column, .day-column {
      padding: 0.75rem;
      text-align: center;
      font-weight: 500;
      border-bottom: 1px solid #e5e7eb;
      border-right: 1px solid #e5e7eb;
    }
    
    .timetable-body {
      display: grid;
      grid-template-columns: 80px 1fr;
    }
    
    .time-slots {
      display: grid;
      grid-template-rows: repeat(10, 60px);
    }
    
    .time-slot {
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 0.75rem;
      color: #6b7280;
      border-bottom: 1px solid #e5e7eb;
      border-right: 1px solid #e5e7eb;
    }
    
    .schedule-grid {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      grid-template-rows: repeat(10, 60px);
      position: relative;
    }
    
    .class-block {
      padding: 0.5rem;
      border-radius: 0.25rem;
      position: relative;
      margin: 2px;
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    
    .class-block:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      z-index: 10;
    }
    
    .cs162 { background-color: #dbeafe; border-left: 4px solid #3b82f6; }
    .math124 { background-color: #dcfce7; border-left: 4px solid #22c55e; }
    .cs136 { background-color: #fef3c7; border-left: 4px solid #f59e0b; }
    .cs124 { background-color: #ede9fe; border-left: 4px solid #8b5cf6; }
    
    .class-block-content {
      display: flex;
      flex-direction: column;
      height: 100%;
    }
    
    .class-block-content h4 {
      margin: 0 0 0.25rem 0;
      font-size: 0.875rem;
      font-weight: 600;
    }
    
    .class-block-content p {
      margin: 0;
      font-size: 0.75rem;
      color: #4b5563;
    }
    
    .class-block-content .room {
      margin-top: auto;
      font-size: 0.75rem;
      color: #6b7280;
    }
    
    .classes-list-view {
      margin-top: 2rem;
    }
    
    .classes-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .classes-table th, .classes-table td {
      padding: 0.75rem 1rem;
      text-align: left;
      border-bottom: 1px solid #e5e7eb;
    }
    
    .classes-table th {
      background-color: #f9fafb;
      font-weight: 500;
      color: #4b5563;
    }
    
    @media (max-width: 768px) {
      .timetable-controls {
        flex-direction: column;
        align-items: stretch;
      }
      
      .timetable-header {
        grid-template-columns: 60px repeat(5, 1fr);
      }
      
      .timetable-body {
        grid-template-columns: 60px 1fr;
      }
      
      .time-slot, .day-column {
        font-size: 0.7rem;
        padding: 0.5rem;
      }
      
      .class-block-content h4 {
        font-size: 0.75rem;
      }
      
      .class-block-content p {
        font-size: 0.7rem;
      }
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
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="registration">
            <a href="${pageContext.request.contextPath}/student/registration">
              <i class="fas fa-calendar-alt"></i>
              <span>Registration</span>
            </a>
          </li>
          <li class="nav-item active" data-section="timetable">
            <a href="${pageContext.request.contextPath}/student/timetable">
              <i class="fas fa-clock"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="${pageContext.request.contextPath}/student/grades">
              <i class="fas fa-graduation-cap"></i>
              <span>Grades</span>
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
      <section id="timetable-section" class="content-section active">
        <header class="dashboard-header">
          <h1>Weekly Timetable</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <div class="timetable-controls">
          <div class="semester-selector">
            <label for="semester">Semester:</label>
            <select id="semester" class="select-control">
              <option value="spring2025">Spring 2025</option>
              <option value="fall2024">Fall 2024</option>
              <option value="summer2024">Summer 2024</option>
            </select>
          </div>
          <div class="week-navigation">
            <button class="week-nav-btn"><i class="fas fa-chevron-left"></i> Previous Week</button>
            <span class="current-week">May 13 - May 19, 2025</span>
            <button class="week-nav-btn">Next Week <i class="fas fa-chevron-right"></i></button>
          </div>
          <div class="view-options">
            <button class="view-option-btn active">Week</button>
            <button class="view-option-btn">Day</button>
            <button class="view-option-btn">List</button>
          </div>
        </div>

        <div class="timetable-container">
          <div class="timetable-header">
            <div class="time-column"></div>
            <div class="day-column">Monday</div>
            <div class="day-column">Tuesday</div>
            <div class="day-column">Wednesday</div>
            <div class="day-column">Thursday</div>
            <div class="day-column">Friday</div>
          </div>
          <div class="timetable-body">
            <div class="time-slots">
              <div class="time-slot">8:00 AM</div>
              <div class="time-slot">9:00 AM</div>
              <div class="time-slot">10:00 AM</div>
              <div class="time-slot">11:00 AM</div>
              <div class="time-slot">12:00 PM</div>
              <div class="time-slot">1:00 PM</div>
              <div class="time-slot">2:00 PM</div>
              <div class="time-slot">3:00 PM</div>
              <div class="time-slot">4:00 PM</div>
              <div class="time-slot">5:00 PM</div>
            </div>
            <div class="schedule-grid">
              <!-- Monday -->
              <div class="class-block cs162" style="grid-row: 1 / 3; grid-column: 1;">
                <div class="class-block-content">
                  <h4>CS 162</h4>
                  <p>Circuit Theory</p>
                  <p class="room">SF 13</p>
                </div>
              </div>
              <div class="class-block math124" style="grid-row: 3 / 5; grid-column: 1;">
                <div class="class-block-content">
                  <h4>MATH 124</h4>
                  <p>Discrete Math</p>
                  <p class="room">FF 10</p>
                </div>
              </div>
              
              <!-- Tuesday -->
              <div class="class-block cs136" style="grid-row: 6 / 8; grid-column: 2;">
                <div class="class-block-content">
                  <h4>CS 136</h4>
                  <p>Web Development</p>
                  <p class="room">SF 12</p>
                </div>
              </div>
              
              <!-- Wednesday -->
              <div class="class-block cs162" style="grid-row: 1 / 3; grid-column: 3;">
                <div class="class-block-content">
                  <h4>CS 162</h4>
                  <p>Circuit Theory</p>
                  <p class="room">SF 13</p>
                </div>
              </div>
              <div class="class-block math124" style="grid-row: 3 / 5; grid-column: 3;">
                <div class="class-block-content">
                  <h4>MATH 124</h4>
                  <p>Discrete Math</p>
                  <p class="room">FF 10</p>
                </div>
              </div>
              
              <!-- Thursday -->
              <div class="class-block cs136" style="grid-row: 6 / 8; grid-column: 4;">
                <div class="class-block-content">
                  <h4>CS 136</h4>
                  <p>Web Development</p>
                  <p class="room">SF 12</p>
                </div>
              </div>
              
              <!-- Friday -->
              <div class="class-block cs124" style="grid-row: 8 / 10; grid-column: 5;">
                <div class="class-block-content">
                  <h4>CS 124</h4>
                  <p>Computer Architecture</p>
                  <p class="room">SF 20</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Classes List View (Hidden by default) -->
        <div class="classes-list-view" style="display: none;">
          <h2>All Classes</h2>
          <table class="classes-table">
            <thead>
              <tr>
                <th>Course</th>
                <th>Title</th>
                <th>Days</th>
                <th>Time</th>
                <th>Location</th>
                <th>Instructor</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>CS 162</td>
                <td>Circuit Theory</td>
                <td>MW</td>
                <td>8:00 AM - 9:50 AM</td>
                <td>SF 13</td>
                <td>Dr. Johnson</td>
              </tr>
              <tr>
                <td>MATH 124</td>
                <td>Discrete Math</td>
                <td>MW</td>
                <td>10:00 AM - 11:50 AM</td>
                <td>FF 10</td>
                <td>Dr. Smith</td>
              </tr>
              <tr>
                <td>CS 136</td>
                <td>Web Development</td>
                <td>TTh</td>
                <td>1:00 PM - 2:50 PM</td>
                <td>SF 12</td>
                <td>Prof. Williams</td>
              </tr>
              <tr>
                <td>CS 124</td>
                <td>Computer Architecture</td>
                <td>F</td>
                <td>3:00 PM - 4:50 PM</td>
                <td>SF 20</td>
                <td>Dr. Chen</td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
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
      
      // View options functionality
      const viewButtons = document.querySelectorAll('.view-option-btn');
      const timetableContainer = document.querySelector('.timetable-container');
      const classesListView = document.querySelector('.classes-list-view');
      
      viewButtons.forEach(button => {
        button.addEventListener('click', function() {
          // Remove active class from all buttons
          viewButtons.forEach(btn => btn.classList.remove('active'));
          
          // Add active class to clicked button
          button.classList.add('active');
          
          // Show appropriate view
          if (button.textContent.trim() === 'List') {
            timetableContainer.style.display = 'none';
            classesListView.style.display = 'block';
          } else {
            timetableContainer.style.display = 'block';
            classesListView.style.display = 'none';
          }
        });
      });
      
      // Logout Modal Functionality
      const logoutModal = document.getElementById('logoutModal');
      const logoutLink = document.querySelector('[data-section="logout"] a');
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