<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - GoSJSU</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .logo-icon {
            font-size: 3rem;
            background: linear-gradient(90deg, #4776E6 0%, #8E54E9 100%);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 0.5rem;
        }
        .card-icon {
            font-size: 3rem;
            background: linear-gradient(90deg, #4776E6 0%, #8E54E9 100%);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
  <div class="landing-container">
    <header class="landing-header">
      <div class="logo-icon">
        <i class="fas fa-university"></i>
      </div>
      <h1>Welcome to GoSJSU</h1>
      <p>Your streamlined student management system</p>
    </header>
    <main class="landing-main">
      <section class="card student-portal">
        <div class="card-icon">
          <i class="fas fa-user-graduate"></i>
        </div>
        <h2>Student Portal</h2>
        <p>Access your academic records, course schedules, and grade reports all in one place. Track your progress and plan your academic journey efficiently.</p>
        <a class="btn" href="${pageContext.request.contextPath}/student/login.jsp">Go to Student Portal</a>
      </section>
      <section class="card faculty-dashboard">
        <div class="card-icon">
          <i class="fas fa-chalkboard-teacher"></i>
        </div>
        <h2>Faculty Dashboard</h2>
        <p>Manage courses, student enrollments, and grade submissions efficiently. Access teaching resources and communicate with students seamlessly.</p>
        <a class="btn" href="${pageContext.request.contextPath}/faculty/login.jsp">Go to Faculty Dashboard</a>
      </section>
    </main>
    <footer style="margin-top: 3rem; text-align: center; color: #718096;">
      <p>&copy; 2025 GoSJSU - San Jose State University</p>
    </footer>
  </div>
</body>
</html>