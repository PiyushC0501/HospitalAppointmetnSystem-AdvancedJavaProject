package com.servlet.registerappointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.conn.util.DButil;

import static java.lang.System.out;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String INSERT_QUERY="INSERT INTO appmts(hosName, userid, firstname, lastname, age, gender, email, phNo, address, day, timeslot, query) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();

        res.setContentType("text/html");

        String hosName = req.getParameter("hosName");
        String userid = req.getParameter("userid");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String age = req.getParameter("age");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phNo = req.getParameter("phNo");
        String address = req.getParameter("address");
        String day = req.getParameter("day");
        String timeslot = req.getParameter("timeslot");
        String query = req.getParameter("query");

        //load the JDBC DRIVER
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //Creating the connection
        try(Connection con = DButil.getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT_QUERY)){

            ps.setString(1, hosName);
            ps.setString(2, userid);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setInt(5, Integer.parseInt(age));
            ps.setString(6, gender);
            ps.setString(7, email);
            ps.setString(8, phNo);
            ps.setString(9, address);
            ps.setString(10, day);
            ps.setString(11, timeslot);
            ps.setString(12, query);

            int rowsInserted = ps.executeUpdate();

            // Respond to user
            if (rowsInserted > 0) {
                // Successful booking, redirect to success page or show success message
                res.sendRedirect("success.jsp");  // Redirect to success page (you can create this)
            } else {
                // Failed to book appointment
                res.sendRedirect("failure.jsp");  // Redirect to failure page (you can create this)
            }

        }catch(Exception e) {
            out.println(e.toString());
        }

        pw.close();
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }

}