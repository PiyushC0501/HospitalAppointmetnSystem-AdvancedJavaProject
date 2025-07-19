package com.servlet.fetchAppointment;

import com.servlet.apptDAO.AppointmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateStatus")
public class UpdateStatusServlet extends HttpServlet {

    private AppointmentDAO dao = new AppointmentDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String newStatus = request.getParameter("status");

        try {
            dao.updateAppointmentStatus(id, newStatus);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        // Redirect to dashboard (Post-Redirect-Get pattern)
        response.sendRedirect("dash");
    }
}

