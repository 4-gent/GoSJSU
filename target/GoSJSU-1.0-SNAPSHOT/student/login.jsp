<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
  <div class="container">
    <h1>Student Login</h1>
    <form action="${pageContext.request.contextPath}/student/dashboard" method="get">
      <label for="studentId">Student ID:</label>
      <input type="text" id="studentId" name="studentId" required />
      <button type="submit">Login</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/">Back to Home</a></p>
  </div>
</body>
</html> 