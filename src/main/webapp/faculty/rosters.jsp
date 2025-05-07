<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Rosters | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .roster-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .roster-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
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
      color: var(--text-secondary);
    }
    
    .course-select {
      flex: 1;
      max-width: 300px;
      padding: 0.75rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      background-color: white;
      font-size: 0.95rem;
      color: var(--text-primary);
    }
    
    .search-container {
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
    
    .search-btn {
      padding: 0.75rem 1.5rem;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.2s;
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
      padding: 1rem;
      font-size: 0.875rem;
      font-weight: 600;
      color: var(--text-secondary);
      border-bottom: 1px solid var(--border);
    }
    
    .student-table td {
      padding: 1rem;
      font-size: 0.95rem;
      border-bottom: 1px solid var(--border);
    }
    
    .student-table tr:last-child td {
      border-bottom: none;
    }
    
    .student-table tr:hover td {
      background-color: var(--surface-hover);
    }
    
    .student-status {
      display: inline-block;
      padding: 0.25rem 0.5rem;
      border-radius: var(--radius-sm);
      font-size: 0.75rem;
      font-weight: 500;
    }
    
    .status-active {
      background-color: var(--green-bg);
      color: var(--green-text);
    }
    
    .status-warning {
      background-color: var(--warning-bg);
      color: var(--warning-text);
    }
    
    .grade-pill {
      display: inline-block;
      width: 32px;
      height: 32px;
      border-radius: 50%;
      background-color: var(--surface-secondary);
      color: var(--text-primary);
      text-align: center;
      line-height: 32px;
      font-weight: 600;
      font-size: 0.875rem;
    }
    
    .grade-a {
      background-color: #d1fae5;
      color: #047857;
    }
    
    .grade-b {
      background-color: #e0f2fe;
      color: #0369a1;
    }
    
    .grade-c {
      background-color: #fef3c7;
      color: #92400e;
    }
    
    .grade-d, .grade-f {
      background-color: #fee2e2;
      color: #b91c1c;
    }
    
    .action-btn {
      padding: 0.5rem 0.75rem;
      border-radius: var(--radius);
      font-size: 0.75rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .view-btn {
      background-color: var(--primary-light);
      color: var(--primary);
      border: none;
    }
    
    .view-btn:hover {
      background-color: var(--primary);
      color: white;
    }
    
    .email-btn {
      background-color: var(--surface-secondary);
      color: var(--text-primary);
      border: 1px solid var(--border);
    }
    
    .email-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .roster-actions {
      display: flex;
      justify-content: space-between;
      margin-top: 1.5rem;
    }
    
    .action-buttons {
      display: flex;
      gap: 1rem;
    }
    
    .pagination {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .page-btn {
      width: 32px;
      height: 32px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: var(--radius);
      font-size: 0.875rem;
      border: 1px solid var(--border);
      background-color: white;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .page-btn:hover:not(.active) {
      background-color: var(--surface-hover);
    }
    
    .page-btn.active {
      background-color: var(--primary);
      color: white;
      border-color: var(--primary);
    }
    
    .alert-box {
      padding: 1rem;
      border-radius: var(--radius);
      background-color: var(--blue-bg);
      color: var(--blue-text);
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
      border-radius: var(--radius);
      padding: 1rem;
      border: 1px solid var(--border);
    }
    
    .stat-value {
      font-size: 1.5rem;
      font-weight: 700;
      margin-bottom: 0.25rem;
    }
    
    .stat-label {
      font-size: 0.875rem;
      color: var(--text-secondary);
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
          <li class="nav-item active" data-section="students">
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
        <h1>Student Rosters - Professor Chris Pollett</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="roster-container">
        <!-- Course Selector -->
        <div class="roster-card">
          <div class="course-selector">
            <div class="selector-label">Select Course:</div>
            <select class="course-select" id="courseSelect">
              <option value="all">All Courses (87 students)</option>
              <option value="CS162">CS 162 - Circuit Theory (25 students)</option>
              <option value="CS136">CS 136 - Introduction to Web Development (32 students)</option>
              <option value="CS149">CS 149 - Operating Systems (18 students)</option>
              <option value="CS157A">CS 157A - Database Management Systems (12 students)</option>
            </select>
          </div>
          
          <div class="alert-box">
            <div class="alert-icon">
              <i class="fas fa-info-circle"></i>
            </div>
            <div class="alert-content">
              Viewing roster for <strong>All Courses</strong>. Select a specific course from the dropdown to filter the student list.
            </div>
          </div>
          
          <!-- Roster Stats -->
          <div class="roster-stats">
            <div class="stat-card">
              <div class="stat-value">87</div>
              <div class="stat-label">Total Students</div>
            </div>
            <div class="stat-card">
              <div class="stat-value">92%</div>
              <div class="stat-label">Attendance Rate</div>
            </div>
            <div class="stat-card">
              <div class="stat-value">B+</div>
              <div class="stat-label">Average Grade</div>
            </div>
            <div class="stat-card">
              <div class="stat-value">8</div>
              <div class="stat-label">At-Risk Students</div>
            </div>
          </div>
          
          <!-- Search Bar -->
          <div class="search-container">
            <input type="text" class="search-input" placeholder="Search by student name, ID, or email...">
            <button class="search-btn">
              <i class="fas fa-search"></i> Search
            </button>
          </div>
          
          <!-- Student Table -->
          <div class="table-container">
            <table class="student-table">
              <thead>
                <tr>
                  <th>Student ID</th>
                  <th>Name</th>
                  <th>Course</th>
                  <th>Current Grade</th>
                  <th>Attendance</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>123456789</td>
                  <td>John Smith</td>
                  <td>CS 162</td>
                  <td><span class="grade-pill grade-a">A</span></td>
                  <td>95%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>987654321</td>
                  <td>Emily Johnson</td>
                  <td>CS 136</td>
                  <td><span class="grade-pill grade-b">B+</span></td>
                  <td>88%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>456789123</td>
                  <td>Michael Brown</td>
                  <td>CS 149</td>
                  <td><span class="grade-pill grade-a">A-</span></td>
                  <td>92%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>789123456</td>
                  <td>Jessica Davis</td>
                  <td>CS 162</td>
                  <td><span class="grade-pill grade-c">C</span></td>
                  <td>78%</td>
                  <td><span class="student-status status-warning">At Risk</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>321654987</td>
                  <td>David Wilson</td>
                  <td>CS 136</td>
                  <td><span class="grade-pill grade-b">B</span></td>
                  <td>85%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>654987321</td>
                  <td>Sarah Martinez</td>
                  <td>CS 149</td>
                  <td><span class="grade-pill grade-a">A</span></td>
                  <td>98%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>159357486</td>
                  <td>Robert Anderson</td>
                  <td>CS 157A</td>
                  <td><span class="grade-pill grade-d">D</span></td>
                  <td>65%</td>
                  <td><span class="student-status status-warning">At Risk</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>753159486</td>
                  <td>Jennifer Taylor</td>
                  <td>CS 136</td>
                  <td><span class="grade-pill grade-b">B-</span></td>
                  <td>82%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>951753852</td>
                  <td>Thomas Johnson</td>
                  <td>CS 162</td>
                  <td><span class="grade-pill grade-f">F</span></td>
                  <td>45%</td>
                  <td><span class="student-status status-warning">At Risk</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>357951852</td>
                  <td>Amanda Lewis</td>
                  <td>CS 149</td>
                  <td><span class="grade-pill grade-b">B+</span></td>
                  <td>90%</td>
                  <td><span class="student-status status-active">Good Standing</span></td>
                  <td>
                    <div style="display: flex; gap: 0.5rem;">
                      <button class="action-btn view-btn">View</button>
                      <button class="action-btn email-btn">Email</button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <!-- Roster Actions -->
          <div class="roster-actions">
            <div class="action-buttons">
              <button class="course-action-btn course-primary-btn">
                <i class="fas fa-file-export"></i>
                <span>Export Roster</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-envelope"></i>
                <span>Email All</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-print"></i>
                <span>Print Roster</span>
              </button>
            </div>
            
            <div class="pagination">
              <button class="page-btn">
                <i class="fas fa-chevron-left"></i>
              </button>
              <button class="page-btn active">1</button>
              <button class="page-btn">2</button>
              <button class="page-btn">3</button>
              <button class="page-btn">
                <i class="fas fa-chevron-right"></i>
              </button>
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
      
      // Store faculty information
      const facultyInfo = {
        id: "987654321",
        name: "Chris Pollett",
        department: "Computer Science"
      };
      
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
        const alertBox = document.querySelector('.alert-content');
        
        if (selectedCourse === 'all') {
          alertBox.innerHTML = 'Viewing roster for <strong>All Courses</strong>. Select a specific course from the dropdown to filter the student list.';
        } else {
          const courseText = this.options[this.selectedIndex].text;
          alertBox.innerHTML = `Viewing roster for <strong>${courseText}</strong>.`;
          
          // In a real app, this would filter the table to only show students from the selected course
          // For demo purposes, we're just updating the alert message
        }
      });
      
      // Student search functionality
      const searchBtn = document.querySelector('.search-btn');
      const searchInput = document.querySelector('.search-input');
      
      searchBtn.addEventListener('click', function() {
        const searchTerm = searchInput.value.trim().toLowerCase();
        
        if (searchTerm === '') {
          alert('Please enter a search term');
          return;
        }
        
        // In a real app, this would filter the table based on the search term
        alert(`Searching for: ${searchTerm}`);
      });
      
      // View student buttons
      const viewBtns = document.querySelectorAll('.view-btn');
      
      viewBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const row = this.closest('tr');
          const studentId = row.cells[0].textContent;
          const studentName = row.cells[1].textContent;
          
          alert(`Viewing details for ${studentName} (ID: ${studentId})`);
        });
      });
      
      // Email student buttons
      const emailBtns = document.querySelectorAll('.email-btn');
      
      emailBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const row = this.closest('tr');
          const studentName = row.cells[1].textContent;
          
          alert(`Composing email to ${studentName}`);
        });
      });
      
      // Roster action buttons
      const actionBtns = document.querySelectorAll('.course-action-btn');
      
      actionBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const action = this.querySelector('span').textContent;
          alert(`Action: ${action}`);
        });
      });
      
      // Pagination
      const pageBtns = document.querySelectorAll('.page-btn');
      
      pageBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          if (!this.classList.contains('active')) {
            document.querySelector('.page-btn.active').classList.remove('active');
            this.classList.add('active');
            
            // In a real app, this would load the corresponding page of results
          }
        });
      });
    });
  </script>
</body>
</html>
