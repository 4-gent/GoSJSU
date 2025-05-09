<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div class="container" style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
    <div class="form-container">
      <div style="text-align: center; margin-bottom: 2rem;">
        <h1 style="color: #4a5568; position: relative; display: inline-block;">Student Portal</h1>
        <div style="width: 50px; height: 4px; background: linear-gradient(90deg, #4776E6 0%, #8E54E9 100%); 
                   margin: 0 auto; border-radius: 2px;"></div>
        <p style="color: #718096; margin-top: 1rem;">Enter your credentials to access your account</p>
      </div>

      <form id="studentLoginForm" action="${pageContext.request.contextPath}/login" method="post">
        <input type="hidden" name="role" value="student">
        <div class="input-group">
            <label for="studentId"><i class="fas fa-id-card"></i> Student ID</label>
            <input type="text" id="studentId" name="username" placeholder="Enter your student ID" required />
        </div>
        <div class="input-group">
            <label for="password"><i class="fas fa-lock"></i> Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required />
        </div>
        
        <!-- Alert message for invalid credentials -->
        <div id="invalidCredentials" style="color: #e53e3e; margin-top: 10px; display: none;">
          <i class="fas fa-exclamation-circle"></i> Invalid credentials. Please try again.
        </div>
        
        <button type="submit" class="submit-btn">
          <i class="fas fa-sign-in-alt"></i> Login
        </button>
      </form>
      <div style="text-align: center; margin-top: 2rem;">
        <a href="${pageContext.request.contextPath}/" style="color: #4776E6; text-decoration: none; 
                font-weight: 500; transition: all 0.2s;">
          <i class="fas fa-arrow-left"></i> Back to Home
        </a>
      </div>
    </div>
  </div>
</body>
</html> 