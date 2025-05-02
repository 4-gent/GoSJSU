<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Faculty Dashboard</title>
</head>
<body>
    <header>
        <h1>Welcome to the Faculty Dashboard</h1>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/faculty/manage.jsp">Manage Enrollments & Grades</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Your Courses</h2>
            <table>
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Enrolled Students</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${facultyCourses}">
                        <tr>
                            <td>${course.id}</td>
                            <td>${course.name}</td>
                            <td>${course.enrolledStudentsCount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <section>
            <h2>Recent Activities</h2>
            <ul>
                <c:forEach var="activity" items="${recentActivities}">
                    <li>${activity.description} - ${activity.timestamp}</li>
                </c:forEach>
            </ul>
        </section>
    </main>
    <footer>
        <p>&copy; 2025 GoSJSU. All rights reserved.</p>
    </footer>
</body>
</html>