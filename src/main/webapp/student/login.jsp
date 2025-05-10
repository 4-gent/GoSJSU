<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Login | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #4a6cf7 0%, #6a3ef7 100%);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }
    
    .login-container {
      display: flex;
      width: 900px;
      max-width: 95%;
      background: white;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }
    
    .login-image {
      flex: 1;
      background-image: url('https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
      background-size: cover;
      background-position: center;
      position: relative;
      display: flex;
      align-items: flex-end;
    }
    
    .login-image-overlay {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(0deg, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.3) 50%, rgba(0,0,0,0) 100%);
    }
    
    .school-info {
      color: white;
      padding: 30px;
      position: relative;
      z-index: 1;
    }
    
    .school-name {
      font-size: 1.8rem;
      font-weight: 700;
      margin-bottom: 5px;
    }
    
    .school-tagline {
      font-size: 1rem;
      font-weight: 300;
      opacity: 0.8;
    }
    
    .form-side {
      flex: 1;
      padding: 50px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    
    .login-header {
      margin-bottom: 40px;
      text-align: center;
    }
    
    .logo-container {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 15px;
    }
    
    .logo-icon {
      position: relative;
      width: 40px;
      height: 40px;
      margin-right: 10px;
    }
    
    .logo-square {
      position: absolute;
      width: 20px;
      height: 20px;
    }
    
    .logo-square.light {
      background-color: #4a6cf7;
      top: 0;
      left: 0;
    }
    
    .logo-square.dark {
      background-color: #6a3ef7;
      bottom: 0;
      right: 0;
    }
    
    .login-title {
      font-size: 1.8rem;
      font-weight: 700;
      color: #333;
      margin: 0;
    }
    
    .login-subtitle {
      font-size: 0.9rem;
      color: #666;
      margin-top: 5px;
    }
    
    .input-group {
      margin-bottom: 25px;
    }
    
    .input-group label {
      display: block;
      font-size: 0.9rem;
      font-weight: 500;
      color: #555;
      margin-bottom: 8px;
    }
    
    .input-group input {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 1rem;
      transition: all 0.3s;
    }
    
    .input-group input:focus {
      border-color: #4a6cf7;
      box-shadow: 0 0 0 2px rgba(74, 108, 247, 0.1);
      outline: none;
    }
    
    .input-group input::placeholder {
      color: #aaa;
    }
    
    .remember-forgot {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
      font-size: 0.9rem;
    }
    
    .remember-me {
      display: flex;
      align-items: center;
    }
    
    .remember-me input {
      margin-right: 8px;
    }
    
    .forgot-password {
      color: #4a6cf7;
      text-decoration: none;
      transition: color 0.2s;
    }
    
    .forgot-password:hover {
      color: #3854c6;
      text-decoration: underline;
    }
    
    .submit-btn {
      background: linear-gradient(135deg, #4a6cf7 0%, #6a3ef7 100%);
      color: white;
      border: none;
      border-radius: 6px;
      padding: 14px;
      font-size: 1rem;
      font-weight: 500;
      width: 100%;
      cursor: pointer;
      transition: all 0.3s;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    .submit-btn i {
      margin-right: 8px;
    }
    
    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(74, 108, 247, 0.2);
    }
    
    .back-to-home {
      text-align: center;
      margin-top: 30px;
    }
    
    .back-link {
      color: #666;
      text-decoration: none;
      font-size: 0.9rem;
      display: inline-flex;
      align-items: center;
      transition: color 0.2s;
    }
    
    .back-link i {
      margin-right: 6px;
      font-size: 0.8rem;
    }
    
    .back-link:hover {
      color: #4a6cf7;
    }
    
    .alert-error {
      background-color: #fee2e2;
      color: #ef4444;
      padding: 10px 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
      font-size: 0.9rem;
    }
    
    .alert-error i {
      margin-right: 8px;
    }
    
    /* Responsive layout */
    @media (max-width: 768px) {
      .login-container {
        flex-direction: column;
        max-width: 90%;
      }
      
      .login-image {
        display: none;
      }
      
      .form-side {
        padding: 40px 30px;
      }
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="login-image">
      <div class="login-image-overlay"></div>
      <div class="school-info">
        <div class="school-name">San Jose State University</div>
        <div class="school-tagline">Powering Silicon Valley</div>
      </div>
    </div>
    
    <div class="form-side">
      <div class="login-header">
        <div class="logo-container">
          <div class="logo-icon">
            <div class="logo-square light"></div>
            <div class="logo-square dark"></div>
          </div>
          <h1 class="login-title">goSJSU</h1>
        </div>
        <p class="login-subtitle">Student Portal Login</p>
      </div>
      
      <% if (request.getParameter("error") != null) { %>
      <div class="alert-error">
        <i class="fas fa-exclamation-circle"></i> 
        Invalid credentials. Please try again.
      </div>
      <% } %>

      <form id="studentLoginForm" action="${pageContext.request.contextPath}/login" method="post">
        <input type="hidden" name="role" value="student">
        
        <div class="input-group">
          <label for="studentId">Student ID</label>
          <input 
            type="text" 
            id="studentId" 
            name="username" 
            placeholder="Enter your student ID" 
            required
            autocomplete="username" 
          />
        </div>
        
        <div class="input-group">
          <label for="password">Password</label>
          <input 
            type="password" 
            id="password" 
            name="password" 
            placeholder="Enter your password" 
            required
            autocomplete="current-password" 
          />
        </div>
        
        <div class="remember-forgot">
          <div class="remember-me">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Remember me</label>
          </div>
          <a href="#" class="forgot-password">Forgot password?</a>
        </div>
        
        <button type="submit" class="submit-btn">
          <i class="fas fa-sign-in-alt"></i> Login
        </button>
      </form>
      
      <div class="back-to-home">
        <a href="${pageContext.request.contextPath}/" class="back-link">
          <i class="fas fa-arrow-left"></i> Back to Homepage
        </a>
      </div>
    </div>
  </div>
</body>
</html> 