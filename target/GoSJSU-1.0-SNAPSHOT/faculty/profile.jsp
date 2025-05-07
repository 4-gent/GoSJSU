<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty Profile | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .profile-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .profile-card {
      background-color: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.5rem;
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      gap: 2rem;
      padding-bottom: 1.5rem;
      border-bottom: 1px solid var(--border);
      margin-bottom: 1.5rem;
    }
    
    .profile-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background-color: var(--primary-light);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 3rem;
      color: var(--primary);
      position: relative;
    }
    
    .upload-overlay {
      position: absolute;
      bottom: 0;
      right: 0;
      width: 35px;
      height: 35px;
      background-color: var(--primary);
      color: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      border: 3px solid white;
    }
    
    .profile-info {
      flex: 1;
    }
    
    .profile-name {
      font-size: 1.75rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
    }
    
    .profile-title {
      font-size: 1.1rem;
      color: var(--text-secondary);
      margin-bottom: 1rem;
    }
    
    .profile-details {
      display: flex;
      gap: 2rem;
      font-size: 0.95rem;
    }
    
    .profile-detail {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      color: var(--text-tertiary);
    }
    
    .profile-detail i {
      color: var(--primary);
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
    
    .form-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 1.5rem;
    }
    
    .form-section {
      margin-bottom: 2rem;
    }
    
    .form-section-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 1rem;
      padding-bottom: 0.5rem;
      border-bottom: 1px solid var(--border);
      color: var(--text-primary);
    }
    
    .form-group {
      margin-bottom: 1.25rem;
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
    
    textarea.form-control {
      min-height: 100px;
      resize: vertical;
    }
    
    .form-help {
      font-size: 0.75rem;
      color: var(--text-tertiary);
      margin-top: 0.25rem;
    }
    
    .form-actions {
      display: flex;
      justify-content: flex-end;
      gap: 1rem;
      margin-top: 2rem;
    }
    
    .profile-btn {
      padding: 0.75rem 1.5rem;
      border-radius: var(--radius);
      font-size: 0.875rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .primary-btn {
      background-color: var(--primary);
      color: white;
      border: none;
    }
    
    .primary-btn:hover {
      background-color: var(--primary-dark);
    }
    
    .secondary-btn {
      background-color: white;
      color: var(--text-primary);
      border: 1px solid var(--border);
    }
    
    .secondary-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .profile-section {
      margin-bottom: 2rem;
    }
    
    .profile-section-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 1rem;
      color: var(--text-primary);
    }
    
    .toggle-switch {
      position: relative;
      display: inline-block;
      width: 50px;
      height: 24px;
    }

    .toggle-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .toggle-slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: .4s;
      border-radius: 24px;
    }

    .toggle-slider:before {
      position: absolute;
      content: "";
      height: 16px;
      width: 16px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }

    input:checked + .toggle-slider {
      background-color: var(--primary);
    }

    input:checked + .toggle-slider:before {
      transform: translateX(26px);
    }
    
    .setting-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 0;
      border-bottom: 1px solid var(--border);
    }
    
    .setting-row:last-child {
      border-bottom: none;
    }
    
    .setting-label {
      font-size: 0.95rem;
      color: var(--text-primary);
    }
    
    .setting-description {
      font-size: 0.875rem;
      color: var(--text-tertiary);
      margin-top: 0.25rem;
    }
    
    .password-requirements {
      list-style: none;
      padding: 0;
      margin: 1rem 0;
      font-size: 0.875rem;
    }
    
    .password-requirements li {
      margin-bottom: 0.5rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .requirement-icon {
      width: 16px;
      height: 16px;
      border-radius: 50%;
      border: 1px solid var(--border);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 0.75rem;
    }
    
    .requirement-met {
      background-color: var(--green-bg);
      color: var(--green-text);
      border-color: var(--green-text);
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
          <li class="nav-item" data-section="reports">
            <a href="${pageContext.request.contextPath}/faculty/reports?facultyId=987654321">
              <i class="fas fa-file-alt"></i>
              <span>Reports</span>
            </a>
          </li>
          <li class="nav-item active" data-section="profile">
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
        <h1>My Profile</h1>
        <div class="date" id="currentDate"></div>
      </header>
      
      <div class="profile-container">
        <!-- Profile Card -->
        <div class="profile-card">
          <div class="profile-header">
            <div class="profile-avatar">
              <span>CP</span>
              <div class="upload-overlay">
                <i class="fas fa-camera"></i>
              </div>
            </div>
            <div class="profile-info">
              <h1 class="profile-name">Chris Pollett, Ph.D.</h1>
              <div class="profile-title">Professor, Department of Computer Science</div>
              <div class="profile-details">
                <div class="profile-detail">
                  <i class="fas fa-id-badge"></i>
                  <span>Faculty ID: 987654321</span>
                </div>
                <div class="profile-detail">
                  <i class="fas fa-envelope"></i>
                  <span>chris.pollett@sjsu.edu</span>
                </div>
                <div class="profile-detail">
                  <i class="fas fa-phone"></i>
                  <span>(408) 555-1234</span>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Tab Container -->
          <div class="tab-container">
            <div class="tabs">
              <div class="tab active" data-tab="personal">Personal Information</div>
              <div class="tab" data-tab="account">Account Settings</div>
              <div class="tab" data-tab="notifications">Notifications</div>
              <div class="tab" data-tab="privacy">Privacy &amp; Security</div>
            </div>
            
            <!-- Tab Content: Personal Information -->
            <div class="tab-content active" id="personal-info">
              <form id="personalInfoForm">
                <div class="form-section">
                  <h3 class="form-section-title">Basic Information</h3>
                  <div class="form-grid">
                    <div class="form-group">
                      <label class="form-label">First Name</label>
                      <input type="text" class="form-control" value="Chris" id="firstName">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Last Name</label>
                      <input type="text" class="form-control" value="Pollett" id="lastName">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Title</label>
                      <input type="text" class="form-control" value="Professor" id="title">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Department</label>
                      <input type="text" class="form-control" value="Computer Science" id="department" readonly>
                      <div class="form-help">Department cannot be changed. Contact HR for updates.</div>
                    </div>
                  </div>
                </div>
                
                <div class="form-section">
                  <h3 class="form-section-title">Contact Information</h3>
                  <div class="form-grid">
                    <div class="form-group">
                      <label class="form-label">Email Address</label>
                      <input type="email" class="form-control" value="chris.pollett@sjsu.edu" id="email" readonly>
                      <div class="form-help">Your institutional email cannot be changed.</div>
                    </div>
                    <div class="form-group">
                      <label class="form-label">Secondary Email</label>
                      <input type="email" class="form-control" value="chrispollett@gmail.com" id="secondaryEmail">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Office Phone</label>
                      <input type="tel" class="form-control" value="(408) 555-1234" id="officePhone">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Mobile Phone</label>
                      <input type="tel" class="form-control" value="(408) 555-5678" id="mobilePhone">
                    </div>
                  </div>
                </div>
                
                <div class="form-section">
                  <h3 class="form-section-title">Office Information</h3>
                  <div class="form-grid">
                    <div class="form-group">
                      <label class="form-label">Building</label>
                      <input type="text" class="form-control" value="MacQuarrie Hall" id="building">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Office Number</label>
                      <input type="text" class="form-control" value="MH 512" id="officeNumber">
                    </div>
                    <div class="form-group">
                      <label class="form-label">Office Hours</label>
                      <input type="text" class="form-control" value="Mon, Wed: 2:00 PM - 4:00 PM" id="officeHours">
                    </div>
                  </div>
                </div>
                
                <div class="form-section">
                  <h3 class="form-section-title">Bio</h3>
                  <div class="form-group">
                    <label class="form-label">Professional Bio</label>
                    <textarea class="form-control" id="bio">Dr. Chris Pollett is a Professor in the Computer Science department at San Jose State University. He received his Ph.D. in Computer Science from UC Santa Barbara. His research interests include web search, programming languages, and artificial intelligence.</textarea>
                    <div class="form-help">Your bio will be visible to students and faculty.</div>
                  </div>
                </div>
                
                <div class="form-actions">
                  <button type="button" class="profile-btn secondary-btn">Cancel</button>
                  <button type="submit" class="profile-btn primary-btn">Save Changes</button>
                </div>
              </form>
            </div>
            
            <!-- Tab Content: Account Settings -->
            <div class="tab-content" id="account-settings">
              <div class="form-section">
                <h3 class="form-section-title">Change Password</h3>
                <form id="changePasswordForm">
                  <div class="form-group">
                    <label class="form-label">Current Password</label>
                    <input type="password" class="form-control" id="currentPassword">
                  </div>
                  <div class="form-group">
                    <label class="form-label">New Password</label>
                    <input type="password" class="form-control" id="newPassword">
                  </div>
                  <div class="form-group">
                    <label class="form-label">Confirm New Password</label>
                    <input type="password" class="form-control" id="confirmPassword">
                  </div>
                  
                  <div class="password-requirements">
                    <li>
                      <span class="requirement-icon requirement-met"><i class="fas fa-check"></i></span>
                      <span>At least 8 characters</span>
                    </li>
                    <li>
                      <span class="requirement-icon"><i class="fas fa-check"></i></span>
                      <span>At least one uppercase letter</span>
                    </li>
                    <li>
                      <span class="requirement-icon"><i class="fas fa-check"></i></span>
                      <span>At least one lowercase letter</span>
                    </li>
                    <li>
                      <span class="requirement-icon"><i class="fas fa-check"></i></span>
                      <span>At least one number</span>
                    </li>
                    <li>
                      <span class="requirement-icon"><i class="fas fa-check"></i></span>
                      <span>At least one special character</span>
                    </li>
                  </div>
                  
                  <div class="form-actions">
                    <button type="button" class="profile-btn secondary-btn">Cancel</button>
                    <button type="submit" class="profile-btn primary-btn">Update Password</button>
                  </div>
                </form>
              </div>
              
              <div class="form-section">
                <h3 class="form-section-title">Account Preferences</h3>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Language</div>
                    <div class="setting-description">Select your preferred language for the portal</div>
                  </div>
                  <div>
                    <select class="form-control" style="width: 200px;">
                      <option value="en" selected>English</option>
                      <option value="es">Spanish</option>
                      <option value="zh">Chinese</option>
                    </select>
                  </div>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Time Zone</div>
                    <div class="setting-description">Select your current time zone</div>
                  </div>
                  <div>
                    <select class="form-control" style="width: 200px;">
                      <option value="pst" selected>Pacific Time (UTC-8)</option>
                      <option value="est">Eastern Time (UTC-5)</option>
                      <option value="utc">UTC</option>
                    </select>
                  </div>
                </div>
                <div class="form-actions">
                  <button type="button" class="profile-btn primary-btn">Save Preferences</button>
                </div>
              </div>
            </div>
            
            <!-- Tab Content: Notifications -->
            <div class="tab-content" id="notification-settings">
              <div class="form-section">
                <h3 class="form-section-title">Email Notifications</h3>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Student Messages</div>
                    <div class="setting-description">Receive emails when students send you messages</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Assignment Submissions</div>
                    <div class="setting-description">Receive emails when students submit assignments</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Course Updates</div>
                    <div class="setting-description">Receive emails about course updates and changes</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">System Announcements</div>
                    <div class="setting-description">Receive important announcements from the system</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
              </div>
              
              <div class="form-section">
                <h3 class="form-section-title">In-App Notifications</h3>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Student Activity</div>
                    <div class="setting-description">Receive notifications about student activities in your courses</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Due Date Reminders</div>
                    <div class="setting-description">Receive reminders about upcoming due dates</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Grade Submission Deadlines</div>
                    <div class="setting-description">Receive reminders about grade submission deadlines</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
              </div>
              
              <div class="form-actions">
                <button type="button" class="profile-btn primary-btn">Save Notification Settings</button>
              </div>
            </div>
            
            <!-- Tab Content: Privacy & Security -->
            <div class="tab-content" id="privacy-security">
              <div class="form-section">
                <h3 class="form-section-title">Privacy Settings</h3>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Profile Visibility</div>
                    <div class="setting-description">Control who can see your profile information</div>
                  </div>
                  <div>
                    <select class="form-control" style="width: 200px;">
                      <option value="all" selected>All University Members</option>
                      <option value="faculty">Faculty Only</option>
                      <option value="department">My Department Only</option>
                      <option value="students">My Students Only</option>
                    </select>
                  </div>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Contact Information Visibility</div>
                    <div class="setting-description">Control who can see your contact information</div>
                  </div>
                  <div>
                    <select class="form-control" style="width: 200px;">
                      <option value="all">All University Members</option>
                      <option value="faculty" selected>Faculty Only</option>
                      <option value="department">My Department Only</option>
                      <option value="students">My Students Only</option>
                    </select>
                  </div>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Show Online Status</div>
                    <div class="setting-description">Allow others to see when you are online</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
              </div>
              
              <div class="form-section">
                <h3 class="form-section-title">Security Settings</h3>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Two-Factor Authentication</div>
                    <div class="setting-description">Add an extra layer of security to your account</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox">
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Login Notifications</div>
                    <div class="setting-description">Receive notifications when your account is accessed from a new device</div>
                  </div>
                  <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="toggle-slider"></span>
                  </label>
                </div>
                <div class="setting-row">
                  <div>
                    <div class="setting-label">Active Sessions</div>
                    <div class="setting-description">View and manage devices where you're currently logged in</div>
                  </div>
                  <button class="profile-btn secondary-btn">View Sessions</button>
                </div>
              </div>
              
              <div class="form-actions">
                <button type="button" class="profile-btn primary-btn">Save Privacy Settings</button>
              </div>
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
          document.getElementById(`${tabId}-info`).classList.add('active');
          
          if (tabId === 'account') {
            document.getElementById('account-settings').classList.add('active');
          } else if (tabId === 'notifications') {
            document.getElementById('notification-settings').classList.add('active');
          } else if (tabId === 'privacy') {
            document.getElementById('privacy-security').classList.add('active');
          }
        });
      });
      
      // Personal Info Form Submission
      const personalInfoForm = document.getElementById('personalInfoForm');
      
      personalInfoForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // In a real app, this would send the form data to the server
        alert('Profile information updated successfully!');
      });
      
      // Password Form Submission
      const passwordForm = document.getElementById('changePasswordForm');
      
      passwordForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const currentPassword = document.getElementById('currentPassword').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (!currentPassword || !newPassword || !confirmPassword) {
          alert('Please fill in all password fields');
          return;
        }
        
        if (newPassword !== confirmPassword) {
          alert('New passwords do not match');
          return;
        }
        
        // In a real app, this would send the form data to the server
        alert('Password updated successfully!');
        
        // Clear form
        passwordForm.reset();
      });
      
      // Profile Picture Upload
      const uploadOverlay = document.querySelector('.upload-overlay');
      
      uploadOverlay.addEventListener('click', function() {
        // In a real app, this would open a file dialog
        alert('Upload a new profile picture');
      });
    });
  </script>
</body>
</html>
