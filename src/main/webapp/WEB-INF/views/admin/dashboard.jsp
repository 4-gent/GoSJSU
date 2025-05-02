<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Admin Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/crud.jsp">Manage Records</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <section>
                <h2>Welcome, Admin!</h2>
                <p>Use the navigation above to manage students, courses, and faculty records.</p>
            </section>
            <section>
                <h3>Statistics</h3>
                <ul>
                    <li>Total Students: <span id="totalStudents">0</span></li>
                    <li>Total Courses: <span id="totalCourses">0</span></li>
                    <li>Total Faculty: <span id="totalFaculty">0</span></li>
                </ul>
            </section>
        </main>
        <footer>
            <p>&copy; 2025 GoSJSU. All rights reserved.</p>
        </footer>
    </div>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>