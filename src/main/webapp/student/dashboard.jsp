<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.student.Student, com.gosjsu.student.Course, com.gosjsu.shared.Grade" %>
<%@ page import="com.gosjsu.shared.StudentGradeDTO" %>
<%@ page import="java.util.List" %>
<%
    // Ensure the student object is stored in the session for later use (e.g., in EnrollmentServlet)
    Student student = (Student) request.getAttribute("student");
    if (student != null) {
         session.setAttribute("student", student);
    }
    
    // Get the GPA from request attributes
    Double gpa = (Double) request.getAttribute("gpa");
    Double currentSemesterGPA = (Double) request.getAttribute("currentSemesterGPA");
    Double previousSemesterGPA = (Double) request.getAttribute("previousSemesterGPA");
    
    if (gpa == null) gpa = 0.0;
    if (currentSemesterGPA == null) currentSemesterGPA = 0.0;
    if (previousSemesterGPA == null) previousSemesterGPA = 0.0;
    
    // Format GPA to show 2 decimal places
    String formattedGPA = String.format("%.2f", gpa);
    String formattedCurrentGPA = String.format("%.2f", currentSemesterGPA);
    String formattedPrevGPA = String.format("%.2f", previousSemesterGPA);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    /* Additional styles for the timetable */
    .timetable-section {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      margin-bottom: 20px;
      padding: 20px;
    }
    .timetable-section table {
      width: 100%;
      border-collapse: collapse;
    }
    .timetable-section th {
      background-color: #f5f5f5;
      padding: 10px;
      text-align: left;
      font-weight: 600;
      color: #555;
    }
    .timetable-section td {
      padding: 10px;
      border-bottom: 1px solid #eee;
    }
    .timetable-section .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }
    .timetable-section .section-header h2 {
      font-size: 1.1rem;
      font-weight: 600;
      color: #333;
      margin: 0;
    }
    .semester-badge {
      background-color: #f0f0f0;
      color: #666;
      padding: 4px 10px;
      border-radius: 4px;
      font-size: 0.8rem;
      font-weight: 500;
    }
    
    /* GPA Detail Styles */
    .gpa-details {
      display: flex;
      flex-direction: column;
      margin-top: 5px;
      font-size: 0.8rem;
    }
    
    .gpa-semester {
      color: #666;
      margin-bottom: 3px;
    }
    
    .gpa-value {
      font-weight: 600;
    }
    
    .gpa-current {
      color: #4a6cf7;
    }
    
    .gpa-previous {
      color: #6b7280;
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
            <a href="#">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="enrollment">
            <a href="${pageContext.request.contextPath}/student/enrollment">
              <i class="fas fa-book"></i>
              <span>Enrollment</span>
            </a>
          </li>
          <li class="nav-item" data-section="timetable">
            <a href="${pageContext.request.contextPath}/student/timetable">
              <i class="fas fa-calendar-alt"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item" data-section="grades">
            <a href="${pageContext.request.contextPath}/student/grades">
              <i class="fas fa-graduation-cap"></i>
              <span>Grades</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile" id="profileLink">
              <i class="fas fa-user"></i>
              <span>Profile</span>
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
          <h1>Welcome, <%= ((Student) request.getAttribute("student")).getFirstName() %>!</h1>
          <div class="date" id="currentDate"></div>
        </header>

        <!-- Overview Cards -->
        <section class="overview-cards">
          <div class="card blue">
            <h3>Total Courses</h3>
            <div class="stat"><%= ((List<Course>) request.getAttribute("enrollments")).size() %></div>
          </div>
          <div class="card green">
            <h3>Current GPA</h3>
            <div class="stat"><%= formattedGPA %></div>
            <div class="gpa-details">
              <div class="gpa-semester">
                <span class="gpa-current">Current Term: <%= formattedCurrentGPA %></span>
              </div>
              <div class="gpa-semester">
                <span class="gpa-previous">Previous Term: <%= formattedPrevGPA %></span>
              </div>
            </div>
          </div>
          <div class="card purple">
            <h3>Registration Status</h3>
            <div class="stat-badge">Open</div>
          </div>
        </section>

        <!-- Content Grid -->
        <div class="content-grid">
          <!-- Left Column -->
          <div class="left-column">
            <!-- Enrolled Classes -->
            <section class="classes-section">
              <div class="section-header">
                <h2>Enrolled Classes</h2>
              </div>
              
              <div class="classes-container">
                <% List<Course> enrollments = (List<Course>) request.getAttribute("enrollments"); %>
                <% for (Course course : enrollments) { %>
                  <div class="class-card gray">
                    <div class="class-info">
                      <div class="course-code"><%= course.getCourseId() %></div>
                      <div class="course-name"><%= course.getCourseName() %></div>
                    </div>
                  </div>
                <% } %>
              </div>
            </section>

            <!-- Simple Timetable Section -->
            <section class="timetable-section">
              <div class="section-header">
                <h2>Class Schedule</h2>
                <span class="semester-badge">Fall 2025</span>
              </div>
              
              <table>
                <thead>
                  <tr>
                    <th>Course</th>
                    <th>Days</th>
                    <th>Time</th>
                    <th>Location</th>
                  </tr>
                </thead>
                <tbody>
                  <% List<Course> courses = (List<Course>) request.getAttribute("enrollments"); 
                     if (courses != null && !courses.isEmpty()) {
                       for (Course course : courses) {
                         // Generate simple schedule data for demo
                         String days = (course.getCourseId() % 2 == 0) ? "MW" : "TTh";
                         String time = "0" + (8 + (course.getCourseId() % 3)) + ":00 - " + (10 + (course.getCourseId() % 3)) + ":00";
                         String location = "Room " + (100 + (course.getCourseId() * 10));
                  %>
                    <tr>
                      <td><%= course.getCourseName() %></td>
                      <td><%= days %></td>
                      <td><%= time %></td>
                      <td><%= location %></td>
                    </tr>
                  <% }
                     } else { %>
                    <tr>
                      <td colspan="4" style="text-align: center;">No classes scheduled</td>
                    </tr>
                  <% } %>
                </tbody>
              </table>
            </section>

            <!-- Grade Summary Section -->
            <section class="grades-section">
              <div class="section-header">
                <h2>Recent Grades</h2>
                <a href="${pageContext.request.contextPath}/student/grades" style="color: #4a6cf7; font-size: 0.9rem; text-decoration: none;">
                  View All <i class="fas fa-chevron-right" style="font-size: 0.8rem; margin-left: 3px;"></i>
                </a>
              </div>
              
              <div class="grades-table">
                <table>
                  <thead>
                    <tr>
                      <th>Course</th>
                      <th>Grade</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% 
                    List<StudentGradeDTO> grades = (List<StudentGradeDTO>) request.getAttribute("grades");
                    if (grades != null && !grades.isEmpty()) {
                      // Only show up to 3 recent grades on dashboard
                      int count = 0;
                      for (StudentGradeDTO grade : grades) {
                        if (count < 3) {
                    %>
                      <tr>
                        <td><%= grade.getCourseName() %></td>
                        <td><%= grade.getGrade() != null ? grade.getGrade() : "Not Graded" %></td>
                      </tr>
                    <% 
                        }
                        count++;
                      }
                    } else { 
                    %>
                      <tr>
                        <td colspan="2" style="text-align: center;">No grades available</td>
                      </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
            </section>
          </div>
          
          <!-- Academic Calendar Section -->
          <div class="right-column">
            <section class="academic-calendar-section">
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
            </section>
          </div>
        </div>
      </section>
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
    /* Academic Calendar Styles */
    .content-grid {
      display: flex;
      gap: 1.5rem;
    }
    
    .left-column {
      flex: 2;
    }
    
    .right-column {
      flex: 1;
    }
    
    .academic-calendar-section {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      margin-bottom: 20px;
      padding: 20px;
    }
    
    .academic-calendar-section .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }
    
    .academic-calendar-section .section-header h2 {
      font-size: 1.1rem;
      font-weight: 600;
      color: #333;
      margin: 0;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    
    .academic-calendar-section .section-header h2 i {
      color: #4a6cf7;
    }
    
    .calendar-container {
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
    }
    
    .calendar-toggle-btn {
      background-color: #f0f4fd;
      color: #4a6cf7;
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
    
    .event-item {
      display: flex;
      padding: 0.75rem;
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
      background: linear-gradient(135deg, #4a6cf7, #5e85fb);
      color: white;
      font-weight: 600;
      padding: 5px 10px;
      border-radius: 6px;
      font-size: 0.85rem;
      text-align: center;
      box-shadow: 0 2px 4px rgba(74, 108, 247, 0.2);
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
      color: #4a6cf7;
      font-size: 0.8rem;
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
      color: #4a6cf7;
    }
    
    @media (max-width: 768px) {
      .content-grid {
        flex-direction: column;
      }
      
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