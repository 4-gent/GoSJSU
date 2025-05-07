<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Admin CRUD Operations</title>
</head>
<body>
    <div class="container">
        <h1>Admin CRUD Operations</h1>
        <nav>
            <ul>
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="crud.jsp">Manage Records</a></li>
            </ul>
        </nav>
        
        <h2>Manage Students</h2>
        <form action="${pageContext.request.contextPath}/admin/createStudent" method="post">
            <input type="text" name="studentId" placeholder="Student ID" required>
            <input type="text" name="firstName" placeholder="First Name" required>
            <input type="text" name="lastName" placeholder="Last Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <button type="submit">Create Student</button>
        </form>

        <h2>Update Student</h2>
        <form action="${pageContext.request.contextPath}/admin/updateStudent" method="post">
            <input type="text" name="studentId" placeholder="Student ID" required>
            <input type="text" name="firstName" placeholder="First Name">
            <input type="text" name="lastName" placeholder="Last Name">
            <input type="email" name="email" placeholder="Email">
            <button type="submit">Update Student</button>
        </form>

        <h2>Delete Student</h2>
        <form action="${pageContext.request.contextPath}/admin/deleteStudent" method="post">
            <input type="text" name="studentId" placeholder="Student ID" required>
            <button type="submit">Delete Student</button>
        </form>

        <h2>View Students</h2>
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>