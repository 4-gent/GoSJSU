<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Faculty Dashboard</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
  <div class="container">
    <h1>Welcome, Faculty ${param.employeeId}</h1>
    <p>Course management and grading tools go here.</p>
    <p><a href="${pageContext.request.contextPath}/">Home</a></p>
  </div>
</body>
</html> 