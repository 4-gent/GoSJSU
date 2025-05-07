<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Courses | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .course-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .course-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
      position: relative;
      overflow: hidden;
      transition: all 0.3s ease;
    }
    
    .course-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-lg);
    }
    
    .course-card-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 1.5rem;
    }
    
    .course-card-title {
      margin: 0;
      padding: 0;
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .course-card-subtitle {
      color: var(--text-secondary);
      font-size: 0.95rem;
      margin-top: 0.25rem;
    }
    
    .course-card-status {
      display: inline-block;
      padding: 0.35rem 0.75rem;
      border-radius: var(--radius);
      font-size: 0.75rem;
      font-weight: 600;
      text-transform: uppercase;
    }
    
    .course-card-status.active {
      background-color: var(--green-bg);
      color: var(--green-text);
    }
    
    .course-card-status.upcoming {
      background-color: var(--blue-bg);
      color: var(--blue-text);
    }
    
    .course-card-status.completed {
      background-color: var(--gray-bg);
      color: var(--gray-text);
    }
    
    .course-card-content {
      display: flex;
      gap: 2rem;
    }
    
    .course-card-info {
      flex: 2;
    }
    
    .course-card-stats {
      flex: 1;
    }
    
    .course-info-row {
      display: flex;
      margin-bottom: 0.75rem;
      align-items: center;
    }
    
    .course-info-label {
      width: 140px;
      font-size: 0.875rem;
      color: var(--text-secondary);
    }
    
    .course-info-value {
      font-size: 0.95rem;
      color: var(--text-primary);
    }
    
    .course-tag {
      display: inline-block;
      padding: 0.25rem 0.5rem;
      background-color: var(--surface-secondary);
      border-radius: var(--radius-sm);
      font-size: 0.75rem;
      margin-right: 0.5rem;
      margin-bottom: 0.5rem;
      color: var(--text-secondary);
    }
    
    .course-stats-header {
      font-size: 1rem;
      font-weight: 600;
      margin-bottom: 1rem;
      padding-bottom: 0.75rem;
      border-bottom: 1px solid var(--border);
    }
    
    .course-stat-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 0.75rem;
    }
    
    .course-stat-label {
      font-size: 0.875rem;
      color: var(--text-secondary);
    }
    
    .course-stat-value {
      font-size: 0.95rem;
      font-weight: 500;
      color: var(--text-primary);
    }
    
    .course-actions {
      display: flex;
      gap: 0.75rem;
      margin-top: 1.5rem;
    }
    
    .course-action-btn {
      padding: 0.625rem 1.25rem;
      border-radius: var(--radius);
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .course-primary-btn {
      background-color: var(--primary);
      color: white;
      border: none;
    }
    
    .course-primary-btn:hover {
      background-color: var(--primary-dark);
      box-shadow: 0 4px 12px rgba(75, 85, 99, 0.15);
    }
    
    .course-secondary-btn {
      background-color: white;
      color: var(--text-primary);
      border: 1px solid var(--border);
    }
    
    .course-secondary-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .course-card-accent {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 4px;
    }
    
    .course-card-accent.active {
      background-color: var(--green-text);
    }
    
    .course-card-accent.upcoming {
      background-color: var(--blue-text);
    }
    
    .course-card-accent.completed {
      background-color: var(--gray-text);
    }
    
    .course-filters {
      display: flex;
      gap: 1rem;
      margin-bottom: 2rem;
      flex-wrap: wrap;
    }
    
    .course-filter {
      padding: 0.625rem 1.25rem;
      background-color: var(--surface);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 0.95rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .course-filter:hover:not(.active) {
      background-color: var(--surface-hover);
    }
    
    .course-filter.active {
      background-color: var(--primary);
      color: white;
      border-color: var(--primary);
    }
    
    .semester-selector {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 2rem;
    }
    
    .semester-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
    }
    
    .semester-title {
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .semester-dropdown {
      position: relative;
    }
    
    .semester-dropdown-btn {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.625rem 1.25rem;
      background-color: white;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 0.95rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .semester-dropdown-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .semester-dropdown-content {
      position: absolute;
      top: 100%;
      right: 0;
      width: 220px;
      background-color: white;
      border-radius: var(--radius);
      box-shadow: var(--shadow-md);
      z-index: 1000;
      display: none;
    }
    
    .semester-dropdown.open .semester-dropdown-content {
      display: block;
    }
    
    .semester-dropdown-item {
      padding: 0.75rem 1rem;
      font-size: 0.95rem;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .semester-dropdown-item:hover {
      background-color: var(--surface-hover);
    }
    
    .semester-dropdown-item.current {
      font-weight: 600;
      color: var(--primary);
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
    
    .empty-state {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 3rem 2rem;
      text-align: center;
      margin-bottom: 1.5rem;
    }
    
    .empty-state-icon {
      font-size: 3rem;
      color: var(--primary-light);
      margin-bottom: 1.5rem;
      opacity: 0.7;
    }
    
    .empty-state-title {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
    }
    
    .empty-state-message {
      color: var(--text-secondary);
      margin-bottom: 1.5rem;
      max-width: 500px;
      margin-left: auto;
      margin-right: auto;
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
          <li class="nav-item active" data-section="courses">
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
        <h1>My Courses - Professor Chris Pollett</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="course-container">
        <!-- Semester Selector -->
        <div class="semester-selector">
          <div class="semester-header">
            <h2 class="semester-title">Courses</h2>
            <div class="semester-dropdown" id="semesterDropdown">
              <button class="semester-dropdown-btn">
                <span>Spring 2025</span>
                <i class="fas fa-chevron-down"></i>
              </button>
              <div class="semester-dropdown-content">
                <div class="semester-dropdown-item current">Spring 2025</div>
                <div class="semester-dropdown-item">Fall 2024</div>
                <div class="semester-dropdown-item">Spring 2024</div>
                <div class="semester-dropdown-item">Fall 2023</div>
              </div>
            </div>
          </div>
          
          <div class="course-filters">
            <div class="course-filter active" data-filter="all">All Courses (4)</div>
            <div class="course-filter" data-filter="active">Active (3)</div>
            <div class="course-filter" data-filter="upcoming">Upcoming (1)</div>
            <div class="course-filter" data-filter="completed">Past</div>
          </div>
        </div>
        
        <!-- Course List -->
        <div class="section-header">
          <h2 class="section-title">Teaching Schedule</h2>
          <p class="section-subtitle">View and manage your courses for the current semester</p>
        </div>
        
        <!-- Course Cards -->
        <div class="course-list">
          <!-- Course 1 -->
          <div class="course-card" data-course-type="active">
            <div class="course-card-accent active"></div>
            <div class="course-card-header">
              <div>
                <h3 class="course-card-title">CS 162 - Circuit Theory</h3>
                <p class="course-card-subtitle">School of Engineering</p>
              </div>
              <span class="course-card-status active">Active</span>
            </div>
            
            <div class="course-card-content">
              <div class="course-card-info">
                <div class="course-info-row">
                  <div class="course-info-label">Schedule</div>
                  <div class="course-info-value">Mon, Wed • 8:00 AM - 9:15 AM</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Location</div>
                  <div class="course-info-value">Engineering Building, Room SF 13</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Enrollment</div>
                  <div class="course-info-value">25 students (Max: 30)</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Course ID</div>
                  <div class="course-info-value">CS-162-01</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Tags</div>
                  <div class="course-info-value">
                    <span class="course-tag">Undergraduate</span>
                    <span class="course-tag">Required</span>
                    <span class="course-tag">In-Person</span>
                  </div>
                </div>
              </div>
              
              <div class="course-card-stats">
                <h4 class="course-stats-header">Quick Stats</h4>
                <div class="course-stat-item">
                  <div class="course-stat-label">Attendance</div>
                  <div class="course-stat-value">92%</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Average Grade</div>
                  <div class="course-stat-value">B (85.7%)</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Assignments</div>
                  <div class="course-stat-value">6 / 10 Complete</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Next Class</div>
                  <div class="course-stat-value">Tomorrow</div>
                </div>
              </div>
            </div>
            
            <div class="course-actions">
              <button class="course-action-btn course-primary-btn">
                <i class="fas fa-chalkboard-teacher"></i>
                <span>Manage Course</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-users"></i>
                <span>View Students</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-chart-bar"></i>
                <span>Grades</span>
              </button>
            </div>
          </div>
          
          <!-- Course 2 -->
          <div class="course-card" data-course-type="active">
            <div class="course-card-accent active"></div>
            <div class="course-card-header">
              <div>
                <h3 class="course-card-title">CS 136 - Introduction to Web Development</h3>
                <p class="course-card-subtitle">School of Engineering</p>
              </div>
              <span class="course-card-status active">Active</span>
            </div>
            
            <div class="course-card-content">
              <div class="course-card-info">
                <div class="course-info-row">
                  <div class="course-info-label">Schedule</div>
                  <div class="course-info-value">Tue, Thu • 1:00 PM - 2:15 PM</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Location</div>
                  <div class="course-info-value">Engineering Building, Room SF 12</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Enrollment</div>
                  <div class="course-info-value">32 students (Max: 35)</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Course ID</div>
                  <div class="course-info-value">CS-136-02</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Tags</div>
                  <div class="course-info-value">
                    <span class="course-tag">Undergraduate</span>
                    <span class="course-tag">Elective</span>
                    <span class="course-tag">In-Person</span>
                  </div>
                </div>
              </div>
              
              <div class="course-card-stats">
                <h4 class="course-stats-header">Quick Stats</h4>
                <div class="course-stat-item">
                  <div class="course-stat-label">Attendance</div>
                  <div class="course-stat-value">89%</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Average Grade</div>
                  <div class="course-stat-value">B+ (87.3%)</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Assignments</div>
                  <div class="course-stat-value">5 / 8 Complete</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Next Class</div>
                  <div class="course-stat-value">Today</div>
                </div>
              </div>
            </div>
            
            <div class="course-actions">
              <button class="course-action-btn course-primary-btn">
                <i class="fas fa-chalkboard-teacher"></i>
                <span>Manage Course</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-users"></i>
                <span>View Students</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-chart-bar"></i>
                <span>Grades</span>
              </button>
            </div>
          </div>
          
          <!-- Course 3 -->
          <div class="course-card" data-course-type="active">
            <div class="course-card-accent active"></div>
            <div class="course-card-header">
              <div>
                <h3 class="course-card-title">CS 149 - Operating Systems</h3>
                <p class="course-card-subtitle">School of Engineering</p>
              </div>
              <span class="course-card-status active">Active</span>
            </div>
            
            <div class="course-card-content">
              <div class="course-card-info">
                <div class="course-info-row">
                  <div class="course-info-label">Schedule</div>
                  <div class="course-info-value">Wed, Fri • 3:00 PM - 4:15 PM</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Location</div>
                  <div class="course-info-value">MacQuarrie Hall, Room MH 233</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Enrollment</div>
                  <div class="course-info-value">18 students (Max: 25)</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Course ID</div>
                  <div class="course-info-value">CS-149-01</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Tags</div>
                  <div class="course-info-value">
                    <span class="course-tag">Graduate</span>
                    <span class="course-tag">Required</span>
                    <span class="course-tag">In-Person</span>
                  </div>
                </div>
              </div>
              
              <div class="course-card-stats">
                <h4 class="course-stats-header">Quick Stats</h4>
                <div class="course-stat-item">
                  <div class="course-stat-label">Attendance</div>
                  <div class="course-stat-value">95%</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Average Grade</div>
                  <div class="course-stat-value">A- (91.2%)</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Assignments</div>
                  <div class="course-stat-value">4 / 7 Complete</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Next Class</div>
                  <div class="course-stat-value">Tomorrow</div>
                </div>
              </div>
            </div>
            
            <div class="course-actions">
              <button class="course-action-btn course-primary-btn">
                <i class="fas fa-chalkboard-teacher"></i>
                <span>Manage Course</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-users"></i>
                <span>View Students</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-chart-bar"></i>
                <span>Grades</span>
              </button>
            </div>
          </div>
          
          <!-- Course 4 -->
          <div class="course-card" data-course-type="upcoming">
            <div class="course-card-accent upcoming"></div>
            <div class="course-card-header">
              <div>
                <h3 class="course-card-title">CS 157A - Database Management Systems</h3>
                <p class="course-card-subtitle">School of Engineering</p>
              </div>
              <span class="course-card-status upcoming">Upcoming</span>
            </div>
            
            <div class="course-card-content">
              <div class="course-card-info">
                <div class="course-info-row">
                  <div class="course-info-label">Schedule</div>
                  <div class="course-info-value">Mon, Wed • 10:30 AM - 11:45 AM</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Location</div>
                  <div class="course-info-value">Engineering Building, Room SF 22</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Enrollment</div>
                  <div class="course-info-value">12 students (Max: 30)</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Course ID</div>
                  <div class="course-info-value">CS-157A-01</div>
                </div>
                <div class="course-info-row">
                  <div class="course-info-label">Tags</div>
                  <div class="course-info-value">
                    <span class="course-tag">Graduate</span>
                    <span class="course-tag">Elective</span>
                    <span class="course-tag">In-Person</span>
                  </div>
                </div>
              </div>
              
              <div class="course-card-stats">
                <h4 class="course-stats-header">Quick Stats</h4>
                <div class="course-stat-item">
                  <div class="course-stat-label">Start Date</div>
                  <div class="course-stat-value">May 20, 2025</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">End Date</div>
                  <div class="course-stat-value">July 29, 2025</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Registration</div>
                  <div class="course-stat-value">Open until May 15</div>
                </div>
                <div class="course-stat-item">
                  <div class="course-stat-label">Syllabus</div>
                  <div class="course-stat-value">Not Submitted</div>
                </div>
              </div>
            </div>
            
            <div class="course-actions">
              <button class="course-action-btn course-primary-btn">
                <i class="fas fa-edit"></i>
                <span>Edit Course</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-file-alt"></i>
                <span>Submit Syllabus</span>
              </button>
              <button class="course-action-btn course-secondary-btn">
                <i class="fas fa-calendar-alt"></i>
                <span>Schedule</span>
              </button>
            </div>
          </div>
          
          <!-- Empty State (Hidden by default) -->
          <div class="empty-state" style="display: none;">
            <div class="empty-state-icon">
              <i class="fas fa-book"></i>
            </div>
            <h3 class="empty-state-title">No courses found</h3>
            <p class="empty-state-message">There are no courses matching your current filter criteria. Try adjusting your filters or select a different semester.</p>
            <button class="course-action-btn course-primary-btn">
              <i class="fas fa-sync"></i>
              <span>Reset Filters</span>
            </button>
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
      
      // Semester dropdown
      const semesterDropdown = document.getElementById('semesterDropdown');
      const semesterBtn = semesterDropdown.querySelector('.semester-dropdown-btn');
      const semesterItems = semesterDropdown.querySelectorAll('.semester-dropdown-item');
      
      semesterBtn.addEventListener('click', function() {
        semesterDropdown.classList.toggle('open');
      });
      
      // Close dropdown when clicking outside
      document.addEventListener('click', function(e) {
        if (!semesterDropdown.contains(e.target)) {
          semesterDropdown.classList.remove('open');
        }
      });
      
      // Handle semester selection
      semesterItems.forEach(item => {
        item.addEventListener('click', function() {
          const semester = this.textContent;
          semesterBtn.querySelector('span').textContent = semester;
          semesterDropdown.classList.remove('open');
          
          // Update current class on items
          semesterItems.forEach(i => i.classList.remove('current'));
          this.classList.add('current');
          
          // In a real app, you would load courses for the selected semester here
          if (semester === 'Fall 2023' || semester === 'Spring 2024') {
            document.querySelector('.empty-state').style.display = 'block';
            document.querySelectorAll('.course-card').forEach(card => {
              card.style.display = 'none';
            });
          } else {
            document.querySelector('.empty-state').style.display = 'none';
            document.querySelectorAll('.course-card').forEach(card => {
              card.style.display = 'block';
            });
          }
        });
      });
      
      // Course filters
      const courseFilters = document.querySelectorAll('.course-filter');
      const courseCards = document.querySelectorAll('.course-card');
      
      courseFilters.forEach(filter => {
        filter.addEventListener('click', function() {
          // Update active filter
          courseFilters.forEach(f => f.classList.remove('active'));
          this.classList.add('active');
          
          const filterType = this.getAttribute('data-filter');
          
          // Filter courses
          if (filterType === 'all') {
            courseCards.forEach(card => {
              card.style.display = 'block';
            });
          } else {
            courseCards.forEach(card => {
              if (card.getAttribute('data-course-type') === filterType) {
                card.style.display = 'block';
              } else {
                card.style.display = 'none';
              }
            });
          }
          
          // Show empty state if no courses are visible
          const visibleCourses = document.querySelectorAll('.course-card[style="display: block;"]');
          if (visibleCourses.length === 0) {
            document.querySelector('.empty-state').style.display = 'block';
          } else {
            document.querySelector('.empty-state').style.display = 'none';
          }
        });
      });
      
      // Course action buttons
      const actionButtons = document.querySelectorAll('.course-action-btn');
      
      actionButtons.forEach(btn => {
        btn.addEventListener('click', function() {
          const action = this.textContent.trim();
          const courseTitle = this.closest('.course-card').querySelector('.course-card-title').textContent;
          
          if (action.includes('Grades')) {
            window.location.href = "${pageContext.request.contextPath}/faculty/grades?facultyId=987654321";
          } else if (action.includes('View Students')) {
            window.location.href = "${pageContext.request.contextPath}/faculty/rosters?facultyId=987654321";
          } else {
            alert(`Action: ${action} for course: ${courseTitle}`);
          }
        });
      });
    });
  </script>
</body>
</html> 