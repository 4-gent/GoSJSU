<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Student Report</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Student Report</h1>
        <c:if test="${not empty student}">
            <h2>Report for: ${student.name}</h2>
            <table>
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${student.courses}">
                        <tr>
                            <td>${course.id}</td>
                            <td>${course.name}</td>
                            <td>${course.grade}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
                <a href="${pageContext.request.contextPath}/report/export?studentId=${student.id}&format=pdf">Export as PDF</a>
                <a href="${pageContext.request.contextPath}/report/export?studentId=${student.id}&format=csv">Export as CSV</a>
            </div>
        </c:if>
        <c:if test="${empty student}">
            <p>No report available for the selected student.</p>
        </c:if>
        <a href="${pageContext.request.contextPath}/student/dashboard">Back to Dashboard</a>
    </div>
</body>
</html>