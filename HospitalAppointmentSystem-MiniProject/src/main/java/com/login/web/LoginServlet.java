package com.login.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.login.dao.UserDao;
import com.login.dao.UserDaoImplements;
import com.login.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final UserDao userDao = new UserDaoImplements();

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDao.getUserByCredentials(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", String.valueOf(user.getId()));
            session.setAttribute("username", user.getUsername());
            session.setAttribute("email", user.getEmail());
            response.sendRedirect("dash.jsp");
        } else {
            response.sendRedirect("dash.jsp?error=1");
            System.out.println("Login failed for user: " + username);
        }
    }
}
