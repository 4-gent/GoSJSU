<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gosjsu.student.Course" %>
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
    :root {
      --primary: #4361ee;
      --primary-light: #4895ef;
      --primary-dark: #3a0ca3;
      --success: #4cc9f0;
      --success-light: #e6f7ee;
      --warning: #f72585;
      --warning-light: #fff4e5;
      --text-primary: #333;
      --text-secondary: #666;
      --bg-light: #f8f9fa;
      --border-light: #e9ecef;
      --border-radius: 10px;
      --shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      --transition: all 0.3s ease;
    }
    
    body {
      background-color: #f5f7fb;
      font-family: 'Inter', sans-serif;
    }
    
    .main-content {
      padding: 2rem;
      background-color: #f5f7fb;
    }
    
    .dashboard-header {
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    
    .dashboard-header h1 {
      font-size: 1.75rem;
      font-weight: 600;
      color: var(--text-primary);
      margin: 0;
    }
    
    .date {
      font-size: 0.95rem;
      color: var(--text-secondary);
      font-weight: 500;
    }
    
    .overview-cards {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 1.5rem;
      margin-bottom: 2rem;
    }
    
    .faculty-card {
      background: linear-gradient(135deg, var(--primary), var(--primary-light));
      color: white;
      border-radius: var(--border-radius);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      transition: var(--transition);
      position: relative;
      overflow: hidden;
    }
    
    .faculty-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }
    
    .faculty-card.green {
      background: linear-gradient(135deg, #4cc9f0, #4361ee);
    }
    
    .faculty-card.purple {
      background: linear-gradient(135deg, #7209b7, #f72585);
    }
    
    .faculty-card::before {
      content: '';
      position: absolute;
      top: -20px;
      right: -20px;
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.1);
    }
    
    .faculty-card h3 {
      font-size: 1.1rem;
      font-weight: 500;
      margin-top: 0;
      margin-bottom: 1rem;
      position: relative;
    }
    
    .faculty-card .stat {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
      position: relative;
    }
    
    .faculty-card .sub {
      font-size: 0.9rem;
      opacity: 0.8;
      position: relative;
    }
    
    .semester-badge {
      background-color: rgba(255, 255, 255, 0.2);
      color: white;
      padding: 4px 12px;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 500;
      margin-left: 10px;
      display: inline-block;
    }
    
    .section-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 1.5rem;
    }
    
    .section-header h2 {
      font-size: 1.25rem;
      font-weight: 600;
      margin: 0;
      color: var(--text-primary);
    }
    
    .course-list-card {
      background-color: white;
      border-radius: var(--border-radius);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .course-list {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 1rem;
    }
    
    .course-item {
      border: 1px solid var(--border-light);
      border-radius: 8px;
      padding: 1.25rem;
      transition: var(--transition);
    }
    
    .course-item:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      border-color: var(--primary-light);
    }
    
    .course-info {
      margin-bottom: 1rem;
    }
    
    .course-code {
      font-size: 0.85rem;
      color: var(--primary);
      font-weight: 600;
      margin-bottom: 0.25rem;
    }
    
    .course-name {
      font-size: 1rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .course-actions {
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
    }
    
    .action-link {
      display: inline-flex;
      align-items: center;
      padding: 0.5rem 0.75rem;
      background-color: #f8f9fa;
      color: var(--text-primary);
      border-radius: 4px;
      font-size: 0.85rem;
      text-decoration: none;
      transition: var(--transition);
    }
    
    .action-link:hover {
      background-color: var(--primary);
      color: white;
    }
    
    .action-link i {
      margin-right: 0.35rem;
    }
    
    .quick-action-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      background-color: var(--primary);
      color: white;
      padding: 0.75rem 1.25rem;
      border-radius: 6px;
      text-decoration: none;
      font-size: 0.95rem;
      font-weight: 500;
      margin-top: 1.25rem;
      transition: var(--transition);
    }
    
    .quick-action-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
    }
    
    .quick-action-btn i {
      margin-right: 0.5rem;
    }
    
    .status-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
    }
    
    .status-table th,
    .status-table td {
      padding: 1rem;
      text-align: left;
    }
    
    .status-table th {
      font-weight: 600;
      color: var(--text-secondary);
      font-size: 0.9rem;
      border-bottom: 1px solid var(--border-light);
    }
    
    .status-table td {
      border-bottom: 1px solid var(--border-light);
      font-size: 0.95rem;
    }
    
    .status-table tr:last-child td {
      border-bottom: none;
    }
    
    .status-table tr:hover td {
      background-color: #f8f9fa;
    }
    
    .status-badge {
      display: inline-block;
      padding: 0.35rem 0.75rem;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 500;
      text-align: center;
    }
    
    .status-badge.completed {
      background-color: var(--success-light);
      color: var(--success);
    }
    
    .status-badge.pending {
      background-color: var(--warning-light);
      color: var(--warning);
    }
    
    .empty-state {
      text-align: center;
      padding: 2rem;
      color: var(--text-secondary);
      border: 2px dashed var(--border-light);
      border-radius: 8px;
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
            <a href="${pageContext.request.contextPath}/faculty/dashboard">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="${pageContext.request.contextPath}/faculty/grades">
              <i class="fas fa-chart-bar"></i>
              <span>Grades</span>
            </a>
          </li>
          <li class="nav-item" data-section="roster">
            <a href="${pageContext.request.contextPath}/faculty/rosters">
              <i class="fas fa-users"></i>
              <span>Class Rosters</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/faculty/profile">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="logout">
            <a href="${pageContext.request.contextPath}/logout">
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
        <h1>Welcome, Professor ${requestScope.firstName} ${requestScope.lastName}</h1>
        <div class="date" id="currentDate"></div>
      </header>

      <!-- Overview Cards -->
      <div class="overview-cards">
        <div class="faculty-card">
          <h3>My Courses</h3>
          <div class="stat">${coursesTaught.size()}</div>
          <div class="sub"><span class="semester-badge">${currentSemester}</span></div>
        </div>

        <div class="faculty-card green">
          <h3>Total Students</h3>
          <div class="stat">${totalStudents}</div>
          <div class="sub">Across all courses</div>
        </div>

        <div class="faculty-card purple">
          <h3>Pending Grades</h3>
          <div class="stat">${pendingGrades}</div>
          <div class="sub">Need your attention</div>
        </div>
      </div>

      <!-- Course List with Grade Status -->
      <div class="content-grid">
            <div class="course-list-card">
              <div class="section-header">
            <h2>My Courses</h2>
            <span class="semester-badge" style="background-color: var(--primary); color: white;">${currentSemester}</span>
              </div>
              
          <% if (request.getAttribute("coursesTaught") != null && !((List<Course>)request.getAttribute("coursesTaught")).isEmpty()) { %>
              <div class="course-list">
              <% List<Course> courses = (List<Course>) request.getAttribute("coursesTaught"); %>
              <% for (Course course : courses) { %>
                <div class="course-item">
                      <div class="course-info">
                    <div class="course-code">Course #<%= course.getCourseId() %></div>
                    <div class="course-name"><%= course.getCourseName() %></div>
                      </div>
                      <div class="course-actions">
                    <a href="${pageContext.request.contextPath}/faculty/rosters?courseId=<%= course.getCourseId() %>" class="action-link">
                      <i class="fas fa-users"></i> View Roster
                    </a>
                    <a href="${pageContext.request.contextPath}/faculty/grades?courseId=<%= course.getCourseId() %>" class="action-link">
                      <i class="fas fa-chart-bar"></i> Manage Grades
                    </a>
                  </div>
                </div>
              <% } %>
            </div>
            <div style="text-align: center; margin-top: 1.5rem;">
              <a href="${pageContext.request.contextPath}/faculty/grades" class="quick-action-btn">
                <i class="fas fa-tasks"></i> Manage All Grades
              </a>
            </div>
          <% } else { %>
            <div class="empty-state">
              <p>You are not currently assigned to any courses for ${currentSemester}.</p>
            </div>
          <% } %>
        </div>
        
        <!-- Recent Grade Submissions Summary -->
        <div class="course-list-card">
          <div class="section-header">
            <h2>Grade Submission Status</h2>
                      </div>
          
          <% if (request.getAttribute("coursesTaught") != null && !((List<Course>)request.getAttribute("coursesTaught")).isEmpty()) { %>
            <div class="status-summary">
              <table class="status-table">
                <thead>
                  <tr>
                    <th>Course</th>
                    <th style="text-align: center;">Status</th>
                    <th style="text-align: right;">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <% List<Course> courses = (List<Course>) request.getAttribute("coursesTaught"); %>
                  <% for (Course course : courses) { 
                      // For demo purposes, alternate between completed and pending
                      boolean isCompleted = course.getCourseId() % 2 == 0;
                  %>
                    <tr>
                      <td><%= course.getCourseName() %></td>
                      <td style="text-align: center;">
                        <% if (isCompleted) { %>
                          <span class="status-badge completed">Completed</span>
                        <% } else { %>
                          <span class="status-badge pending">Pending</span>
                        <% } %>
                      </td>
                      <td style="text-align: right;">
                        <a href="${pageContext.request.contextPath}/faculty/grades?courseId=<%= course.getCourseId() %>" class="action-link">
                          <% if (isCompleted) { %>
                            <i class="fas fa-eye"></i> View
                          <% } else { %>
                            <i class="fas fa-edit"></i> Submit
                          <% } %>
                        </a>
                      </td>
                    </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          <% } else { %>
            <div class="empty-state">
              <p>No grade submission data available.</p>
            </div>
          <% } %>
        </div>
      </div>
      
      <!-- New Academic Calendar Section -->
      <div class="course-list-card">
        <div class="section-header">
          <h2><i class="fas fa-calendar-alt"></i> Academic Calendar</h2>
          <button onclick="toggleCalendarView()" class="calendar-toggle-btn">
            <span id="viewText">View All</span> <i class="fas fa-chevron-down" id="viewIcon"></i>
          </button>
        </div>
        
        <div id="calendarPreview">
          <!-- Only show 5 upcoming events initially -->
          <div class="calendar-container">
            <!-- January -->
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 1</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">New Year's Day</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 20</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Dr. Martin Luther King, Jr. Day</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 21</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Spring Semester Begins</div>
                <div class="event-description"><i class="fas fa-flag"></i> Official Start Date</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 21-22</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Pre-Instruction Activities</div>
                <div class="event-description"><i class="fas fa-chalkboard-teacher"></i> Faculty Orientation & Meetings</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 23</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">First Day of Instruction</div>
                <div class="event-description"><i class="fas fa-book-open"></i> Classes Begin</div>
              </div>
            </div>
          </div>
        </div>
        
        <div id="calendarFull" style="display: none;">
          <!-- All calendar events -->
          <div class="calendar-container">
            <!-- January -->
            <div class="month-divider">
              <span><i class="fas fa-calendar-week"></i> January 2025</span>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 1</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">New Year's Day</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 20</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Dr. Martin Luther King, Jr. Day</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 21</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Spring Semester Begins</div>
                <div class="event-description"><i class="fas fa-flag"></i> Official Start Date</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 21-22</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Pre-Instruction Activities</div>
                <div class="event-description"><i class="fas fa-chalkboard-teacher"></i> Faculty Orientation & Meetings</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jan 23</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">First Day of Instruction</div>
                <div class="event-description"><i class="fas fa-book-open"></i> Classes Begin</div>
              </div>
            </div>
            
            <!-- February -->
            <div class="month-divider">
              <span><i class="fas fa-calendar-week"></i> February 2025</span>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Feb 18</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Last Day to Drop Courses</div>
                <div class="event-description"><i class="fas fa-exclamation-circle"></i> Without Record Entry</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Feb 18</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Last Day to Add Courses & Register Late</div>
                <div class="event-description"><i class="fas fa-exclamation-circle"></i> Registration Deadline</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Feb 19</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Enrollment Census Date</div>
                <div class="event-description"><i class="fas fa-clipboard-list"></i> Official Count</div>
              </div>
            </div>
            
            <!-- March/April -->
            <div class="month-divider">
              <span><i class="fas fa-calendar-week"></i> March/April 2025</span>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Mar 31</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Cesar Chavez Day</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Mar 31 - Apr 4</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Spring Recess</div>
                <div class="event-description"><i class="fas fa-umbrella-beach"></i> No Classes</div>
              </div>
            </div>
            
            <!-- May -->
            <div class="month-divider">
              <span><i class="fas fa-calendar-week"></i> May 2025</span>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 12</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Last Day of Instruction</div>
                <div class="event-description"><i class="fas fa-book-open"></i> Last Day of Classes</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 13</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Study/Conference Day</div>
                <div class="event-description"><i class="fas fa-pen"></i> No Classes or Exams</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 14-16</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Final Examinations</div>
                <div class="event-description"><i class="fas fa-tasks"></i> Exam Period</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 19-20</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Final Examinations</div>
                <div class="event-description"><i class="fas fa-tasks"></i> Exam Period</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 21</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Final Examinations Make-Up Day</div>
                <div class="event-description"><i class="fas fa-redo"></i> For Approved Absences</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 22</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Grade Evaluation Day</div>
                <div class="event-description"><i class="fas fa-chart-bar"></i> For Faculty</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 23</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Grades Due From Faculty</div>
                <div class="event-description"><i class="fas fa-exclamation-circle"></i> Deadline: 11:59 PM</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 23</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">End of Academic Year</div>
                <div class="event-description"><i class="fas fa-flag-checkered"></i> End of Spring Semester</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 21-23</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Commencement</div>
                <div class="event-description"><i class="fas fa-graduation-cap"></i> Graduation Ceremonies</div>
              </div>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">May 26</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Memorial Day</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
            </div>
            
            <div class="month-divider">
              <span><i class="fas fa-calendar-week"></i> June 2025</span>
            </div>
            
            <div class="event-item">
              <div class="event-date">
                <div class="date-chip">Jun 19</div>
                <div class="event-year">2025</div>
              </div>
              <div class="event-details">
                <div class="event-name">Juneteenth</div>
                <div class="event-description"><i class="fas fa-building"></i> Campus Closed</div>
              </div>
              </div>
          </div>
        </div>
      </div>
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
    
    // Toggle between calendar preview and full view
    function toggleCalendarView() {
      const preview = document.getElementById('calendarPreview');
      const full = document.getElementById('calendarFull');
      const viewText = document.getElementById('viewText');
      const viewIcon = document.getElementById('viewIcon');
      
      if (preview.style.display === 'none') {
        preview.style.display = 'block';
        full.style.display = 'none';
        viewText.innerText = 'View All';
        viewIcon.className = 'fas fa-chevron-down';
      } else {
        preview.style.display = 'none';
        full.style.display = 'block';
        viewText.innerText = 'View Less';
        viewIcon.className = 'fas fa-chevron-up';
      }
    }
    
    document.addEventListener('DOMContentLoaded', setCurrentDate);
  </script>

  <style>
    /* New Academic Calendar Styles */
    .calendar-container {
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
    }
    
    .event-item {
      display: flex;
      padding: 0.875rem;
      border-radius: 8px;
      background-color: #f8f9fa;
      transition: all 0.2s ease;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.03);
      margin-bottom: 8px;
    }
    
    .event-item:hover {
      background-color: #f0f4fd;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
    }
    
    .event-date {
      min-width: 90px;
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-right: 16px;
    }
    
    .date-chip {
      background: linear-gradient(135deg, #4361ee, #4895ef);
      color: white;
      font-weight: 600;
      padding: 5px 10px;
      border-radius: 6px;
      font-size: 0.85rem;
      text-align: center;
      box-shadow: 0 2px 4px rgba(67, 97, 238, 0.2);
      margin-bottom: 4px;
      width: 80px;
    }
    
    .event-year {
      font-size: 0.75rem;
      color: #666;
      text-align: center;
    }
    
    .event-details {
      flex: 1;
    }
    
    .event-name {
      font-weight: 600;
      margin-bottom: 4px;
      color: #333;
      font-size: 0.95rem;
    }
    
    .event-description {
      font-size: 0.85rem;
      color: #666;
      display: flex;
      align-items: center;
      gap: 5px;
    }
    
    .event-description i {
      color: #4361ee;
      font-size: 0.8rem;
    }
    
    .calendar-toggle-btn {
      background-color: #f0f4fd;
      color: #4361ee;
      border: none;
      padding: 6px 12px;
      border-radius: 6px;
      font-size: 0.85rem;
      font-weight: 500;
      display: flex;
      align-items: center;
      gap: 5px;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .calendar-toggle-btn:hover {
      background-color: #e0e8ff;
    }
    
    .month-divider {
      margin: 10px 0;
      padding: 6px 0;
      font-weight: 600;
      color: #555;
      font-size: 0.9rem;
      border-bottom: 1px solid #eee;
    }
    
    .month-divider span {
      display: flex;
      align-items: center;
      gap: 5px;
    }
    
    .month-divider i {
      color: #4361ee;
    }
    
    .section-header h2 {
      display: flex;
      align-items: center;
      gap: 8px;
    }
    
    .section-header h2 i {
      color: #4361ee;
    }
    
    @media (max-width: 768px) {
      .event-item {
        flex-direction: column;
      }
      
      .event-date {
        margin-right: 0;
        margin-bottom: 10px;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        gap: 10px;
      }
      
      .date-chip {
        margin-bottom: 0;
      }
    }
  </style>
</body>
</html>