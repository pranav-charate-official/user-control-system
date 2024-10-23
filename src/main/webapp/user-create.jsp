<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%--%>
<%--    session = request.getSession(false);--%>
<%--    if (session == null || session.getAttribute("user") == null) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>
<%--%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Create User</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Create User</h2>--%>
<%--<form action="create-user" method="post">--%>
<%--    <label for="username">Username:</label>--%>
<%--    <input type="text" id="username" name="username" required><br><br>--%>
<%--    <label for="password">Password:</label>--%>
<%--    <input type="password" id="password" name="password" required><br><br>--%>
<%--    <label for="email">Email:</label>--%>
<%--    <input type="email" id="email" name="email" required><br><br>--%>
<%--    <input type="submit" value="Create">--%>
<%--</form>--%>
<%--<c:if test="${not empty errorMessage}">--%>
<%--    <p style="color:red;">${errorMessage}</p>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }
        .content {
            padding: 20px;
        }
        form {
            margin: 0 auto;
            width: 50%;
            border: 3px solid #f1f1f1;
            padding: 10px;
        }
        input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        label {
            font-weight: bold;
        }
        h2 {
            text-align: center;
        }
        p.error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="logout">Logout</a>
</div>
<div class="content">
    <h2>Create User</h2>
    <form action="create-user" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        <input type="submit" value="Create">
    </form>
    <c:if test="${not empty errorMessage}">
        <p class="error">${errorMessage}</p>
    </c:if>
</div>
</body>
</html>