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
            text-align: center;
        }

        .login-header {
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
            width: 100%;
            margin-bottom: 1rem;
        }

        .login-btn:hover {
            background-color: #3c5ae0;
        }

        .login-footer {
            margin-top: 2rem;
            font-size: 0.875rem;
            color: #6b7280;
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
            <p>San Jose State University Portal</p>
        </div>

        <!-- Buttons for Student and Faculty Login -->
        <a href="${pageContext.request.contextPath}/student/login.jsp" class="login-btn">Student Login</a>
        <a href="${pageContext.request.contextPath}/faculty/login.jsp" class="login-btn">Faculty Login</a>

        <div class="login-footer">
            <p>&copy; 2025 San Jose State University. All rights reserved.</p>
        </div>
    </div>
</body>
</html>