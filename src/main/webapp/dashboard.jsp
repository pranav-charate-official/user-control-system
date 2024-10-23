<%@ page import="org.example.servletdb.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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

        .user-table {
            width: 100%;
            border-collapse: collapse;
        }

        .user-table th, .user-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .user-table th {
            background-color: #f2f2f2;
            text-align: left;
        }

        .user-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .user-table tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="dashboard.jsp" class="active">Dashboard</a>
    <a href="logout">Logout</a>
</div>
<div class="content">

    <h1>Welcome, ${user.username}</h1>

    <h2>User Dashboard</h2>

    <div class="top-content">
        <form action="create-user">
            <input type="submit" value="Add User">
        </form>

        <form action="dashboard">
            <input type="text" placeholder="Enter username or email address" name="search"/>
            <input type="submit" value="Search">
        </form>
    </div>

    <table class="user-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (User user : userList) { %>
        <tr>
            <td><%= user.getId() %>
            </td>
            <td><%= user.getUsername() %>
            </td>
            <td><%= user.getEmail() %>
            </td>
            <td>

                <button><a href="edit-user?id=<%= user.getId() %>">Edit</a></button>
                <button><a href="delete-user?id=<%= user.getId() %>">Delete</a></button>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>