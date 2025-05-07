<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Course Registration | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    /* Modern Registration Styles */
    .registration-page {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .registration-status-card {
      background: var(--surface);
      border-radius: var(--radius-md);
      box-shadow: var(--shadow);
      padding: 1.5rem;
      margin-bottom: 2rem;
      border-left: 4px solid var(--primary);
      transition: all 0.3s ease;
    }
    
    .registration-status-card:hover {
      box-shadow: var(--shadow-md);
      transform: translateY(-2px);
    }
    
    .status-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }
    
    .status-header h2 {
      margin: 0;
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .status-badge {
      padding: 0.5rem 1rem;
      border-radius: var(--radius);
      font-size: 0.875rem;
      font-weight: 500;
      letter-spacing: 0.5px;
      text-transform: uppercase;
    }
    
    .status-badge.open {
      background-color: var(--green-bg);
      color: var(--green-text);
    }
    
    .status-details {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 1.5rem;
    }
    
    .status-item {
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }
    
    .status-item .label {
      font-size: 0.875rem;
      color: var(--text-secondary);
      font-weight: 500;
    }
    
    .status-item .value {
      font-size: 1rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .options-card {
      background: var(--surface);
      border-radius: var(--radius-md);
      box-shadow: var(--shadow);
      padding: 1.5rem;
      margin-bottom: 2rem;
    }
    
    .options-card h2 {
      margin: 0 0 1.5rem;
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--text-primary);
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }
    
    .registration-options {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 1.5rem;
    }
    
    .option-card {
      background: var(--surface-hover);
      border-radius: var(--radius);
      padding: 2rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      transition: all 0.3s ease;
      border: 1px solid var(--border);
    }
    
    .option-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-md);
      border-color: var(--primary);
    }
    
    .option-icon {
      width: 70px;
      height: 70px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 1.5rem;
      transition: all 0.3s ease;
    }
    
    .option-card:hover .option-icon {
      transform: scale(1.1);
    }
    
    .option-icon i {
      font-size: 2rem;
      color: white;
    }
    
    .option-card h3 {
      margin: 0 0 1rem;
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .option-card p {
      margin: 0 0 1.5rem;
      font-size: 0.95rem;
      color: var(--text-secondary);
      line-height: 1.5;
    }
    
    .option-btn {
      padding: 0.75rem 1.5rem;
      border-radius: var(--radius);
      font-weight: 500;
      font-size: 0.95rem;
      cursor: pointer;
      transition: all 0.2s ease;
      border: none;
      width: 100%;
    }
    
    .add-classes-btn {
      background-color: var(--primary);
      color: white;
    }
    
    .add-classes-btn:hover {
      background-color: var(--primary-dark);
      box-shadow: var(--shadow);
    }
    
    .drop-classes-btn {
      background-color: var(--task-danger-text);
      color: white;
    }
    
    .drop-classes-btn:hover {
      background-color: var(--task-danger-border);
      box-shadow: var(--shadow);
    }
    
    .registration-section {
      background: var(--surface);
      border-radius: var(--radius-md);
      box-shadow: var(--shadow);
      padding: 1.5rem;
      margin-bottom: 2rem;
      animation: fadeIn 0.5s ease;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .registration-section h2 {
      margin: 0 0 1.5rem;
      font-size: 1.25rem;
      font-weight: 600;
      color: var(--text-primary);
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }
    
    .search-container {
      background: var(--surface-hover);
      border-radius: var(--radius);
      padding: 1.5rem;
      margin-bottom: 2rem;
      border: 1px solid var(--border);
    }
    
    .search-controls {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 1rem;
      align-items: end;
    }
    
    .search-field {
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }
    
    .search-field label {
      font-size: 0.875rem;
      font-weight: 500;
      color: var(--text-secondary);
    }
    
    .select-control, .input-control {
      padding: 0.75rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 0.95rem;
      transition: all 0.2s ease;
      background-color: var(--surface);
      color: var(--text-primary);
    }
    
    .select-control:focus, .input-control:focus {
      border-color: var(--primary);
      outline: none;
      box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
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
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }
    
    .search-btn:hover {
      background-color: var(--primary-dark);
      box-shadow: var(--shadow);
    }
    
    .search-results, .enrolled-courses {
      margin-top: 2rem;
    }
    
    .search-results h3, .enrolled-courses h3 {
      margin: 0 0 1rem;
      font-size: 1.1rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .courses-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.95rem;
    }
    
    .courses-table th {
      background-color: var(--surface-hover);
      padding: 1rem;
      text-align: left;
      font-weight: 600;
      color: var(--text-primary);
      border-bottom: 2px solid var(--border);
    }
    
    .courses-table td {
      padding: 1rem;
      border-bottom: 1px solid var(--border);
      color: var(--text-primary);
    }
    
    .courses-table tr:hover td {
      background-color: var(--surface-hover);
    }
    
    .availability-open {
      color: var(--grade-a);
      font-weight: 500;
    }
    
    .availability-waitlist {
      color: var(--task-warning-text);
      font-weight: 500;
    }
    
    .availability-closed {
      color: var(--task-danger-text);
      font-weight: 500;
    }
    
    .action-btn {
      padding: 0.5rem 1rem;
      border-radius: var(--radius);
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
      border: none;
      white-space: nowrap;
    }
    
    .add-btn {
      background-color: var(--blue-bg);
      color: var(--blue-text);
    }
    
    .add-btn:hover {
      background-color: var(--primary);
      color: white;
    }
    
    .drop-btn {
      background-color: var(--red-bg);
      color: var(--red-text);
    }
    
    .drop-btn:hover {
      background-color: var(--task-danger-text);
      color: white;
    }
    
    .action-btn:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
    
    /* Modal Styles */
    .modal-content.confirmation-modal {
      max-width: 480px;
      border-radius: var(--radius-lg);
      overflow: hidden;
    }
    
    .confirmation-header {
      background: linear-gradient(135deg, var(--red-bg), var(--task-danger-text));
      color: white;
      padding: 1.5rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .confirmation-header h2 {
      margin: 0;
      font-size: 1.25rem;
      font-weight: 600;
    }
    
    .confirmation-body {
      padding: 1.5rem;
    }
    
    .confirmation-details {
      background-color: var(--surface-hover);
      border-radius: var(--radius);
      padding: 1rem;
      margin: 1rem 0;
    }
    
    .confirmation-details .detail-item {
      display: flex;
      align-items: flex-start;
      gap: 0.5rem;
    }
    
    .confirmation-details .label {
      font-size: 0.875rem;
      font-weight: 500;
      color: var(--text-secondary);
      white-space: nowrap;
    }
    
    .confirmation-details .value {
      font-size: 0.95rem;
      font-weight: 600;
      color: var(--text-primary);
    }
    
    .confirmation-actions {
      display: flex;
      justify-content: flex-end;
      gap: 1rem;
      margin-top: 1.5rem;
    }
    
    .cancel-btn {
      padding: 0.75rem 1.5rem;
      background-color: var(--surface-hover);
      color: var(--text-primary);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .cancel-btn:hover {
      background-color: var(--border);
    }
    
    .confirm-btn {
      padding: 0.75rem 1.5rem;
      background-color: var(--task-danger-text);
      color: white;
      border: none;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .confirm-btn:hover {
      background-color: var(--task-danger-border);
      box-shadow: var(--shadow);
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
            <a href="${pageContext.request.contextPath}/student/dashboard?studentId=${param.studentId}">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile.jsp?studentId=${param.studentId}">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item active" data-section="registration">
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
        <h1>Course Registration</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="registration-page">
        <!-- Registration Status Card -->
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

        <!-- Registration Options Card -->
        <div class="options-card">
          <h2>Registration Options</h2>
          <div class="registration-options">
            <div class="option-card">
              <div class="option-icon">
                <i class="fas fa-plus-circle"></i>
              </div>
              <h3>Add Classes</h3>
              <p>Search and register for available courses for the upcoming semester.</p>
              <button class="option-btn add-classes-btn" id="addClassesBtn">Add Classes</button>
            </div>
            
            <div class="option-card">
              <div class="option-icon">
                <i class="fas fa-minus-circle"></i>
              </div>
              <h3>Drop Classes</h3>
              <p>View your current enrollment and drop courses as needed.</p>
              <button class="option-btn drop-classes-btn" id="dropClassesBtn">Drop Classes</button>
            </div>
          </div>
        </div>

        <!-- Add Classes Section (Hidden by Default) -->
        <div id="addClassesSection" class="registration-section" style="display: none;">
          <h2>Add Classes</h2>
          
          <div class="search-container">
            <div class="search-controls">
              <div class="search-field">
                <label for="term">Term:</label>
                <select id="term" class="select-control">
                  <option value="fall2025">Fall 2025</option>
                  <option value="spring2026">Spring 2026</option>
                </select>
              </div>
              <div class="search-field">
                <label for="subject">Subject:</label>
                <select id="subject" class="select-control">
                  <option value="">Select Subject</option>
                  <option value="CS">Computer Science (CS)</option>
                  <option value="MATH">Mathematics (MATH)</option>
                  <option value="ENGL">English (ENGL)</option>
                  <option value="PHYS">Physics (PHYS)</option>
                </select>
              </div>
              <div class="search-field">
                <label for="courseNumber">Course Number:</label>
                <input type="text" id="courseNumber" placeholder="e.g., 151" class="input-control">
              </div>
              <button class="search-btn" id="searchCoursesBtn">
                <i class="fas fa-search"></i>
                Search Courses
              </button>
            </div>
          </div>
          
          <div class="search-results">
            <h3>Available Courses</h3>
            <table class="courses-table">
              <thead>
                <tr>
                  <th>Course</th>
                  <th>Title</th>
                  <th>Units</th>
                  <th>Days</th>
                  <th>Time</th>
                  <th>Location</th>
                  <th>Instructor</th>
                  <th>Availability</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>CS 151</td>
                  <td>Object-Oriented Design</td>
                  <td>3</td>
                  <td>MW</td>
                  <td>10:30 AM - 11:45 AM</td>
                  <td>MH 222</td>
                  <td>Dr. Pearce</td>
                  <td><span class="availability-open">Open (15)</span></td>
                  <td><button class="action-btn add-btn">Add</button></td>
                </tr>
                <tr>
                  <td>CS 157A</td>
                  <td>Database Management Systems</td>
                  <td>3</td>
                  <td>TR</td>
                  <td>1:30 PM - 2:45 PM</td>
                  <td>MH 225</td>
                  <td>Dr. Chen</td>
                  <td><span class="availability-open">Open (8)</span></td>
                  <td><button class="action-btn add-btn">Add</button></td>
                </tr>
                <tr>
                  <td>CS 149</td>
                  <td>Operating Systems</td>
                  <td>3</td>
                  <td>MW</td>
                  <td>3:00 PM - 4:15 PM</td>
                  <td>MH 233</td>
                  <td>Dr. Williams</td>
                  <td><span class="availability-waitlist">Waitlist (2)</span></td>
                  <td><button class="action-btn add-btn">Join Waitlist</button></td>
                </tr>
                <tr>
                  <td>MATH 161A</td>
                  <td>Applied Probability and Statistics</td>
                  <td>3</td>
                  <td>MWF</td>
                  <td>9:00 AM - 9:50 AM</td>
                  <td>DH 318</td>
                  <td>Dr. Rodriguez</td>
                  <td><span class="availability-closed">Closed</span></td>
                  <td><button class="action-btn add-btn" disabled>Closed</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        
        <!-- Drop Classes Section (Hidden by Default) -->
        <div id="dropClassesSection" class="registration-section" style="display: none;">
          <h2>Drop Classes</h2>
          
          <div class="enrolled-courses">
            <h3>Current Enrollment - Spring 2025</h3>
            <table class="courses-table">
              <thead>
                <tr>
                  <th>Course</th>
                  <th>Title</th>
                  <th>Units</th>
                  <th>Days</th>
                  <th>Time</th>
                  <th>Location</th>
                  <th>Instructor</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>CS 136</td>
                  <td>Introduction to Web Development</td>
                  <td>3</td>
                  <td>TR</td>
                  <td>1:00 PM - 2:15 PM</td>
                  <td>SF 12</td>
                  <td>Dr. Harris</td>
                  <td><button class="action-btn drop-btn">Drop</button></td>
                </tr>
                <tr>
                  <td>CS 162</td>
                  <td>Circuit Theory</td>
                  <td>3</td>
                  <td>MW</td>
                  <td>8:00 AM - 9:15 AM</td>
                  <td>SF 13</td>
                  <td>Dr. Smith</td>
                  <td><button class="action-btn drop-btn">Drop</button></td>
                </tr>
                <tr>
                  <td>MATH 124</td>
                  <td>Discrete Math</td>
                  <td>3</td>
                  <td>MW</td>
                  <td>10:30 AM - 11:45 AM</td>
                  <td>FF 10</td>
                  <td>Dr. Johnson</td>
                  <td><button class="action-btn drop-btn">Drop</button></td>
                </tr>
                <tr>
                  <td>CS 124</td>
                  <td>Computer Architecture</td>
                  <td>3</td>
                  <td>F</td>
                  <td>3:00 PM - 5:45 PM</td>
                  <td>SF 20</td>
                  <td>Dr. Lee</td>
                  <td><button class="action-btn drop-btn">Drop</button></td>
                </tr>
              </tbody>
            </table>
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

  <!-- Drop Confirmation Modal -->
  <div id="dropConfirmModal" class="modal">
    <div class="modal-content confirmation-modal">
      <div class="confirmation-header">
        <h2>Confirm Drop Course</h2>
        <span class="close-modal" id="closeDropConfirmModal">&times;</span>
      </div>
      <div class="confirmation-body">
        <p>Are you sure you want to drop this course? This action cannot be undone.</p>
        <div class="confirmation-details">
          <div class="detail-item">
            <span class="label">Course:</span>
            <span class="value" id="dropCourseName">CS 136 - Introduction to Web Development</span>
          </div>
        </div>
        <div class="confirmation-actions">
          <button class="cancel-btn">Cancel</button>
          <button class="confirm-btn">Confirm Drop</button>
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

      // Registration Options
      const addClassesBtn = document.getElementById('addClassesBtn');
      const dropClassesBtn = document.getElementById('dropClassesBtn');
      const addClassesSection = document.getElementById('addClassesSection');
      const dropClassesSection = document.getElementById('dropClassesSection');
      
      // Show Add Classes section
      addClassesBtn.addEventListener('click', function() {
        if (addClassesSection.style.display === 'none') {
          addClassesSection.style.display = 'block';
          dropClassesSection.style.display = 'none';
          
          // Smoothly scroll to the section
          addClassesSection.scrollIntoView({ behavior: 'smooth' });
        } else {
          addClassesSection.style.display = 'none';
        }
      });
      
      // Show Drop Classes section
      dropClassesBtn.addEventListener('click', function() {
        if (dropClassesSection.style.display === 'none') {
          dropClassesSection.style.display = 'block';
          addClassesSection.style.display = 'none';
          
          // Smoothly scroll to the section
          dropClassesSection.scrollIntoView({ behavior: 'smooth' });
        } else {
          dropClassesSection.style.display = 'none';
        }
      });
      
      // Drop Course Confirmation
      const dropConfirmModal = document.getElementById('dropConfirmModal');
      const closeDropConfirmModal = document.getElementById('closeDropConfirmModal');
      const dropBtns = document.querySelectorAll('.drop-btn');
      const dropCourseName = document.getElementById('dropCourseName');
      
      // Open drop confirmation modal
      dropBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const row = this.closest('tr');
          const course = row.cells[0].textContent;
          const title = row.cells[1].textContent;
          
          dropCourseName.textContent = course + ' - ' + title;
          dropConfirmModal.style.display = 'block';
          document.body.classList.add('modal-open');
        });
      });
      
      // Close drop confirmation modal
      function closeDropConfirmModalFunc() {
        dropConfirmModal.style.display = 'none';
        document.body.classList.remove('modal-open');
      }
      
      // Close modal when X is clicked
      closeDropConfirmModal.addEventListener('click', closeDropConfirmModalFunc);
      
      // Close modal when Cancel is clicked
      document.querySelector('#dropConfirmModal .cancel-btn').addEventListener('click', closeDropConfirmModalFunc);
      
      // Handle drop confirmation
      document.querySelector('#dropConfirmModal .confirm-btn').addEventListener('click', function() {
        // Here you would typically make an AJAX call to drop the course
        alert('Course has been dropped successfully.');
        closeDropConfirmModalFunc();
      });
      
      // Course Search
      document.getElementById('searchCoursesBtn').addEventListener('click', function() {
        // Here you would typically make an AJAX call to search for courses
        alert('Search functionality would be implemented with backend integration.');
      });
      
      // Add Course
      document.querySelectorAll('.add-btn').forEach(btn => {
        btn.addEventListener('click', function() {
          if (!this.disabled) {
            const row = this.closest('tr');
            const course = row.cells[0].textContent;
            const title = row.cells[1].textContent;
            
            alert('Added ' + course + ' - ' + title + ' to your schedule.');
          }
        });
      });
    });
  </script>
</body>
</html> 