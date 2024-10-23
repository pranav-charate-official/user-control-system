package org.example.servletdb.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.servletdb.dao.UserDao;
import org.example.servletdb.model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/delete-user")
public class UserDeleteServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int userId = Integer.parseInt(request.getParameter("id"));
        try {
            userDao.deleteUser(userId);
            List<User> userList = userDao.getAllUsers();
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}