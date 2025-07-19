package com.servlet.fetchAppointment;

import com.servlet.appModel.Appointment;
import com.servlet.apptDAO.AppointmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/dash")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("hosName") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String hosName = (String) session.getAttribute("hosName");

        AppointmentDAO dao = new AppointmentDAO();
        List<Appointment> appointments = dao.getAppointmentsByHosName(hosName);

        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("dash.jsp").forward(request, response);
    }
}
