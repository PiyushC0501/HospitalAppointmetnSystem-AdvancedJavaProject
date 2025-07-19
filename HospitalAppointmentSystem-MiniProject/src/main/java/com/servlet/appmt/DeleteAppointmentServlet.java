package com.servlet.appmt;

import com.servlet.apptDAO.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteAppointment")
public class DeleteAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String apptIdStr = request.getParameter("apptId");
        if (apptIdStr != null) {
            int apptId = Integer.parseInt(apptIdStr);
            AppointmentDAO dao = new AppointmentDAO();
            dao.deleteById(apptId);
        }

        // Refresh the appointment list
        response.sendRedirect("fetchAppointments");
    }
}