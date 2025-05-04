<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Faculty Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
  <div class="container">
    <h1>Faculty Login</h1>
    <form action="${pageContext.request.contextPath}/faculty/dashboard" method="get">
      <label for="employeeId">Employee ID:</label>
      <input type="text" id="employeeId" name="employeeId" required />
      <button type="submit">Login</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/">Back to Home</a></p>
  </div>
</body>
</html> 