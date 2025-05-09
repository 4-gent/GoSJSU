<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gosjsu.shared.StudentGradeDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Grades | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
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
                <a href="${pageContext.request.contextPath}/faculty/dashboard">
                  <i class="fas fa-th-large"></i>
                  <span>Dashboard</span>
                </a>
              </li>
              <li class="nav-item" data-section="courses">
                <a href="${pageContext.request.contextPath}/faculty/courses">
                  <i class="fas fa-book"></i>
                  <span>My Courses</span>
                </a>
              </li>
              <li class="nav-item" data-section="students">
                <a href="${pageContext.request.contextPath}/faculty/rosters">
                  <i class="fas fa-user-graduate"></i>
                  <span>Students</span>
                </a>
              </li>
              <li class="nav-item active" data-section="grades">
                <a href="${pageContext.request.contextPath}/faculty/grades">
                  <i class="fas fa-chart-bar"></i>
                  <span>Grades</span>
                </a>
              </li>
              <li class="nav-item" data-section="reports">
                <a href="${pageContext.request.contextPath}/faculty/reports">
                  <i class="fas fa-file-alt"></i>
                  <span>Reports</span>
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
    <main class="main-content">
      <!-- Header -->
      <header class="dashboard-header">
        <h1>Manage Grades for Course: ${requestScope.courseId}</h1>
      </header>

      <!-- Grades Table -->
      <div class="grades-container">
        <div class="grades-table-container">
          <table class="grades-table">
            <thead>
              <tr>
                <th>Student ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Grade</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
              <c:forEach var="grade" items="${grades}">
                  <tr>
                      <td>${grade.studentId}</td>
                      <td>${grade.firstName}</td>
                      <td>${grade.lastName}</td>
                      <td>${grade.grade}</td>
                      <td>
                          <!-- Modify Grade Form -->
                          <form action="${pageContext.request.contextPath}/faculty/grades" method="post">
                              <input type="hidden" name="action" value="modifyGrade">
                              <input type="hidden" name="studentId" value="${grade.studentId}">
                              <input type="hidden" name="courseId" value="${courseId}">
                              <input type="text" name="grade" value="${grade.grade}">
                              <button type="submit">Update</button>
                          </form>
                      </td>
                  </tr>
              </c:forEach>
          </tbody>
          </table>

          <!-- Assign Grade Form -->
          <h2>Assign Grade</h2>
          <form action="${pageContext.request.contextPath}/faculty/grades" method="post">
              <input type="hidden" name="action" value="assignGrade">
              <input type="hidden" name="courseId" value="${courseId}">
              <label for="studentId">Student ID:</label>
              <input type="text" name="studentId" id="studentId" required>
              <label for="grade">Grade:</label>
              <input type="text" name="grade" id="grade" required>
              <button type="submit">Assign</button>
          </form>
        </div>
      </div>
    </main>
  </div>
</body>
</html>