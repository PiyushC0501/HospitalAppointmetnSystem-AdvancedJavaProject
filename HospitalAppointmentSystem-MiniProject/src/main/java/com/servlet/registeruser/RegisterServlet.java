package com.servlet.registeruser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.conn.util.DButil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String INSERT_QUERY="INSERT INTO users(username,email,password) VALUES (?,?,?);";

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();

        res.setContentType("text/html");

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        //load the JDBC DRIVER
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //Creating the connection
        try(Connection con = DButil.getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT_QUERY)){

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            int count = ps.executeUpdate();

            if (count == 0) {
                res.sendRedirect("login.jsp?msg=User not Registered");
            } else {
                res.sendRedirect("login.jsp?msg=User Registered Successfully");
            }
        }catch(Exception e) {
            System.out.println(e.toString());
        }

        pw.close();
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }

}