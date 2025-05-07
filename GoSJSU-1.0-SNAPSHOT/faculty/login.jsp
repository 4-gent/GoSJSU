<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty Login | goSJSU</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    .login-container {
      display: flex;
      min-height: 100vh;
      background-color: var(--bg);
      overflow: hidden;
    }
    
    .login-left {
      flex: 1;
      background-color: var(--primary);
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 2rem;
      color: white;
    }
    
    .login-right {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 2rem;
    }
    
    .login-logo {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      margin-bottom: 2rem;
    }
    
    .login-logo-icon {
      display: flex;
      gap: 0.25rem;
    }
    
    .login-logo-square {
      width: 24px;
      height: 24px;
      border-radius: 4px;
    }
    
    .login-logo-square.light {
      background-color: white;
    }
    
    .login-logo-square.dark {
      background-color: rgba(255, 255, 255, 0.5);
    }
    
    .login-logo h1 {
      font-size: 2rem;
      font-weight: 700;
    }
    
    .login-illustration {
      width: 80%;
      max-width: 400px;
      margin-bottom: 2rem;
    }
    
    .login-tagline {
      font-size: 1.5rem;
      font-weight: 600;
      text-align: center;
      margin-bottom: 1rem;
    }
    
    .login-subtitle {
      font-size: 1.1rem;
      text-align: center;
      opacity: 0.8;
    }
    
    .login-form-container {
      width: 100%;
      max-width: 400px;
    }
    
    .login-form-header {
      margin-bottom: 2rem;
      text-align: center;
    }
    
    .login-form-header h2 {
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--text-primary);
      margin-bottom: 0.5rem;
    }
    
    .login-form-header p {
      color: var(--text-secondary);
      font-size: 1rem;
    }
    
    .login-form {
      width: 100%;
    }
    
    .form-group {
      margin-bottom: 1.5rem;
    }
    
    .form-label {
      display: block;
      margin-bottom: 0.5rem;
      font-size: 0.95rem;
      font-weight: 500;
      color: var(--text-primary);
    }
    
    .form-input {
      width: 100%;
      padding: 0.85rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 1rem;
      transition: all 0.2s ease;
    }
    
    .form-input:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
    }
    
    .form-input::placeholder {
      color: var(--text-tertiary);
    }
    
    .form-input-icon {
      position: relative;
    }
    
    .form-input-icon i {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      left: 1rem;
      color: var(--text-tertiary);
    }
    
    .form-input-icon input {
      padding-left: 2.75rem;
    }
    
    .form-options {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
      font-size: 0.95rem;
    }
    
    .form-checkbox {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .form-checkbox input {
      width: 16px;
      height: 16px;
    }
    
    .form-link {
      color: var(--primary);
      text-decoration: none;
      transition: color 0.2s ease;
    }
    
    .form-link:hover {
      color: var(--primary-dark);
      text-decoration: underline;
    }
    
    .login-btn {
      width: 100%;
      padding: 0.85rem;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: var(--radius);
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .login-btn:hover {
      background-color: var(--primary-dark);
    }
    
    .login-divider {
      display: flex;
      align-items: center;
      margin: 1.5rem 0;
      color: var(--text-tertiary);
      font-size: 0.95rem;
    }
    
    .login-divider::before,
    .login-divider::after {
      content: "";
      flex: 1;
      height: 1px;
      background-color: var(--border);
    }
    
    .login-divider::before {
      margin-right: 1rem;
    }
    
    .login-divider::after {
      margin-left: 1rem;
    }
    
    .alternate-login {
      display: flex;
      justify-content: center;
      margin-bottom: 1.5rem;
    }
    
    .alternate-login-btn {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      width: 100%;
      padding: 0.85rem;
      background-color: white;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .alternate-login-btn:hover {
      background-color: var(--surface-hover);
    }
    
    .register-prompt {
      text-align: center;
      font-size: 0.95rem;
      color: var(--text-secondary);
    }
    
    /* Faculty login specific styles */
    .faculty-section-title {
      position: absolute;
      top: 2rem;
      right: 2rem;
      display: inline-block;
      background-color: rgba(255, 255, 255, 0.15);
      color: white;
      padding: 0.5rem 1rem;
      border-radius: var(--radius);
      font-weight: 600;
    }
    
    @media (max-width: 992px) {
      .login-container {
        flex-direction: column;
      }
      
      .login-left {
        padding: 3rem 1.5rem;
      }
      
      .login-right {
        padding: 3rem 1.5rem;
      }
      
      .faculty-section-title {
        top: 1rem;
        right: 1rem;
      }
    }
  </style>
</head>
<body>
  <div class="login-container">
    <!-- Left Side -->
    <div class="login-left">
      <span class="faculty-section-title">Faculty Portal</span>
      <div class="login-logo">
        <div class="login-logo-icon">
          <div class="login-logo-square light"></div>
          <div class="login-logo-square dark"></div>
        </div>
        <h1>goSJSU</h1>
      </div>
      <div class="login-tagline">Your Teaching Hub at San Jose State University</div>
      <div class="login-subtitle">Access course management, grading tools, and student information in one place.</div>
    </div>
    
    <!-- Right Side -->
    <div class="login-right">
      <div class="login-form-container">
        <div class="login-form-header">
          <h2>Faculty Login</h2>
          <p>Enter your credentials to access your dashboard</p>
        </div>
        
        <form id="facultyLoginForm" class="login-form">
          <div class="form-group">
            <label for="facultyId" class="form-label">Faculty ID</label>
            <div class="form-input-icon">
              <i class="fas fa-id-card"></i>
              <input type="text" id="facultyId" name="facultyId" class="form-input" placeholder="Enter your faculty ID" value="987654321">
            </div>
          </div>
          
          <div class="form-group">
            <label for="password" class="form-label">Password</label>
            <div class="form-input-icon">
              <i class="fas fa-lock"></i>
              <input type="password" id="password" name="password" class="form-input" placeholder="Enter your password" value="sjsu">
            </div>
          </div>
          
          <div class="form-options">
            <div class="form-checkbox">
              <input type="checkbox" id="rememberMe" name="rememberMe" checked>
              <label for="rememberMe">Remember me</label>
            </div>
            <a href="#" class="form-link">Forgot password?</a>
          </div>
          
          <button type="submit" class="login-btn">Login</button>
          
          <div class="login-divider">or</div>
          
          <div class="alternate-login">
            <button type="button" class="alternate-login-btn">
              <i class="fas fa-shield-alt"></i>
              <span>Login with SSO</span>
            </button>
          </div>
          
          <div class="register-prompt">
            Need IT support? <a href="#" class="form-link">Contact Help Desk</a>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const facultyLoginForm = document.getElementById('facultyLoginForm');
      
      facultyLoginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const facultyId = document.getElementById('facultyId').value;
        const password = document.getElementById('password').value;
        
        // Simple validation
        if (!facultyId || !password) {
          alert('Please enter both faculty ID and password.');
          return;
        }
        
        // Check credentials (in a real app, this would be done server-side)
        if (facultyId === '987654321' && password === 'sjsu') {
          // Successful login - redirect to dashboard
          window.location.href = '${pageContext.request.contextPath}/faculty/dashboard?facultyId=' + facultyId;
        } else {
          alert('Invalid credentials. Please try again.');
        }
      });
    });
  </script>
</body>
</html> 