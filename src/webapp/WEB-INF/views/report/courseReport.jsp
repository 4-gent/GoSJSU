<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Course Report</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Course Report</h1>
        <c:if test="${not empty reportData}">
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="record" items="${reportData}">
                        <tr>
                            <td>${record.studentId}</td>
                            <td>${record.studentName}</td>
                            <td>${record.grade}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty reportData}">
            <p>No data available for this course.</p>
        </c:if>
        <a href="${pageContext.request.contextPath}/report/generate?courseId=${courseId}" class="btn">Generate Report</a>
    </div>
</body>
</html>