<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Manage Students</title>
</head>
<body>
    <div class="container">
        <h1>Manage Students</h1>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <form action="${pageContext.request.contextPath}/faculty/manage" method="post">
            <label for="studentId">Student ID:</label>
            <input type="text" id="studentId" name="studentId" required>
            <button type="submit">Search</button>
        </form>

        <c:if test="${not empty student}">
            <h2>Student Details</h2>
            <p>ID: ${student.id}</p>
            <p>Name: ${student.name}</p>
            <p>Enrolled Courses:</p>
            <ul>
                <c:forEach var="course" items="${student.courses}">
                    <li>${course.name} - ${course.grade}</li>
                </c:forEach>
            </ul>
            <form action="${pageContext.request.contextPath}/faculty/manage/grades" method="post">
                <input type="hidden" name="studentId" value="${student.id}">
                <label for="grade">Assign/Modify Grade:</label>
                <input type="text" id="grade" name="grade" required>
                <button type="submit">Submit Grade</button>
            </form>
        </c:if>
    </div>
</body>
</html>