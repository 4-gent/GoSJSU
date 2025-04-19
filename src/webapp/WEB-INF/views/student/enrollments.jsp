<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Enrollments</title>
</head>
<body>
    <div class="container">
        <h1>Your Enrolled Courses</h1>
        <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Instructor</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${enrolledCourses}">
                    <tr>
                        <td>${course.id}</td>
                        <td>${course.name}</td>
                        <td>${course.instructor}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/student/dropCourse" method="post">
                                <input type="hidden" name="courseId" value="${course.id}">
                                <input type="submit" value="Drop">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/student/profile.jsp">Back to Profile</a>
    </div>
</body>
</html>