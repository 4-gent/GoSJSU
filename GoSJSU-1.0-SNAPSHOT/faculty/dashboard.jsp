<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    /* Faculty-specific styles */
    .faculty-card {
      border-radius: var(--radius-md);
      padding: 1.5rem;
      transition: all 0.3s ease;
      box-shadow: var(--shadow);
    }
    
    .faculty-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-md);
    }
    
    .faculty-card.blue {
      background-color: var(--blue-bg);
      color: var(--blue-text);
      border: 1px solid var(--blue-border);
    }
    
    .faculty-card.green {
      background-color: var(--green-bg);
      color: var(--green-text);
      border: 1px solid var(--green-border);
    }
    
    .faculty-card.purple {
      background-color: var(--purple-bg);
      color: var(--purple-text);
      border: 1px solid var(--purple-border);
    }
    
    .faculty-card.gray {
      background-color: var(--gray-bg);
      color: var(--gray-text);
      border: 1px solid var(--gray-border);
    }
    
    .faculty-card h3 {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 0.75rem;
    }
    
    .faculty-card .stat {
      font-size: 2.25rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
    }
    
    .faculty-card .sub {
      font-size: 0.875rem;
      opacity: 0.8;
    }
    
    .course-list-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .course-list {
      margin-top: 1rem;
    }
    
    .course-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem;
      border-radius: var(--radius);
      margin-bottom: 0.75rem;
      transition: all 0.2s ease;
    }
    
    .course-item:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow);
    }
    
    .course-item.active {
      background-color: var(--purple-bg);
      border-left: 4px solid var(--purple-text);
    }
    
    .course-item.upcoming {
      background-color: var(--gray-bg);
      border-left: 4px solid var(--gray-text);
    }
    
    .course-info {
      display: flex;
      flex-direction: column;
      gap: 0.25rem;
    }
    
    .course-code {
      font-size: 0.875rem;
      font-weight: 600;
      color: var(--text-secondary);
    }
    
    .course-name {
      font-size: 1.1rem;
      font-weight: 600;
    }
    
    .course-details {
      font-size: 0.875rem;
      color: var(--text-tertiary);
    }
    
    .course-stats {
      display: flex;
      flex-direction: column;
      align-items: flex-end;
      gap: 0.25rem;
    }
    
    .course-time {
      font-size: 0.875rem;
      font-weight: 600;
    }
    
    .course-students {
      font-size: 0.875rem;
      color: var(--text-secondary);
    }
    
    .action-buttons {
      display: flex;
      gap: 0.5rem;
    }
    
    .action-btn {
      padding: 0.5rem 1rem;
      border-radius: var(--radius);
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
      border: none;
    }
    
    .view-btn {
      background-color: var(--primary-light);
      color: var(--primary);
    }
    
    .view-btn:hover {
      background-color: var(--primary);
      color: white;
    }
    
    .grade-btn {
      background-color: var(--green-bg);
      color: var(--green-text);
    }
    
    .grade-btn:hover {
      background-color: var(--green-text);
      color: white;
    }
    
    .student-search-container {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .search-form {
      display: flex;
      gap: 1rem;
      margin-bottom: 1.5rem;
    }
    
    .search-input {
      flex: 1;
      padding: 0.75rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 0.95rem;
    }
    
    .search-input:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
    }
    
    .search-btn {
      padding: 0.75rem 1.5rem;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .search-btn:hover {
      background-color: var(--primary-dark);
    }
    
    .student-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .student-table th {
      text-align: left;
      padding: 0.75rem 1rem;
      font-size: 0.75rem;
      font-weight: 600;
      color: var(--text-secondary);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      border-bottom: 1px solid var(--border);
    }
    
    .student-table td {
      padding: 0.75rem 1rem;
      font-size: 0.875rem;
      border-bottom: 1px solid var(--border);
    }
    
    .student-table tr:last-child td {
      border-bottom: none;
    }
    
    .student-table tr:hover td {
      background-color: var(--surface-hover);
    }
    
    .deadline-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .deadline-list {
      margin-top: 1rem;
    }
    
    .deadline-item {
      display: flex;
      align-items: center;
      gap: 1rem;
      padding-bottom: 1rem;
      margin-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }
    
    .deadline-item:last-child {
      margin-bottom: 0;
      padding-bottom: 0;
      border-bottom: none;
    }
    
    .deadline-date {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 50px;
      height: 50px;
      background-color: var(--primary);
      color: white;
      border-radius: var(--radius-sm);
      flex-shrink: 0;
    }
    
    .deadline-date .month {
      font-size: 0.625rem;
      font-weight: 500;
      text-transform: uppercase;
    }
    
    .deadline-date .day {
      font-size: 1.25rem;
      font-weight: 700;
    }
    
    .deadline-info {
      flex: 1;
    }
    
    .deadline-title {
      font-size: 0.95rem;
      font-weight: 600;
      margin-bottom: 0.25rem;
    }
    
    .deadline-course {
      font-size: 0.875rem;
      color: var(--text-secondary);
    }
    
    .deadline-urgent .deadline-date {
      background-color: var(--task-danger-text);
    }
    
    .deadline-upcoming .deadline-date {
      background-color: var(--warning);
    }
    
    .quick-actions-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
    }
    
    .quick-actions {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 1rem;
      margin-top: 1rem;
    }
    
    .quick-action {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      padding: 1.25rem 1rem;
      background-color: var(--surface-secondary);
      border-radius: var(--radius);
      transition: all 0.2s ease;
      border: 1px solid var(--border);
    }
    
    .quick-action:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow);
      border-color: var(--primary-light);
    }
    
    .quick-action i {
      font-size: 1.5rem;
      color: var(--primary);
      margin-bottom: 0.75rem;
    }
    
    .quick-action span {
      font-size: 0.875rem;
      font-weight: 500;
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
            <a href="${pageContext.request.contextPath}/faculty/dashboard?facultyId=987654321">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="courses">
            <a href="${pageContext.request.contextPath}/faculty/courses?facultyId=987654321">
              <i class="fas fa-book"></i>
              <span>My Courses</span>
            </a>
          </li>
          <li class="nav-item" data-section="students">
            <a href="${pageContext.request.contextPath}/faculty/rosters?facultyId=987654321">
              <i class="fas fa-user-graduate"></i>
              <span>Students</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="${pageContext.request.contextPath}/faculty/grades?facultyId=987654321">
              <i class="fas fa-chart-bar"></i>
              <span>Grades</span>
            </a>
          </li>
          <li class="nav-item" data-section="reports">
            <a href="${pageContext.request.contextPath}/faculty/reports?facultyId=987654321">
              <i class="fas fa-file-alt"></i>
              <span>Reports</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/faculty/profile?facultyId=987654321">
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
        <h1>Welcome, Professor Chris Pollett</h1>
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

      <div class="content-grid">
        <!-- Left Column -->
        <div class="left-column">
          <!-- Today's Classes -->
          <div class="course-list-card">
            <div class="section-header">
              <h2>Today's Classes</h2>
              <a href="#" class="view-all">View Schedule <i class="fas fa-arrow-right"></i></a>
            </div>
            
            <div class="course-list">
              <div class="course-item active">
                <div class="course-info">
                  <div class="course-code">CS 162</div>
                  <div class="course-name">Circuit Theory</div>
                  <div class="course-details">SF 13 • 8:00 AM - 9:15 AM</div>
                </div>
                <div class="course-stats">
                  <div class="course-students">25 Students</div>
                  <div class="action-buttons">
                    <button class="action-btn view-btn">View</button>
                    <button class="action-btn grade-btn">Grades</button>
                  </div>
                </div>
              </div>
              
              <div class="course-item active">
                <div class="course-info">
                  <div class="course-code">CS 136</div>
                  <div class="course-name">Introduction to Web Development</div>
                  <div class="course-details">SF 12 • 1:00 PM - 2:15 PM</div>
                </div>
                <div class="course-stats">
                  <div class="course-students">32 Students</div>
                  <div class="action-buttons">
                    <button class="action-btn view-btn">View</button>
                    <button class="action-btn grade-btn">Grades</button>
                  </div>
                </div>
              </div>
              
              <div class="course-item upcoming">
                <div class="course-info">
                  <div class="course-code">CS 149</div>
                  <div class="course-name">Operating Systems</div>
                  <div class="course-details">MH 233 • 3:00 PM - 4:15 PM</div>
                </div>
                <div class="course-stats">
                  <div class="course-students">18 Students</div>
                  <div class="action-buttons">
                    <button class="action-btn view-btn">View</button>
                    <button class="action-btn grade-btn">Grades</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Student Search -->
          <div class="student-search-container">
            <div class="section-header">
              <h2>Student Search</h2>
            </div>
            
            <div class="search-form">
              <input type="text" class="search-input" placeholder="Search by student name or ID...">
              <button class="search-btn">Search</button>
            </div>
            
            <div class="student-results">
              <table class="student-table">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th>Current Grade</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>123456789</td>
                    <td>John Smith</td>
                    <td>CS 162</td>
                    <td><span class="grade-a">A</span></td>
                    <td>
                      <button class="action-btn view-btn">View</button>
                    </td>
                  </tr>
                  <tr>
                    <td>987654321</td>
                    <td>Emily Johnson</td>
                    <td>CS 136</td>
                    <td><span class="grade-b">B+</span></td>
                    <td>
                      <button class="action-btn view-btn">View</button>
                    </td>
                  </tr>
                  <tr>
                    <td>456789123</td>
                    <td>Michael Brown</td>
                    <td>CS 149</td>
                    <td><span class="grade-a">A-</span></td>
                    <td>
                      <button class="action-btn view-btn">View</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Right Column -->
        <div class="right-column">
          <!-- Upcoming Deadlines -->
          <div class="deadline-card">
            <div class="section-header">
              <h2>Upcoming Deadlines</h2>
              <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
            </div>
            
            <div class="deadline-list">
              <div class="deadline-item deadline-urgent">
                <div class="deadline-date">
                  <span class="month">May</span>
                  <span class="day">15</span>
                </div>
                <div class="deadline-info">
                  <div class="deadline-title">Midterm Grade Submission</div>
                  <div class="deadline-course">CS 162, CS 136</div>
                </div>
              </div>
              
              <div class="deadline-item deadline-upcoming">
                <div class="deadline-date">
                  <span class="month">May</span>
                  <span class="day">20</span>
                </div>
                <div class="deadline-info">
                  <div class="deadline-title">Course Registration Deadline</div>
                  <div class="deadline-course">All Courses</div>
                </div>
              </div>
              
              <div class="deadline-item">
                <div class="deadline-date">
                  <span class="month">Jun</span>
                  <span class="day">05</span>
                </div>
                <div class="deadline-info">
                  <div class="deadline-title">Final Exam Schedule</div>
                  <div class="deadline-course">All Courses</div>
                </div>
              </div>
            </div>
          </div>

          <!-- Quick Actions -->
          <div class="quick-actions-card">
            <div class="section-header">
              <h2>Quick Actions</h2>
            </div>
            
            <div class="quick-actions">
              <a href="#" class="quick-action">
                <i class="fas fa-plus-circle"></i>
                <span>Add Student</span>
              </a>
              <a href="#" class="quick-action">
                <i class="fas fa-edit"></i>
                <span>Enter Grades</span>
              </a>
              <a href="#" class="quick-action">
                <i class="fas fa-file-export"></i>
                <span>Export Report</span>
              </a>
              <a href="#" class="quick-action">
                <i class="fas fa-envelope"></i>
                <span>Email Class</span>
              </a>
            </div>
          </div>

          <!-- Recent Activity -->
          <div class="card" style="background-color: var(--primary); color: white;">
            <div class="section-header">
              <h2 style="color: white;">Recent Activity</h2>
            </div>
            
            <ul class="activity-list" style="list-style: none; padding: 0; margin: 0;">
              <li style="display: flex; gap: 0.75rem; margin-bottom: 1rem;">
                <i class="fas fa-edit" style="margin-top: 0.25rem;"></i>
                <div>
                  <p>Updated grades for CS 136</p>
                  <p style="font-size: 0.875rem; opacity: 0.8;">Today, 10:30 AM</p>
                </div>
              </li>
              <li style="display: flex; gap: 0.75rem; margin-bottom: 1rem;">
                <i class="fas fa-user-plus" style="margin-top: 0.25rem;"></i>
                <div>
                  <p>Added new student to CS 149</p>
                  <p style="font-size: 0.875rem; opacity: 0.8;">Today, 9:15 AM</p>
                </div>
              </li>
              <li style="display: flex; gap: 0.75rem;">
                <i class="fas fa-file-alt" style="margin-top: 0.25rem;"></i>
                <div>
                  <p>Generated midterm report for CS 162</p>
                  <p style="font-size: 0.875rem; opacity: 0.8;">Yesterday, 2:45 PM</p>
                </div>
              </li>
            </ul>
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
      
      // View Course buttons
      document.querySelectorAll('.view-btn').forEach(btn => {
        btn.addEventListener('click', function() {
          const courseItem = this.closest('.course-item');
          if (courseItem) {
            const courseName = courseItem.querySelector('.course-name').textContent;
            alert('Viewing course: ' + courseName);
          } else {
            const row = this.closest('tr');
            if (row) {
              const studentName = row.cells[1].textContent;
              alert('Viewing student: ' + studentName);
            }
          }
        });
      });
      
      // Grade buttons
      document.querySelectorAll('.grade-btn').forEach(btn => {
        btn.addEventListener('click', function() {
          const courseItem = this.closest('.course-item');
          const courseName = courseItem.querySelector('.course-name').textContent;
          alert('Managing grades for: ' + courseName);
        });
      });
      
      // Search functionality
      document.querySelector('.search-btn').addEventListener('click', function() {
        const searchInput = document.querySelector('.search-input').value;
        if (searchInput.trim() !== '') {
          alert('Searching for: ' + searchInput);
        } else {
          alert('Please enter a search term');
        }
      });
      
      // Quick actions
      document.querySelectorAll('.quick-action').forEach(action => {
        action.addEventListener('click', function(e) {
          e.preventDefault();
          const actionText = this.querySelector('span').textContent;
          alert('Action: ' + actionText);
        });
      });
      
      // Store faculty information
      const facultyInfo = {
        id: "987654321",
        name: "Chris Pollett",
        department: "Computer Science"
      };
    });
  </script>
</body>
</html> 