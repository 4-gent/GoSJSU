<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Student Grades</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Your Grades</h1>
        <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Grade</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="grade" items="${grades}">
                    <tr>
                        <td>${grade.courseId}</td>
                        <td>${grade.courseName}</td>
                        <td>${grade.gradeValue}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty grades}">
            <p>No grades available.</p>
        </c:if>
        <a href="${pageContext.request.contextPath}/student/profile.jsp">Back to Profile</a>
    </div>
</body>
</html>