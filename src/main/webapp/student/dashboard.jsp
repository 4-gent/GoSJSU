<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard | goSJSU</title>
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
          <li class="nav-item active" data-section="dashboard">
            <a href="#">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="#" id="profileLink">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="registration">
            <a href="#">
              <i class="fas fa-calendar-alt"></i>
              <span>Registration</span>
            </a>
          </li>
          <li class="nav-item" data-section="timetable">
            <a href="#">
              <i class="fas fa-clock"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="#">
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
      <!-- Dashboard Section -->
      <section id="dashboard-section" class="content-section active">
        <!-- Header -->
        <header class="dashboard-header">
          <h1>Dashboard</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <!-- Overview Cards -->
        <section class="overview-cards">
          <div class="card blue">
            <h3>Total Courses</h3>
            <div class="stat">07</div>
            <div class="sub">2 Electives</div>
          </div>
          <div class="card green">
            <h3>Current GPA</h3>
            <div class="stat">3.75</div>
            <div class="sub">Cumulative: 3.82</div>
          </div>
          <div class="card purple">
            <h3>Registration Status</h3>
            <div class="stat-badge">Open</div>
            <div class="sub">Registration window: May 13-20</div>
          </div>
        </section>

        <!-- Content Grid -->
        <div class="content-grid">
          <!-- Left Column -->
          <div class="left-column">
            <!-- Today's Classes -->
            <section class="classes-section">
              <div class="section-header">
                <h2>Today's Classes</h2>
                <a href="#" class="view-all">View Schedule <i class="fas fa-arrow-right"></i></a>
              </div>
              
              <div class="classes-container">
                <h4 class="section-label">Past</h4>
                
                <div class="class-card purple">
                  <div class="class-info">
                    <div class="course-code">CS 162</div>
                    <div class="course-name">Circuit Theory</div>
                    <div class="location">SF 13</div>
                  </div>
                  <div class="class-time-status">
                    <div class="time">8:00 AM</div>
                  </div>
                </div>
                
                <div class="class-card green">
                  <div class="class-info">
                    <div class="course-code">MATH 124</div>
                    <div class="course-name">Discrete Math</div>
                    <div class="location">FF 10</div>
                  </div>
                  <div class="class-time-status">
                    <div class="time">10:30 AM</div>
                  </div>
                </div>
                
                <h4 class="section-label">Upcoming</h4>
                
                <div class="class-card gray">
                  <div class="class-info">
                    <div class="course-code">CS 136</div>
                    <div class="course-name">Introduction to Web Development</div>
                    <div class="location">SF 12</div>
                  </div>
                  <div class="class-time-status">
                    <div class="time">01:00 PM</div>
                  </div>
                </div>
                
                <div class="class-card gray">
                  <div class="class-info">
                    <div class="course-code">CS 124</div>
                    <div class="course-name">Computer Architecture</div>
                    <div class="location">SF 20</div>
                  </div>
                  <div class="class-time-status">
                    <div class="time">03:00 PM</div>
                  </div>
                </div>
              </div>
            </section>

            <!-- Grade Summary Section -->
            <section class="grades-section">
              <div class="section-header">
                <h2>Recent Grades</h2>
                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
              </div>
              
              <div class="grades-table">
                <table>
                  <thead>
                    <tr>
                      <th>Course</th>
                      <th>Assignment</th>
                      <th>Grade</th>
                      <th>Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>CS 136</td>
                      <td>Midterm Exam</td>
                      <td><span class="grade-a">A</span></td>
                      <td>May 2, 2025</td>
                    </tr>
                    <tr>
                      <td>MATH 124</td>
                      <td>Problem Set 5</td>
                      <td><span class="grade-b">B+</span></td>
                      <td>Apr 28, 2025</td>
                    </tr>
                    <tr>
                      <td>CS 162</td>
                      <td>Lab Assignment 3</td>
                      <td><span class="grade-a">A-</span></td>
                      <td>Apr 25, 2025</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </section>
          </div>

          <!-- Right Column -->
          <div class="right-column">
            <!-- Academic Calendar -->
            <section class="calendar-section">
              <div class="section-header">
                <h2>Academic Calendar</h2>
                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
              </div>
              <ul class="calendar-events">
                <li class="calendar-event">
                  <div class="event-date">
                    <span class="month">May</span>
                    <span class="day">13</span>
                  </div>
                  <div class="event-details">
                    <div class="event-title">Course Registration Deadline</div>
                    <div class="event-time">09:00 AM</div>
                  </div>
                </li>
                <li class="calendar-event">
                  <div class="event-date">
                    <span class="month">May</span>
                    <span class="day">20</span>
                  </div>
                  <div class="event-details">
                    <div class="event-title">Last Day to Drop Courses</div>
                    <div class="event-time">11:59 PM</div>
                  </div>
                </li>
                <li class="calendar-event">
                  <div class="event-date">
                    <span class="month">Jun</span>
                    <span class="day">05</span>
                  </div>
                  <div class="event-details">
                    <div class="event-title">Final Exams Begin</div>
                    <div class="event-time">08:00 AM</div>
                  </div>
                </li>
              </ul>
            </section>

            <!-- Advisor Information -->
            <section class="advisor-section">
              <h2>Faculty Advisor</h2>
              <div class="advisor-card">
                <div class="advisor-avatar">
                  <i class="fas fa-user-tie"></i>
                </div>
                <div class="advisor-info">
                  <h3>Dr. Sarah Johnson</h3>
                  <p class="advisor-title">Associate Professor, Computer Science</p>
                  <p class="advisor-contact"><i class="fas fa-envelope"></i> sarah.johnson@sjsu.edu</p>
                  <p class="advisor-contact"><i class="fas fa-phone"></i> (408) 555-1234</p>
                </div>
              </div>
            </section>

            <!-- Tasks -->
            <section class="tasks-section">
              <div class="section-header">
                <h2>Tasks</h2>
                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
              </div>
              
              <div class="task-card danger">
                <div class="task-icon">
                  <i class="fas fa-exclamation-circle"></i>
                </div>
                <div class="task-details">
                  <div class="task-text">Course Registration Pending</div>
                  <div class="task-time">May 13, 09:00 AM</div>
                </div>
                <div class="task-arrow">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
              
              <div class="task-card warning">
                <div class="task-icon">
                  <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div class="task-details">
                  <div class="task-text">Biometric Registration Pending</div>
                  <div class="task-time">May 13, 09:00 AM</div>
                </div>
                <div class="task-arrow">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
              
              <div class="task-card info">
                <div class="task-icon">
                  <i class="fas fa-book"></i>
                </div>
                <div class="task-details">
                  <div class="task-text">Submit CS 136 Assignment</div>
                  <div class="task-time">May 16, 11:59 PM</div>
                </div>
                <div class="task-arrow">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
            </section>
          </div>
        </div>
      </section>

      <!-- Registration Section -->
      <section id="registration-section" class="content-section">
        <header class="dashboard-header">
          <h1>Course Registration</h1>
          <div class="date" id="registrationDate"></div>
        </header>

        <div class="registration-page">
          <div class="registration-status-card">
            <div class="status-header">
              <h2>Registration Status</h2>
              <span class="status-badge open">Open</span>
            </div>
            <div class="status-details">
              <div class="status-item">
                <span class="label">Registration Period:</span>
                <span class="value">May 13 - May 20, 2025</span>
              </div>
              <div class="status-item">
                <span class="label">Enrollment Appointment:</span>
                <span class="value">May 13, 2025 at 9:00 AM</span>
              </div>
              <div class="status-item">
                <span class="label">Maximum Units:</span>
                <span class="value">18</span>
              </div>
              <div class="status-item">
                <span class="label">Current Units:</span>
                <span class="value">12</span>
              </div>
            </div>
          </div>

          <div class="registration-actions-card">
            <h2>Registration Actions</h2>
            <div class="action-buttons">
              <a href="#" class="reg-action-button">
                <i class="fas fa-search"></i>
                <span>Search for Classes</span>
              </a>
              <a href="#" class="reg-action-button">
                <i class="fas fa-shopping-cart"></i>
                <span>Shopping Cart (3)</span>
              </a>
              <a href="#" class="reg-action-button">
                <i class="fas fa-calendar-check"></i>
                <span>Enrolled Classes</span>
              </a>
              <a href="#" class="reg-action-button">
                <i class="fas fa-history"></i>
                <span>Registration History</span>
              </a>
            </div>
          </div>

          <div class="shopping-cart-preview">
            <h2>Shopping Cart</h2>
            <table class="cart-table">
              <thead>
                <tr>
                  <th>Course</th>
                  <th>Title</th>
                  <th>Units</th>
                  <th>Days</th>
                  <th>Time</th>
                  <th>Instructor</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>CS 149</td>
                  <td>Operating Systems</td>
                  <td>3</td>
                  <td>MW</td>
                  <td>10:30 AM - 11:45 AM</td>
                  <td>Dr. Williams</td>
                  <td>
                    <button class="cart-action-btn enroll">Enroll</button>
                    <button class="cart-action-btn remove">Remove</button>
                  </td>
                </tr>
                <tr>
                  <td>CS 157A</td>
                  <td>Database Management Systems</td>
                  <td>3</td>
                  <td>TR</td>
                  <td>1:30 PM - 2:45 PM</td>
                  <td>Dr. Chen</td>
                  <td>
                    <button class="cart-action-btn enroll">Enroll</button>
                    <button class="cart-action-btn remove">Remove</button>
                  </td>
                </tr>
                <tr>
                  <td>MATH 161A</td>
                  <td>Applied Probability and Statistics</td>
                  <td>3</td>
                  <td>MWF</td>
                  <td>9:00 AM - 9:50 AM</td>
                  <td>Dr. Rodriguez</td>
                  <td>
                    <button class="cart-action-btn enroll">Enroll</button>
                    <button class="cart-action-btn remove">Remove</button>
                  </td>
                </tr>
              </tbody>
            </table>
            <div class="cart-actions">
              <button class="cart-action-btn enroll-all">Enroll All</button>
              <button class="cart-action-btn clear-all">Clear Cart</button>
            </div>
          </div>
        </div>
      </section>

      <!-- Timetable Section -->
      <section id="timetable-section" class="content-section">
        <header class="dashboard-header">
          <h1>Weekly Timetable</h1>
          <div class="date" id="timetableDate"></div>
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
      </section>

      <!-- Grades Section -->
      <section id="grades-section" class="content-section">
        <header class="dashboard-header">
          <h1>Academic Records</h1>
          <div class="date" id="gradesDate"></div>
        </header>

        <div class="grades-overview">
          <div class="gpa-card">
            <h2>GPA Overview</h2>
            <div class="gpa-stats">
              <div class="gpa-stat">
                <span class="gpa-value">3.75</span>
                <span class="gpa-label">Current Term GPA</span>
              </div>
              <div class="gpa-stat">
                <span class="gpa-value">3.82</span>
                <span class="gpa-label">Cumulative GPA</span>
              </div>
              <div class="gpa-stat">
                <span class="gpa-value">84</span>
                <span class="gpa-label">Credits Earned</span>
              </div>
            </div>
            <div class="gpa-chart">
              <div class="chart-header">
                <h3>GPA Trend</h3>
                <div class="chart-legend">
                  <span class="legend-item"><span class="legend-color term"></span> Term GPA</span>
                  <span class="legend-item"><span class="legend-color cumulative"></span> Cumulative GPA</span>
                </div>
              </div>
              <div class="chart-placeholder">
                <div class="chart-bar-container">
                  <div class="chart-term">Fall 2023</div>
                  <div class="chart-bars">
                    <div class="chart-bar term" style="height: 70%;">3.5</div>
                    <div class="chart-bar cumulative" style="height: 76%;">3.8</div>
                  </div>
                </div>
                <div class="chart-bar-container">
                  <div class="chart-term">Spring 2024</div>
                  <div class="chart-bars">
                    <div class="chart-bar term" style="height: 74%;">3.7</div>
                    <div class="chart-bar cumulative" style="height: 76%;">3.8</div>
                  </div>
                </div>
                <div class="chart-bar-container">
                  <div class="chart-term">Fall 2024</div>
                  <div class="chart-bars">
                    <div class="chart-bar term" style="height: 78%;">3.9</div>
                    <div class="chart-bar cumulative" style="height: 77%;">3.85</div>
                  </div>
                </div>
                <div class="chart-bar-container">
                  <div class="chart-term">Spring 2025</div>
                  <div class="chart-bars">
                    <div class="chart-bar term" style="height: 75%;">3.75</div>
                    <div class="chart-bar cumulative" style="height: 76.4%;">3.82</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="grades-tabs">
          <button class="tab-btn active" data-tab="current">Current Term</button>
          <button class="tab-btn" data-tab="history">Grade History</button>
          <button class="tab-btn" data-tab="transcript">Transcript</button>
        </div>

        <div class="grades-content">
          <div class="tab-content active" id="current-tab">
            <div class="term-selector">
              <label for="current-term">Term:</label>
              <select id="current-term" class="select-control">
                <option value="spring2025">Spring 2025</option>
                <option value="fall2024">Fall 2024</option>
                <option value="spring2024">Spring 2024</option>
              </select>
            </div>
            
            <table class="grades-table full-width">
              <thead>
                <tr>
                  <th>Course</th>
                  <th>Title</th>
                  <th>Credits</th>
                  <th>Midterm</th>
                  <th>Final</th>
                  <th>Overall</th>
                  <th>Letter Grade</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>CS 136</td>
                  <td>Introduction to Web Development</td>
                  <td>3</td>
                  <td>92%</td>
                  <td>--</td>
                  <td>89%</td>
                  <td><span class="grade-a">A</span></td>
                </tr>
                <tr>
                  <td>CS 162</td>
                  <td>Circuit Theory</td>
                  <td>3</td>
                  <td>85%</td>
                  <td>--</td>
                  <td>87%</td>
                  <td><span class="grade-a">A-</span></td>
                </tr>
                <tr>
                  <td>MATH 124</td>
                  <td>Discrete Math</td>
                  <td>3</td>
                  <td>88%</td>
                  <td>--</td>
                  <td>85%</td>
                  <td><span class="grade-b">B+</span></td>
                </tr>
                <tr>
                  <td>CS 124</td>
                  <td>Computer Architecture</td>
                  <td>3</td>
                  <td>90%</td>
                  <td>--</td>
                  <td>88%</td>
                  <td><span class="grade-a">A-</span></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </main>
  </div>

  <!-- Profile Modal -->
  <div id="profileModal" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-top-bar">
          <button class="notification-btn"><i class="fas fa-bell"></i></button>
          <div class="user-info">
            <div class="user-name">Marlon Burog</div>
            <div class="user-role">Student</div>
          </div>
          <button class="dropdown-btn"><i class="fas fa-chevron-down"></i></button>
        </div>
        <span class="close-modal">&times;</span>
      </div>
      
      <div class="profile-container">
        <h1 class="profile-title">Profile</h1>
        
        <div class="profile-banner">
          <div class="profile-banner-img"></div>
          <div class="profile-avatar-container">
            <img src="${pageContext.request.contextPath}/images/profile-avatar.jpg" alt="Profile avatar" class="profile-avatar" onerror="this.src='https://via.placeholder.com/120x120?text=MJ'">
          </div>
        </div>
        
        <div class="profile-info">
          <h2 class="profile-name">Marlon</h2>
          <p class="profile-email">marlon.burog@sjsu.edu</p>
          <p class="profile-major">Software Engineer</p>
          
          <div class="profile-stats">
            <div class="stat-item">
              <h3>Year 3</h3>
              <p>Current Year</p>
            </div>
            <div class="stat-item">
              <h3>123456789</h3>
              <p>Student ID</p>
            </div>
          </div>
          
          <div class="profile-section">
            <h3 class="section-title">Personal</h3>
            <div class="profile-details">
              <div class="detail-row">
                <div class="detail-item">
                  <label>First name</label>
                  <p>MJ</p>
                </div>
                <div class="detail-item">
                  <label>Major</label>
                  <p>Software Engineer</p>
                </div>
                <div class="detail-item">
                  <label>Gender</label>
                  <p>Male</p>
                </div>
              </div>
              <div class="detail-row">
                <div class="detail-item">
                  <label>Last Name</label>
                  <p>Marlon Burog</p>
                </div>
                <div class="detail-item">
                  <label>Date of Birth</label>
                  <p>01/01/2001</p>
                </div>
                <div class="detail-item">
                  <label>City</label>
                  <p>San Jose</p>
                </div>
              </div>
            </div>
          </div>
          
          <div class="profile-section">
            <h3 class="section-title">Contact</h3>
            <div class="profile-details">
              <div class="detail-row">
                <div class="detail-item">
                  <label>Email</label>
                  <p>Marlon.Burog@sjsu.edu</p>
                </div>
                <div class="detail-item wide">
                  <label>Postal Address</label>
                  <p>6969 Farpost CT<br>San Jose, CA 95121</p>
                </div>
              </div>
              <div class="detail-row">
                <div class="detail-item">
                  <label>Mobile Number</label>
                  <p>0234567891</p>
                </div>
                <div class="detail-item">
                  <label>Alternate Mobile Number</label>
                  <p>0509876543</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
      
      // Set date for other sections
      if (document.getElementById('registrationDate')) {
        document.getElementById('registrationDate').innerText = currentDate;
      }
      if (document.getElementById('timetableDate')) {
        document.getElementById('timetableDate').innerText = currentDate;
      }
      if (document.getElementById('gradesDate')) {
        document.getElementById('gradesDate').innerText = currentDate;
      }
    }
    
    document.addEventListener('DOMContentLoaded', function() {
      setCurrentDate();
      
      // Ensure profile link works properly
      document.getElementById('profileLink').onclick = function(e) {
        e.preventDefault();
        e.stopPropagation(); // Prevent event bubbling
        console.log('Profile link clicked (direct handler)');
        document.getElementById('profileModal').style.display = 'block';
        document.body.classList.add('modal-open');
      };
    });
    
    // Profile Modal
    const profileModal = document.getElementById('profileModal');
    const profileLink = document.getElementById('profileLink');
    const closeProfileModal = document.querySelector('#profileModal .close-modal');
    
    // Open modal when profile link is clicked
    profileLink.addEventListener('click', function(e) {
      e.preventDefault();
      console.log('Profile link clicked');
      profileModal.style.display = 'block';
      document.body.classList.add('modal-open');
    });
    
    // Close modal when X is clicked
    closeProfileModal.addEventListener('click', function() {
      console.log('Close button clicked');
      profileModal.style.display = 'none';
      document.body.classList.remove('modal-open');
    });
    
    // Close modal when clicking outside of it
    window.addEventListener('click', function(event) {
      if (event.target === profileModal) {
        profileModal.style.display = 'none';
        document.body.classList.remove('modal-open');
      }
    });
    
    // Logout Modal
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
    function closeLogoutModal() {
      logoutModal.style.display = 'none';
      document.body.classList.remove('modal-open');
    }
    
    // Close modal when X is clicked
    document.getElementById('closeLogoutModal').addEventListener('click', closeLogoutModal);
    
    // Close modal when Cancel is clicked
    cancelLogoutBtn.addEventListener('click', closeLogoutModal);
    
    // Handle logout confirmation
    confirmLogoutBtn.addEventListener('click', function() {
      window.location.href = "${pageContext.request.contextPath}/";
    });
    
    // Navigation between sections
    const navItems = document.querySelectorAll('.nav-item');
    const contentSections = document.querySelectorAll('.content-section');
    
    navItems.forEach(item => {
      item.addEventListener('click', function(e) {
        if (item.dataset.section === 'logout') {
          return; // Logout is handled separately
        }
        
        if (item.dataset.section === 'profile') {
          return; // Profile is handled separately
        }
        
        e.preventDefault();
        
        // Remove active class from all nav items
        navItems.forEach(navItem => {
          navItem.classList.remove('active');
        });
        
        // Add active class to clicked nav item
        item.classList.add('active');
        
        // Hide all content sections
        contentSections.forEach(section => {
          section.classList.remove('active');
        });
        
        // Show the selected content section
        const sectionId = item.dataset.section + '-section';
        document.getElementById(sectionId).classList.add('active');
      });
    });
    
    // Grades tab functionality
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');
    
    tabButtons.forEach(button => {
      button.addEventListener('click', function() {
        // Remove active class from all buttons
        tabButtons.forEach(btn => {
          btn.classList.remove('active');
        });
        
        // Add active class to clicked button
        button.classList.add('active');
        
        // Hide all tab contents
        tabContents.forEach(content => {
          content.classList.remove('active');
        });
        
        // Show the selected tab content
        const tabId = button.dataset.tab + '-tab';
        document.getElementById(tabId).classList.add('active');
      });
    });
  </script>
</body>
</html> 