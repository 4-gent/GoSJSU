<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reports | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .reports-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .report-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .report-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 1.5rem;
      margin-top: 1.5rem;
    }
    
    .report-item {
      background-color: white;
      border-radius: var(--radius);
      padding: 1.5rem;
      border: 1px solid var(--border);
      transition: all 0.3s ease;
      display: flex;
      flex-direction: column;
      height: 100%;
    }
    
    .report-item:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-md);
      border-color: var(--primary-light);
    }
    
    .report-icon {
      width: 50px;
      height: 50px;
      background-color: var(--primary-light);
      color: var(--primary);
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: var(--radius);
      margin-bottom: 1rem;
      font-size: 1.25rem;
    }
    
    .report-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
    }
    
    .report-description {
      font-size: 0.95rem;
      color: var(--text-secondary);
      margin-bottom: 1.5rem;
      flex-grow: 1;
    }
    
    .report-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 0.875rem;
      color: var(--text-tertiary);
      padding-top: 1rem;
      border-top: 1px solid var(--border);
    }
    
    .report-date {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .report-action {
      display: flex;
      gap: 1rem;
      margin-top: 1rem;
    }
    
    .report-btn {
      padding: 0.625rem 1.25rem;
      border-radius: var(--radius);
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .report-primary-btn {
      background-color: var(--primary);
      color: white;
      border: none;
    }
    
    .report-primary-btn:hover {
      background-color: var(--primary-dark);
    }
    
    .report-secondary-btn {
      background-color: white;
      color: var(--text-primary);
      border: 1px solid var(--border);
    }
    
    .report-secondary-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .generate-report {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .form-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 1.5rem;
      margin-top: 1.5rem;
    }
    
    .form-group {
      margin-bottom: 1rem;
    }
    
    .form-label {
      display: block;
      font-size: 0.875rem;
      font-weight: 500;
      margin-bottom: 0.5rem;
      color: var(--text-secondary);
    }
    
    .form-control {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 0.95rem;
      color: var(--text-primary);
      background-color: white;
    }
    
    .form-control:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
    }
    
    .form-actions {
      margin-top: 1.5rem;
      display: flex;
      gap: 1rem;
    }
    
    .section-header {
      margin-bottom: 1.5rem;
    }
    
    .section-title {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--text-primary);
      margin-bottom: 0.5rem;
    }
    
    .section-subtitle {
      font-size: 1rem;
      color: var(--text-secondary);
    }
    
    .tab-container {
      margin-bottom: 1.5rem;
    }
    
    .tabs {
      display: flex;
      border-bottom: 1px solid var(--border);
      margin-bottom: 1.5rem;
    }
    
    .tab {
      padding: 0.75rem 1.5rem;
      cursor: pointer;
      font-size: 0.95rem;
      font-weight: 500;
      color: var(--text-secondary);
      position: relative;
    }
    
    .tab.active {
      color: var(--primary);
      font-weight: 600;
    }
    
    .tab.active::after {
      content: '';
      position: absolute;
      bottom: -1px;
      left: 0;
      width: 100%;
      height: 2px;
      background-color: var(--primary);
    }
    
    .tab-content {
      display: none;
    }
    
    .tab-content.active {
      display: block;
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
          <li class="nav-item active" data-section="reports">
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
        <h1>Reports - Professor Chris Pollett</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="reports-container">
        <!-- Tab Container -->
        <div class="tab-container">
          <div class="tabs">
            <div class="tab active" data-tab="available">Available Reports</div>
            <div class="tab" data-tab="generate">Generate New Report</div>
            <div class="tab" data-tab="recent">Recent Reports</div>
          </div>
          
          <!-- Tab Content: Available Reports -->
          <div class="tab-content active" id="available-reports">
            <div class="section-header">
              <h2 class="section-title">Available Reports</h2>
              <p class="section-subtitle">Select from predefined reports to gain insights into your courses and students</p>
            </div>
            
            <div class="report-grid">
              <!-- Report Item 1 -->
              <div class="report-item">
                <div class="report-icon">
                  <i class="fas fa-chart-bar"></i>
                </div>
                <h3 class="report-title">Grade Distribution</h3>
                <p class="report-description">Visualize the distribution of grades across all your courses or filter by specific course.</p>
                <div class="report-action">
                  <button class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate</span>
                  </button>
                </div>
              </div>
              
              <!-- Report Item 2 -->
              <div class="report-item">
                <div class="report-icon">
                  <i class="fas fa-user-graduate"></i>
                </div>
                <h3 class="report-title">Student Performance</h3>
                <p class="report-description">Track individual student performance across assignments, exams, and overall course grades.</p>
                <div class="report-action">
                  <button class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate</span>
                  </button>
                </div>
              </div>
              
              <!-- Report Item 3 -->
              <div class="report-item">
                <div class="report-icon">
                  <i class="fas fa-calendar-check"></i>
                </div>
                <h3 class="report-title">Attendance Summary</h3>
                <p class="report-description">View attendance statistics for your courses, identify trends and potential at-risk students.</p>
                <div class="report-action">
                  <button class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate</span>
                  </button>
                </div>
              </div>
              
              <!-- Report Item 4 -->
              <div class="report-item">
                <div class="report-icon">
                  <i class="fas fa-clipboard-check"></i>
                </div>
                <h3 class="report-title">Assignment Analytics</h3>
                <p class="report-description">Analyze assignment completion rates, average scores, and identify challenging topics.</p>
                <div class="report-action">
                  <button class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate</span>
                  </button>
                </div>
              </div>
              
              <!-- Report Item 5 -->
              <div class="report-item">
                <div class="report-icon">
                  <i class="fas fa-chart-line"></i>
                </div>
                <h3 class="report-title">Progress Report</h3>
                <p class="report-description">Track student progress over time, compare against previous semesters or course sections.</p>
                <div class="report-action">
                  <button class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate</span>
                  </button>
                </div>
              </div>
              
              <!-- Report Item 6 -->
              <div class="report-item">
                <div class="report-icon">
                  <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h3 class="report-title">At-Risk Students</h3>
                <p class="report-description">Identify students who may be at risk based on attendance, grades, and assignment completion.</p>
                <div class="report-action">
                  <button class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Tab Content: Generate New Report -->
          <div class="tab-content" id="generate-report">
            <div class="section-header">
              <h2 class="section-title">Generate Custom Report</h2>
              <p class="section-subtitle">Create a custom report by selecting parameters below</p>
            </div>
            
            <div class="generate-report">
              <form id="reportForm">
                <div class="form-grid">
                  <div class="form-group">
                    <label class="form-label">Report Type</label>
                    <select class="form-control" id="reportType">
                      <option value="">Select Report Type</option>
                      <option value="grade">Grade Distribution</option>
                      <option value="attendance">Attendance Summary</option>
                      <option value="performance">Student Performance</option>
                      <option value="assignment">Assignment Analytics</option>
                      <option value="progress">Progress Report</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label class="form-label">Course</label>
                    <select class="form-control" id="reportCourse">
                      <option value="all">All Courses</option>
                      <option value="CS162">CS 162 - Circuit Theory</option>
                      <option value="CS136">CS 136 - Introduction to Web Development</option>
                      <option value="CS149">CS 149 - Operating Systems</option>
                      <option value="CS157A">CS 157A - Database Management Systems</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label class="form-label">Time Period</label>
                    <select class="form-control" id="reportPeriod">
                      <option value="semester">Current Semester</option>
                      <option value="month">Last Month</option>
                      <option value="week">Last Week</option>
                      <option value="custom">Custom Date Range</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label class="form-label">Format</label>
                    <select class="form-control" id="reportFormat">
                      <option value="pdf">PDF</option>
                      <option value="excel">Excel</option>
                      <option value="csv">CSV</option>
                      <option value="html">HTML</option>
                    </select>
                  </div>
                </div>
                
                <div class="form-group" id="customDateContainer" style="display: none;">
                  <div style="display: flex; gap: 1rem;">
                    <div style="flex: 1;">
                      <label class="form-label">Start Date</label>
                      <input type="date" class="form-control" id="startDate">
                    </div>
                    <div style="flex: 1;">
                      <label class="form-label">End Date</label>
                      <input type="date" class="form-control" id="endDate">
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="form-label">Additional Options</label>
                  <div style="display: flex; gap: 2rem; margin-top: 0.5rem;">
                    <div>
                      <input type="checkbox" id="includeCharts" checked>
                      <label for="includeCharts" style="font-size: 0.95rem; color: var(--text-primary);">Include Charts</label>
                    </div>
                    <div>
                      <input type="checkbox" id="includeRawData" checked>
                      <label for="includeRawData" style="font-size: 0.95rem; color: var(--text-primary);">Include Raw Data</label>
                    </div>
                    <div>
                      <input type="checkbox" id="includeComparison">
                      <label for="includeComparison" style="font-size: 0.95rem; color: var(--text-primary);">Include Comparative Analysis</label>
                    </div>
                  </div>
                </div>
                
                <div class="form-actions">
                  <button type="submit" class="report-btn report-primary-btn">
                    <i class="fas fa-file-export"></i>
                    <span>Generate Report</span>
                  </button>
                  <button type="reset" class="report-btn report-secondary-btn">
                    <i class="fas fa-redo"></i>
                    <span>Reset</span>
                  </button>
                </div>
              </form>
            </div>
          </div>
          
          <!-- Tab Content: Recent Reports -->
          <div class="tab-content" id="recent-reports">
            <div class="section-header">
              <h2 class="section-title">Recent Reports</h2>
              <p class="section-subtitle">Access your recently generated reports</p>
            </div>
            
            <div class="report-card">
              <table class="student-table">
                <thead>
                  <tr>
                    <th>Report Name</th>
                    <th>Type</th>
                    <th>Course</th>
                    <th>Generated Date</th>
                    <th>Format</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Midterm Grade Distribution</td>
                    <td>Grade Analysis</td>
                    <td>CS 162</td>
                    <td>May 10, 2025</td>
                    <td>PDF</td>
                    <td>
                      <div style="display: flex; gap: 0.5rem;">
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn email-btn">Download</button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Attendance Summary</td>
                    <td>Attendance</td>
                    <td>All Courses</td>
                    <td>May 8, 2025</td>
                    <td>Excel</td>
                    <td>
                      <div style="display: flex; gap: 0.5rem;">
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn email-btn">Download</button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Assignment Completion</td>
                    <td>Assignment Analysis</td>
                    <td>CS 149</td>
                    <td>May 5, 2025</td>
                    <td>PDF</td>
                    <td>
                      <div style="display: flex; gap: 0.5rem;">
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn email-btn">Download</button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Student Progress Report</td>
                    <td>Performance</td>
                    <td>CS 136</td>
                    <td>May 2, 2025</td>
                    <td>PDF</td>
                    <td>
                      <div style="display: flex; gap: 0.5rem;">
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn email-btn">Download</button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>At-Risk Student Report</td>
                    <td>Student Analysis</td>
                    <td>All Courses</td>
                    <td>April 28, 2025</td>
                    <td>Excel</td>
                    <td>
                      <div style="display: flex; gap: 0.5rem;">
                        <button class="action-btn view-btn">View</button>
                        <button class="action-btn email-btn">Download</button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
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
      
      // Tabs functionality
      const tabs = document.querySelectorAll('.tab');
      const tabContents = document.querySelectorAll('.tab-content');
      
      tabs.forEach(tab => {
        tab.addEventListener('click', function() {
          // Remove active class from all tabs
          tabs.forEach(t => t.classList.remove('active'));
          
          // Add active class to clicked tab
          this.classList.add('active');
          
          // Hide all tab contents
          tabContents.forEach(content => content.classList.remove('active'));
          
          // Show the corresponding tab content
          const tabId = this.getAttribute('data-tab');
          document.getElementById(`${tabId}-reports`).classList.add('active');
        });
      });
      
      // Custom date range logic
      const reportPeriod = document.getElementById('reportPeriod');
      const customDateContainer = document.getElementById('customDateContainer');
      
      reportPeriod.addEventListener('change', function() {
        if (this.value === 'custom') {
          customDateContainer.style.display = 'block';
        } else {
          customDateContainer.style.display = 'none';
        }
      });
      
      // Report generation form
      const reportForm = document.getElementById('reportForm');
      
      reportForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const reportType = document.getElementById('reportType').value;
        const reportCourse = document.getElementById('reportCourse').value;
        
        if (!reportType) {
          alert('Please select a report type');
          return;
        }
        
        // In a real app, this would generate and download the report
        alert(`Generating ${reportType} report for ${reportCourse === 'all' ? 'all courses' : reportCourse}`);
      });
      
      // Report item buttons
      const reportBtns = document.querySelectorAll('.report-btn');
      
      reportBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const action = this.querySelector('span').textContent;
          
          if (action === 'Generate') {
            const reportTitle = this.closest('.report-item').querySelector('.report-title').textContent;
            alert(`Generating ${reportTitle} report...`);
          }
        });
      });
      
      // View/Download report buttons
      const viewReportBtns = document.querySelectorAll('.view-btn');
      const downloadReportBtns = document.querySelectorAll('.email-btn');
      
      viewReportBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const row = this.closest('tr');
          const reportName = row.cells[0].textContent;
          alert(`Viewing ${reportName}`);
        });
      });
      
      downloadReportBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const row = this.closest('tr');
          const reportName = row.cells[0].textContent;
          const format = row.cells[4].textContent;
          alert(`Downloading ${reportName} in ${format} format`);
        });
      });
    });
  </script>
</body>
</html>
