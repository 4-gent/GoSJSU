<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to goSJSU</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modern-dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #4338ca, #ec4899);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
        }
        
        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 2rem;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }
        
        .logo-icon {
            position: relative;
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }
        
        .logo-square {
            position: absolute;
            width: 25px;
            height: 25px;
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
        
        .login-form {
            display: flex;
            flex-direction: column;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: #4b5563;
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #e5e7eb;
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: border-color 0.15s ease-in-out;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #4a6cf7;
            box-shadow: 0 0 0 3px rgba(74, 108, 247, 0.1);
        }
        
        .login-btn {
            background-color: #4a6cf7;
            color: white;
            border: none;
            padding: 0.75rem 1rem;
            border-radius: 0.375rem;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.15s ease-in-out;
        }
        
        .login-btn:hover {
            background-color: #3c5ae0;
        }
        
        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
            font-size: 0.875rem;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 0.5rem;
        }
        
        .forgot-password {
            color: #4a6cf7;
            text-decoration: none;
        }
        
        .forgot-password:hover {
            text-decoration: underline;
        }
        
        .login-footer {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.875rem;
            color: #6b7280;
        }
        
        .user-type-toggle {
            display: flex;
            margin-bottom: 1.5rem;
            background-color: #f3f4f6;
            border-radius: 0.375rem;
            padding: 0.25rem;
        }
        
        .user-type-option {
            flex: 1;
            text-align: center;
            padding: 0.75rem 0;
            cursor: pointer;
            border-radius: 0.25rem;
            font-weight: 500;
            color: #4b5563;
            transition: background-color 0.15s ease-in-out, color 0.15s ease-in-out;
        }
        
        .user-type-option.active {
            background-color: #4a6cf7;
            color: white;
        }
        
        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo">
                <div class="logo-icon">
                    <div class="logo-square light"></div>
                    <div class="logo-square dark"></div>
                </div>
                <h1>goSJSU</h1>
            </div>
            <p>San Jose State University Student Portal</p>
        </div>
        
        <div class="user-type-toggle">
            <div class="user-type-option active" id="studentLogin">Student</div>
            <div class="user-type-option" id="facultyLogin">Faculty</div>
        </div>
        
        <form class="login-form" id="loginForm" action="${pageContext.request.contextPath}/student/dashboard" method="get">
            <div class="form-group">
                <label for="studentId">Student ID</label>
                <input type="text" class="form-control" id="studentId" name="studentId" placeholder="Enter your student ID" value="123456789" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
                <div class="error-message" id="loginError">Invalid credentials. Use Student ID: 123456789 and Password: sjsu</div>
            </div>
            
            <div class="login-options">
                <div class="remember-me">
                    <input type="checkbox" id="rememberMe">
                    <label for="rememberMe">Remember me</label>
                </div>
                <a href="#" class="forgot-password">Forgot password?</a>
            </div>
            
            <button type="submit" class="login-btn">Log In</button>
        </form>
        
        <div class="login-footer">
            <p>&copy; 2025 San Jose State University. All rights reserved.</p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const studentLogin = document.getElementById('studentLogin');
            const facultyLogin = document.getElementById('facultyLogin');
            const loginForm = document.getElementById('loginForm');
            const studentIdLabel = document.querySelector('label[for="studentId"]');
            const studentIdInput = document.getElementById('studentId');
            const loginError = document.getElementById('loginError');
            
            // Toggle between student and faculty login
            studentLogin.addEventListener('click', function() {
                studentLogin.classList.add('active');
                facultyLogin.classList.remove('active');
                studentIdLabel.textContent = 'Student ID';
                studentIdInput.placeholder = 'Enter your student ID';
                studentIdInput.value = '123456789'; // Default student ID
                loginForm.action = '${pageContext.request.contextPath}/student/dashboard';
                loginError.textContent = 'Invalid credentials. Use Student ID: 123456789 and Password: sjsu';
            });
            
            facultyLogin.addEventListener('click', function() {
                facultyLogin.classList.add('active');
                studentLogin.classList.remove('active');
                studentIdLabel.textContent = 'Faculty ID';
                studentIdInput.placeholder = 'Enter your faculty ID';
                studentIdInput.value = '987654321'; // Default faculty ID
                loginForm.action = '${pageContext.request.contextPath}/faculty/dashboard';
                loginError.textContent = 'Invalid credentials. Use Faculty ID: 987654321 and Password: sjsu';
            });
            
            // For demo purposes - validate password
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault(); // Always prevent default form submission
                const password = document.getElementById('password').value;
                const userId = document.getElementById('studentId').value;
                const isFacultyActive = facultyLogin.classList.contains('active');
                
                console.log("Login attempt: User ID=" + userId + ", Faculty mode=" + isFacultyActive);
                
                // TEMPORARY HARDCODED SOLUTION FOR DEMO
                if (password === "sjsu") {
                    if (isFacultyActive) {
                        // Faculty login - direct navigation to dashboard (skip /faculty/)
                        if (userId === "987654321") {
                            console.log("Faculty login successful, redirecting to dashboard...");
                            // IMPORTANT: Direct to dashboard to avoid redirect loop
                            window.location.href = "${pageContext.request.contextPath}/faculty/dashboard?facultyId=" + userId;
                            return;
                        }
                    } else {
                        // Student login - direct navigation
                        if (userId === "123456789") {
                            console.log("Student login successful, redirecting...");
                            window.location.href = "${pageContext.request.contextPath}/student/dashboard?studentId=" + userId;
                            return;
                        }
                    }
                }
                
                // Show error message
                console.log("Login failed, showing error");
                loginError.style.display = 'block';
            });
        });
    </script>
</body>
</html>