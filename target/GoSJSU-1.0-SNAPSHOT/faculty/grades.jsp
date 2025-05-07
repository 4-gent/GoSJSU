<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Grades | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .grades-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .course-selector {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 2rem;
    }
    
    .course-selector h2 {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 1.25rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }
    
    .course-tabs {
      display: flex;
      gap: 1rem;
      flex-wrap: wrap;
    }
    
    .course-tab {
      padding: 0.75rem 1.5rem;
      background-color: var(--surface-secondary);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 0.95rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .course-tab:hover {
      background-color: var(--primary-light);
      border-color: var(--primary);
    }
    
    .course-tab.active {
      background-color: var(--primary);
      color: white;
      border-color: var(--primary);
    }
    
    .grades-table-container {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 2rem;
      overflow-x: auto;
    }
    
    .grades-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .grades-table th {
      background-color: var(--surface-secondary);
      padding: 1rem;
      text-align: left;
      font-size: 0.875rem;
      font-weight: 600;
      color: var(--text-primary);
      border-bottom: 2px solid var(--border);
    }
    
    .grades-table td {
      padding: 1rem;
      font-size: 0.95rem;
      border-bottom: 1px solid var(--border);
    }
    
    .grades-table tr:hover td {
      background-color: var(--surface-hover);
    }
    
    .grades-table tr:last-child td {
      border-bottom: none;
    }
    
    .grade-input {
      width: 80px;
      padding: 0.5rem;
      border: 1px solid var(--border);
      border-radius: var(--radius-sm);
      text-align: center;
      font-size: 0.95rem;
    }
    
    .grade-input:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
    }
    
    .grade-status {
      display: inline-block;
      padding: 0.25rem 0.5rem;
      border-radius: var(--radius-sm);
      font-size: 0.75rem;
      font-weight: 600;
    }
    
    .grade-status.submitted {
      background-color: var(--success-light);
      color: var(--success);
    }
    
    .grade-status.pending {
      background-color: var(--warning-light);
      color: var(--warning);
    }
    
    .grade-status.not-started {
      background-color: var(--gray-bg);
      color: var(--gray-text);
    }
    
    .action-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 1.5rem;
    }
    
    .action-bar-left {
      display: flex;
      gap: 1rem;
    }
    
    .action-bar-right {
      display: flex;
      gap: 1rem;
    }
    
    .save-btn {
      padding: 0.75rem 1.5rem;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .save-btn:hover {
      background-color: var(--primary-dark);
      box-shadow: 0 4px 12px rgba(79, 70, 229, 0.2);
    }
    
    .export-btn {
      padding: 0.75rem 1.5rem;
      background-color: var(--surface-secondary);
      color: var(--text-primary);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .export-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .grade-summary {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 2rem;
    }
    
    .grade-summary h2 {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 1.25rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }
    
    .summary-stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 1.5rem;
    }
    
    .summary-stat {
      text-align: center;
    }
    
    .stat-value {
      font-size: 2rem;
      font-weight: 700;
      color: var(--primary);
      margin-bottom: 0.5rem;
    }
    
    .stat-label {
      font-size: 0.95rem;
      color: var(--text-secondary);
    }
    
    .grade-distribution {
      margin-top: 2rem;
    }
    
    .distribution-bars {
      display: flex;
      height: 200px;
      align-items: flex-end;
      gap: 1.5rem;
      margin-top: 1.5rem;
    }
    
    .distribution-bar {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    
    .bar {
      width: 100%;
      background-color: var(--primary-light);
      border-radius: var(--radius-sm) var(--radius-sm) 0 0;
      transition: all 0.3s ease;
    }
    
    .bar:hover {
      background-color: var(--primary);
    }
    
    .bar-label {
      margin-top: 0.5rem;
      font-size: 0.95rem;
      font-weight: 600;
    }
    
    .bar-value {
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
          <li class="nav-item" data-section="students">
            <a href="${pageContext.request.contextPath}/faculty/students?facultyId=987654321">
              <i class="fas fa-user-graduate"></i>
              <span>Students</span>
            </a>
          </li>
          <li class="nav-item active" data-section="grades">
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
        <h1>Manage Grades - Professor Chris Pollett</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="grades-container">
        <!-- Course Selector -->
        <div class="course-selector">
          <h2>Select Course</h2>
          <div class="course-tabs">
            <div class="course-tab active" data-course="cs162">CS 162 - Circuit Theory</div>
            <div class="course-tab" data-course="cs136">CS 136 - Introduction to Web Development</div>
            <div class="course-tab" data-course="cs149">CS 149 - Operating Systems</div>
            <div class="course-tab" data-course="cs157">CS 157A - Database Management Systems</div>
          </div>
        </div>
        
        <!-- Grade Summary -->
        <div class="grade-summary">
          <h2>CS 162 - Circuit Theory (Spring 2025)</h2>
          
          <div class="summary-stats">
            <div class="summary-stat">
              <div class="stat-value">25</div>
              <div class="stat-label">Total Students</div>
            </div>
            <div class="summary-stat">
              <div class="stat-value">22</div>
              <div class="stat-label">Grades Submitted</div>
            </div>
            <div class="summary-stat">
              <div class="stat-value">85.7%</div>
              <div class="stat-label">Class Average</div>
            </div>
            <div class="summary-stat">
              <div class="stat-value">92%</div>
              <div class="stat-label">Highest Grade</div>
            </div>
          </div>
          
          <div class="grade-distribution">
            <h3>Grade Distribution</h3>
            <div class="distribution-bars">
              <div class="distribution-bar">
                <div class="bar" style="height: 60%;"></div>
                <div class="bar-label">A</div>
                <div class="bar-value">8 students</div>
              </div>
              <div class="distribution-bar">
                <div class="bar" style="height: 40%;"></div>
                <div class="bar-label">B</div>
                <div class="bar-value">6 students</div>
              </div>
              <div class="distribution-bar">
                <div class="bar" style="height: 30%;"></div>
                <div class="bar-label">C</div>
                <div class="bar-value">5 students</div>
              </div>
              <div class="distribution-bar">
                <div class="bar" style="height: 15%;"></div>
                <div class="bar-label">D</div>
                <div class="bar-value">3 students</div>
              </div>
              <div class="distribution-bar">
                <div class="bar" style="height: 5%;"></div>
                <div class="bar-label">F</div>
                <div class="bar-value">1 student</div>
              </div>
              <div class="distribution-bar">
                <div class="bar" style="height: 10%;"></div>
                <div class="bar-label">N/A</div>
                <div class="bar-value">2 students</div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Grades Table -->
        <div class="grades-table-container">
          <table class="grades-table">
            <thead>
              <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Midterm (30%)</th>
                <th>Assignments (40%)</th>
                <th>Final Exam (30%)</th>
                <th>Overall</th>
                <th>Letter Grade</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>123456789</td>
                <td>John Smith</td>
                <td><input type="text" class="grade-input" value="85"></td>
                <td><input type="text" class="grade-input" value="92"></td>
                <td><input type="text" class="grade-input" value="88"></td>
                <td>88.6%</td>
                <td>A-</td>
                <td><span class="grade-status submitted">Submitted</span></td>
              </tr>
              <tr>
                <td>987654321</td>
                <td>Emily Johnson</td>
                <td><input type="text" class="grade-input" value="78"></td>
                <td><input type="text" class="grade-input" value="85"></td>
                <td><input type="text" class="grade-input" value="80"></td>
                <td>81.4%</td>
                <td>B</td>
                <td><span class="grade-status submitted">Submitted</span></td>
              </tr>
              <tr>
                <td>456789123</td>
                <td>Michael Brown</td>
                <td><input type="text" class="grade-input" value="92"></td>
                <td><input type="text" class="grade-input" value="90"></td>
                <td><input type="text" class="grade-input" value="94"></td>
                <td>92.0%</td>
                <td>A</td>
                <td><span class="grade-status submitted">Submitted</span></td>
              </tr>
              <tr>
                <td>789123456</td>
                <td>Sarah Davis</td>
                <td><input type="text" class="grade-input" value="75"></td>
                <td><input type="text" class="grade-input" value="82"></td>
                <td><input type="text" class="grade-input" value="78"></td>
                <td>78.7%</td>
                <td>C+</td>
                <td><span class="grade-status submitted">Submitted</span></td>
              </tr>
              <tr>
                <td>321654987</td>
                <td>David Wilson</td>
                <td><input type="text" class="grade-input" value="88"></td>
                <td><input type="text" class="grade-input" value="85"></td>
                <td><input type="text" class="grade-input" value=""></td>
                <td>-</td>
                <td>-</td>
                <td><span class="grade-status pending">Pending</span></td>
              </tr>
              <tr>
                <td>654987321</td>
                <td>Jessica Martinez</td>
                <td><input type="text" class="grade-input" value="90"></td>
                <td><input type="text" class="grade-input" value="88"></td>
                <td><input type="text" class="grade-input" value=""></td>
                <td>-</td>
                <td>-</td>
                <td><span class="grade-status pending">Pending</span></td>
              </tr>
            </tbody>
          </table>
          
          <div class="action-bar">
            <div class="action-bar-left">
              <button class="export-btn">
                <i class="fas fa-file-export"></i>
                Export Grades
              </button>
              <button class="export-btn">
                <i class="fas fa-envelope"></i>
                Email Students
              </button>
            </div>
            <div class="action-bar-right">
              <button class="save-btn">Save Changes</button>
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
    
    // Store faculty information
    const facultyInfo = {
      id: "987654321",
      name: "Chris Pollett",
      department: "Computer Science"
    };
    
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
      
      // Course tabs
      const courseTabs = document.querySelectorAll('.course-tab');
      
      courseTabs.forEach(tab => {
        tab.addEventListener('click', function() {
          // Remove active class from all tabs
          courseTabs.forEach(t => t.classList.remove('active'));
          
          // Add active class to clicked tab
          this.classList.add('active');
          
          // Get course code
          const courseCode = this.dataset.course;
          
          // Here you would typically make an AJAX call to load the course data
          alert('Loading grades for course: ' + courseCode);
        });
      });
      
      // Save changes
      document.querySelector('.save-btn').addEventListener('click', function() {
        alert('Grades saved successfully!');
      });
      
      // Export grades
      document.querySelectorAll('.export-btn').forEach(btn => {
        btn.addEventListener('click', function() {
          const action = this.textContent.trim();
          alert(action + ' functionality would be implemented with backend integration.');
        });
      });
      
      // Grade inputs
      const gradeInputs = document.querySelectorAll('.grade-input');
      
      gradeInputs.forEach(input => {
        input.addEventListener('change', function() {
          const value = parseFloat(this.value);
          
          // Validate input
          if (isNaN(value) || value < 0 || value > 100) {
            alert('Please enter a valid grade between 0 and 100.');
            this.value = '';
            return;
          }
          
          // Here you would typically update the overall grade and letter grade
          const row = this.closest('tr');
          const statusCell = row.querySelector('.grade-status');
          
          if (statusCell.textContent === 'Submitted') {
            statusCell.textContent = 'Modified';
            statusCell.className = 'grade-status pending';
          }
        });
      });
    });
  </script>
</body>
</html> 