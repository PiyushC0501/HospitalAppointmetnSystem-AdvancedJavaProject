package com.servlet.appmt;


import com.servlet.apptDAO.AppointmentDAO;
import com.servlet.appModel.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/fetchAppointments")
public class FetchAppointmentsServlet extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("userId") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String userId = (String) session.getAttribute("userId");

            AppointmentDAO dao = new AppointmentDAO();
            List<Appointment> appointments = dao.findByUserId(userId);

            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
        }
    }