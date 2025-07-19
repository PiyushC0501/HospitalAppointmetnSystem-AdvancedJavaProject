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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final UserDao userDao = new UserDaoImplements();

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String hosName = request.getParameter("hosName");
        String password = request.getParameter("password");

        if (userDao.isValidUser(hosName, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("hosName", hosName);
            response.sendRedirect("dash");
        } else {
            response.sendRedirect("index.jsp?error=1");
            System.out.println("Login failed for user: " + hosName);
        }
    }
}
