<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management System</title>
    <%--    <link rel="stylesheet" href="css/styles.css">--%>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            padding: 20px;
            text-align: center;
            background-color: #cbe2d9;
        }

        div#main {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px;
            height: 80%;
        }

        div#main div {

        }

        a {
            width: 200px;
            height: 200px;
            background-color: #cbe2d9;
            border-radius: 5px;
            text-align: center;
            line-height: 200px;
            text-decoration: none;
            color: black;
            font-size: 20px;
        }

    </style>
</head>
<body>
<h1>Welcome to the User Management System</h1>
<div id="main">
    <a href="login.jsp">Login</a>
    <a href="register.jsp">Register</a>
</div>
</body>
</html>