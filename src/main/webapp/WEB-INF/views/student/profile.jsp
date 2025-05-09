<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Student Profile</title>
</head>
<body>
    <div class="container">
        <h1>Student Profile</h1>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <form action="${pageContext.request.contextPath}/student/updateProfile" method="post">
            <input type="hidden" name="studentId" value="${student.id}">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" value="${student.firstName}" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" value="${student.lastName}" required>
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" value="${student.age}" required>
            </div>
            <div class="form-group">
                <label for="contactInfo">Contact Information:</label>
                <input type="text" id="contactInfo" name="contactInfo" value="${student.contactInfo}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
        <a href="${pageContext.request.contextPath}/student/enrollments">View Enrollments</a>
        <a href="${pageContext.request.contextPath}/student/grades">View Grades</a>
    </div>
</body>
</html>