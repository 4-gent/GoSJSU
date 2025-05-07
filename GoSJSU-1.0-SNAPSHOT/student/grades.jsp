<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Grades | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    /* Grades Overview Section */
    .grades-overview {
      margin-bottom: 2rem;
    }
    
    .gpa-card {
      background-color: white;
      border-radius: 0.5rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      padding: 1.5rem;
      border: 1px solid #e5e7eb;
    }
    
    .gpa-card h2 {
      font-size: 1.25rem;
      font-weight: 600;
      color: #111827;
      margin-top: 0;
      margin-bottom: 1.5rem;
    }
    
    .gpa-stats {
      display: flex;
      flex-wrap: wrap;
      gap: 2rem;
      margin-bottom: 1.5rem;
    }
    
    .gpa-stat {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    
    .gpa-value {
      font-size: 2rem;
      font-weight: 700;
      color: #4a6cf7;
      line-height: 1;
      margin-bottom: 0.5rem;
    }
    
    .gpa-label {
      font-size: 0.875rem;
      color: #6b7280;
    }
    
    /* GPA Chart */
    .gpa-chart {
      border-top: 1px solid #e5e7eb;
      padding-top: 1.5rem;
    }
    
    .chart-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
    }
    
    .chart-header h3 {
      font-size: 1rem;
      font-weight: 600;
      color: #111827;
      margin: 0;
    }
    
    .chart-legend {
      display: flex;
      gap: 1rem;
    }
    
    .legend-item {
      display: flex;
      align-items: center;
      font-size: 0.75rem;
      color: #6b7280;
    }
    
    .legend-color {
      display: inline-block;
      width: 12px;
      height: 12px;
      margin-right: 0.375rem;
      border-radius: 2px;
    }
    
    .legend-color.term {
      background-color: #4a6cf7;
    }
    
    .legend-color.cumulative {
      background-color: #34d399;
    }
    
    .chart-placeholder {
      display: flex;
      height: 200px;
      align-items: flex-end;
      gap: 2rem;
      margin-top: 1.5rem;
      padding: 0 1rem;
    }
    
    .chart-bar-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      flex: 1;
    }
    
    .chart-term {
      font-size: 0.75rem;
      color: #6b7280;
      margin-top: 0.75rem;
    }
    
    .chart-bars {
      display: flex;
      align-items: flex-end;
      gap: 0.5rem;
      height: 100%;
      width: 100%;
    }
    
    .chart-bar {
      position: relative;
      flex: 1;
      border-radius: 4px 4px 0 0;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 0.75rem;
      font-weight: 500;
      transition: height 0.3s ease;
    }
    
    .chart-bar::after {
      content: attr(style);
      position: absolute;
      top: -25px;
      font-size: 0.75rem;
      color: #6b7280;
    }
    
    .chart-bar.term {
      background-color: #4a6cf7;
    }
    
    .chart-bar.cumulative {
      background-color: #34d399;
    }
    
    /* Tabs Section */
    .grades-tabs {
      display: flex;
      border-bottom: 1px solid #e5e7eb;
      margin-bottom: 1.5rem;
    }
    
    .tab-btn {
      padding: 0.75rem 1.25rem;
      font-size: 0.875rem;
      font-weight: 500;
      color: #6b7280;
      background: none;
      border: none;
      border-bottom: 2px solid transparent;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .tab-btn:hover {
      color: #4a6cf7;
    }
    
    .tab-btn.active {
      color: #4a6cf7;
      border-bottom-color: #4a6cf7;
    }
    
    /* Tab Content */
    .tab-content {
      display: none;
    }
    
    .tab-content.active {
      display: block;
    }
    
    /* Term Selector */
    .term-selector {
      display: flex;
      align-items: center;
      margin-bottom: 1.5rem;
    }
    
    .term-selector label {
      margin-right: 0.5rem;
      font-weight: 500;
      color: #4b5563;
    }
    
    .select-control {
      padding: 0.5rem 1rem;
      border-radius: 0.375rem;
      border: 1px solid #e5e7eb;
      background-color: white;
      font-size: 0.875rem;
      color: #4b5563;
      min-width: 150px;
    }
    
    /* Grades Table */
    .grades-table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 2rem;
    }
    
    .grades-table th, 
    .grades-table td {
      padding: 0.75rem 1rem;
      text-align: left;
      border-bottom: 1px solid #e5e7eb;
    }
    
    .grades-table th {
      background-color: #f9fafb;
      font-weight: 500;
      color: #4b5563;
    }
    
    .grades-table tr:hover td {
      background-color: #f9fafb;
    }
    
    .full-width {
      width: 100%;
    }
    
    /* Grade Indicators */
    .grade-a, .grade-b, .grade-c, .grade-d, .grade-f {
      display: inline-block;
      padding: 0.25rem 0.5rem;
      border-radius: 4px;
      font-weight: 600;
      font-size: 0.875rem;
    }
    
    .grade-a {
      background-color: #dcfce7;
      color: #16a34a;
    }
    
    .grade-b {
      background-color: #e0f2fe;
      color: #0284c7;
    }
    
    .grade-c {
      background-color: #fef9c3;
      color: #ca8a04;
    }
    
    .grade-d {
      background-color: #ffedd5;
      color: #ea580c;
    }
    
    .grade-f {
      background-color: #fee2e2;
      color: #dc2626;
    }
    
    /* History Section */
    .history-section {
      margin-bottom: 2rem;
    }
    
    .history-section h3 {
      font-size: 1.125rem;
      font-weight: 600;
      color: #111827;
      margin-top: 2rem;
      margin-bottom: 1rem;
    }
    
    /* Transcript Tab */
    .transcript-actions {
      display: flex;
      gap: 1rem;
      margin-bottom: 2rem;
    }
    
    .action-btn {
      display: flex;
      align-items: center;
      padding: 0.675rem 1.25rem;
      background-color: white;
      border: 1px solid #e5e7eb;
      border-radius: 0.375rem;
      font-size: 0.875rem;
      font-weight: 500;
      color: #4b5563;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .action-btn:hover {
      border-color: #4a6cf7;
      color: #4a6cf7;
    }
    
    .action-btn i {
      margin-right: 0.5rem;
    }
    
    .transcript-preview {
      background-color: white;
      border-radius: 0.5rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      padding: 2rem;
      border: 1px solid #e5e7eb;
    }
    
    .transcript-header {
      text-align: center;
      margin-bottom: 2rem;
    }
    
    .transcript-header h2 {
      font-size: 1.5rem;
      font-weight: 700;
      color: #111827;
      margin-bottom: 0.5rem;
    }
    
    .transcript-header p {
      font-size: 0.875rem;
      color: #6b7280;
    }
    
    .student-info {
      margin-bottom: 2rem;
      padding-bottom: 1.5rem;
      border-bottom: 1px solid #e5e7eb;
    }
    
    .info-row {
      display: flex;
      margin-bottom: 1rem;
    }
    
    .info-item {
      flex: 1;
    }
    
    .info-item label {
      display: block;
      font-size: 0.75rem;
      font-weight: 500;
      color: #6b7280;
      margin-bottom: 0.25rem;
    }
    
    .info-item span {
      font-size: 0.875rem;
      color: #111827;
    }
    
    .transcript-section {
      margin-bottom: 2rem;
    }
    
    .transcript-section h3 {
      font-size: 1.125rem;
      font-weight: 600;
      color: #111827;
      margin-top: 0;
      margin-bottom: 1rem;
    }
    
    .transcript-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.875rem;
      margin-bottom: 1rem;
    }
    
    .transcript-table th, 
    .transcript-table td {
      padding: 0.625rem 0.75rem;
      text-align: left;
      border-bottom: 1px solid #e5e7eb;
    }
    
    .transcript-table th {
      background-color: #f9fafb;
      font-weight: 500;
      color: #4b5563;
    }
    
    .transcript-table tfoot {
      font-weight: 500;
    }
    
    .transcript-summary {
      background-color: #f9fafb;
      border-radius: 0.375rem;
      padding: 1.5rem;
    }
    
    .transcript-summary h3 {
      font-size: 1.125rem;
      font-weight: 600;
      color: #111827;
      margin-top: 0;
      margin-bottom: 1rem;
    }
    
    .summary-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.875rem;
    }
    
    .summary-table td {
      padding: 0.5rem 0;
    }
    
    .summary-table td:first-child {
      font-weight: 500;
      color: #4b5563;
    }
    
    .summary-table td:last-child {
      text-align: right;
      font-weight: 600;
      color: #111827;
    }
    
    @media (max-width: 768px) {
      .gpa-stats {
        justify-content: space-around;
        gap: 1rem;
      }
      
      .chart-placeholder {
        gap: 0.5rem;
      }
      
      .chart-bar-container {
        width: 60px;
      }
      
      .chart-term {
        font-size: 0.7rem;
        transform: rotate(-45deg);
        white-space: nowrap;
        margin-top: 1.5rem;
      }
      
      .info-row {
        flex-direction: column;
      }
      
      .info-item {
        margin-bottom: 1rem;
      }
      
      .transcript-actions {
        flex-direction: column;
      }
      
      .transcript-preview {
        padding: 1rem;
      }
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
            <a href="${pageContext.request.contextPath}/student/dashboard">
              <i class="fas fa-th-large"></i>
              <span>Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-section="profile">
            <a href="${pageContext.request.contextPath}/student/profile">
              <i class="fas fa-user"></i>
              <span>Profile</span>
            </a>
          </li>
          <li class="nav-item" data-section="registration">
            <a href="${pageContext.request.contextPath}/student/registration">
              <i class="fas fa-calendar-alt"></i>
              <span>Registration</span>
            </a>
          </li>
          <li class="nav-item" data-section="timetable">
            <a href="${pageContext.request.contextPath}/student/timetable">
              <i class="fas fa-clock"></i>
              <span>Timetable</span>
            </a>
          </li>
          <li class="nav-item active" data-section="grades">
            <a href="${pageContext.request.contextPath}/student/grades">
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
      <section id="grades-section" class="content-section active">
        <header class="dashboard-header">
          <h1>Academic Records</h1>
          <div class="date" id="currentDate"></div>
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
          
          <div class="tab-content" id="history-tab">
            <div class="term-selector">
              <label for="history-term">View Term:</label>
              <select id="history-term" class="select-control">
                <option value="all">All Terms</option>
                <option value="spring2025">Spring 2025</option>
                <option value="fall2024">Fall 2024</option>
                <option value="spring2024">Spring 2024</option>
                <option value="fall2023">Fall 2023</option>
              </select>
            </div>
            
            <div class="history-section">
              <h3>Spring 2025</h3>
              <table class="grades-table">
                <thead>
                  <tr>
                    <th>Course</th>
                    <th>Title</th>
                    <th>Credits</th>
                    <th>Grade</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>CS 136</td>
                    <td>Introduction to Web Development</td>
                    <td>3</td>
                    <td><span class="grade-a">A</span></td>
                  </tr>
                  <tr>
                    <td>CS 162</td>
                    <td>Circuit Theory</td>
                    <td>3</td>
                    <td><span class="grade-a">A-</span></td>
                  </tr>
                  <tr>
                    <td>MATH 124</td>
                    <td>Discrete Math</td>
                    <td>3</td>
                    <td><span class="grade-b">B+</span></td>
                  </tr>
                  <tr>
                    <td>CS 124</td>
                    <td>Computer Architecture</td>
                    <td>3</td>
                    <td><span class="grade-a">A-</span></td>
                  </tr>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="3">Term GPA</td>
                    <td>3.75</td>
                  </tr>
                </tfoot>
              </table>
            </div>
            
            <div class="history-section">
              <h3>Fall 2024</h3>
              <table class="grades-table">
                <thead>
                  <tr>
                    <th>Course</th>
                    <th>Title</th>
                    <th>Credits</th>
                    <th>Grade</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>CS 149</td>
                    <td>Operating Systems</td>
                    <td>3</td>
                    <td><span class="grade-a">A</span></td>
                  </tr>
                  <tr>
                    <td>CS 157A</td>
                    <td>Database Management Systems</td>
                    <td>3</td>
                    <td><span class="grade-a">A</span></td>
                  </tr>
                  <tr>
                    <td>MATH 161A</td>
                    <td>Applied Probability and Statistics</td>
                    <td>3</td>
                    <td><span class="grade-a">A-</span></td>
                  </tr>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="3">Term GPA</td>
                    <td>3.90</td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
          
          <div class="tab-content" id="transcript-tab">
            <div class="transcript-actions">
              <button class="action-btn"><i class="fas fa-download"></i> Download Unofficial Transcript</button>
              <button class="action-btn"><i class="fas fa-file-pdf"></i> Request Official Transcript</button>
            </div>
            
            <div class="transcript-preview">
              <div class="transcript-header">
                <h2>Unofficial Transcript</h2>
                <p>Generated on <span id="transcriptDate"></span></p>
              </div>
              
              <div class="student-info">
                <div class="info-row">
                  <div class="info-item">
                    <label>Name:</label>
                    <span>Student Name</span>
                  </div>
                  <div class="info-item">
                    <label>Student ID:</label>
                    <span>123456789</span>
                  </div>
                </div>
                <div class="info-row">
                  <div class="info-item">
                    <label>Major:</label>
                    <span>Computer Science</span>
                  </div>
                  <div class="info-item">
                    <label>College:</label>
                    <span>College of Engineering</span>
                  </div>
                </div>
                <div class="info-row">
                  <div class="info-item">
                    <label>Current Standing:</label>
                    <span>Junior</span>
                  </div>
                  <div class="info-item">
                    <label>Cumulative GPA:</label>
                    <span>3.82</span>
                  </div>
                </div>
              </div>
              
              <div class="transcript-section">
                <h3>Spring 2025</h3>
                <table class="transcript-table">
                  <thead>
                    <tr>
                      <th>Course</th>
                      <th>Title</th>
                      <th>Credits</th>
                      <th>Grade</th>
                      <th>Grade Points</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>CS 136</td>
                      <td>Introduction to Web Development</td>
                      <td>3</td>
                      <td>A</td>
                      <td>12.0</td>
                    </tr>
                    <tr>
                      <td>CS 162</td>
                      <td>Circuit Theory</td>
                      <td>3</td>
                      <td>A-</td>
                      <td>11.1</td>
                    </tr>
                    <tr>
                      <td>MATH 124</td>
                      <td>Discrete Math</td>
                      <td>3</td>
                      <td>B+</td>
                      <td>9.9</td>
                    </tr>
                    <tr>
                      <td>CS 124</td>
                      <td>Computer Architecture</td>
                      <td>3</td>
                      <td>A-</td>
                      <td>11.1</td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2">Term Totals</td>
                      <td>12</td>
                      <td></td>
                      <td>44.1</td>
                    </tr>
                    <tr>
                      <td colspan="4">Term GPA</td>
                      <td>3.75</td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              
              <div class="transcript-section">
                <h3>Fall 2024</h3>
                <table class="transcript-table">
                  <thead>
                    <tr>
                      <th>Course</th>
                      <th>Title</th>
                      <th>Credits</th>
                      <th>Grade</th>
                      <th>Grade Points</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>CS 149</td>
                      <td>Operating Systems</td>
                      <td>3</td>
                      <td>A</td>
                      <td>12.0</td>
                    </tr>
                    <tr>
                      <td>CS 157A</td>
                      <td>Database Management Systems</td>
                      <td>3</td>
                      <td>A</td>
                      <td>12.0</td>
                    </tr>
                    <tr>
                      <td>MATH 161A</td>
                      <td>Applied Probability and Statistics</td>
                      <td>3</td>
                      <td>A-</td>
                      <td>11.1</td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2">Term Totals</td>
                      <td>9</td>
                      <td></td>
                      <td>35.1</td>
                    </tr>
                    <tr>
                      <td colspan="4">Term GPA</td>
                      <td>3.90</td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              
              <div class="transcript-summary">
                <h3>Degree Summary</h3>
                <table class="summary-table">
                  <tr>
                    <td>Total Credits Earned:</td>
                    <td>84</td>
                  </tr>
                  <tr>
                    <td>Total Grade Points:</td>
                    <td>320.88</td>
                  </tr>
                  <tr>
                    <td>Cumulative GPA:</td>
                    <td>3.82</td>
                  </tr>
                  <tr>
                    <td>Credits Remaining for Degree:</td>
                    <td>36</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
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
      
      if (document.getElementById('transcriptDate')) {
        document.getElementById('transcriptDate').innerText = currentDate;
      }
    }
    
    document.addEventListener('DOMContentLoaded', function() {
      setCurrentDate();
      
      // Tabs functionality
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
      
      // Logout Modal Functionality
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
      
      // History term selector
      const historyTermSelect = document.getElementById('history-term');
      if (historyTermSelect) {
        historyTermSelect.addEventListener('change', function() {
          // In a real application, this would filter the displayed terms
          // For this demo, we're just showing all terms
          console.log('Term selected:', this.value);
        });
      }
    });
  </script>
</body>
</html> 