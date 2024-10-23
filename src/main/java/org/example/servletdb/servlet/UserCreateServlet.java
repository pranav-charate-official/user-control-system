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

@WebServlet("/create-user")
public class UserCreateServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user-create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!request.getRequestURI().endsWith("/register")) {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);

        try {
            userDao.addUser(newUser);
            if (request.getRequestURI().endsWith("/register")) {
                response.sendRedirect("login.jsp");
            } else {
                List<User> userList = userDao.getAllUsers();
                request.setAttribute("userList", userList);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}