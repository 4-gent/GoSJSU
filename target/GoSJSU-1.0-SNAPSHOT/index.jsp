<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - GoSJSU</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
  <div class="landing-container">
    <header class="landing-header">
      <h1>Welcome to GoSJSU</h1>
      <p>Your streamlined student management system</p>
    </header>
    <main class="landing-main">
      <section class="card student-portal">
        <h2>Student Portal</h2>
        <p>Access your academic records, course schedules, and grade reports all in one place.</p>
        <a class="btn" href="${pageContext.request.contextPath}/student/login.jsp">Go to Student Portal</a>
      </section>
      <section class="card faculty-dashboard">
        <h2>Faculty Dashboard</h2>
        <p>Manage courses, student enrollments, and grade submissions efficiently.</p>
        <a class="btn" href="${pageContext.request.contextPath}/faculty/login.jsp">Go to Faculty Dashboard</a>
      </section>
    </main>
  </div>
</body>
</html>