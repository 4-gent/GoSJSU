<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Dashboard</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
  <div class="container">
    <h1>Welcome, Student ${param.studentId}</h1>
    <p>Your courses, grades, and profile go here.</p>
    <p><a href="${pageContext.request.contextPath}/">Home</a></p>
  </div>
</body>
</html> 