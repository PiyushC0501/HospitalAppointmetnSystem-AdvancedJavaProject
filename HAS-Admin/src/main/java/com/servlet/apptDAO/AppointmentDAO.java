package com.servlet.apptDAO;

import com.conn.util.DButil;
import com.servlet.appModel.Appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AppointmentDAO {

    private static final String SELECT_BY_HOS_NAME =
            "SELECT * FROM appmts WHERE hosName = ?";

    private static final String UPDATE_STATUS_BY_ID =
            "UPDATE appmts SET status = ? WHERE id = ?";


    public List<Appointment> getAppointmentsByHosName(String hosName) {
        List<Appointment> appointments = new ArrayList<>();

        try (Connection conn = DButil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_HOS_NAME)) {

            stmt.setString(1, hosName);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    appointments.add(mapResultSetToAppointment(rs));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // In production, use a logger
        }

        return appointments;
    }

    public boolean updateAppointmentStatus(int id, String status) throws SQLException {
        try (Connection conn = DButil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_STATUS_BY_ID)) {

            stmt.setString(1, status);
            stmt.setInt(2, id);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated == 1;
        }
    }


    private Appointment mapResultSetToAppointment(ResultSet rs) throws SQLException {
        Appointment appt = new Appointment();
        appt.setId(rs.getInt("id"));
        appt.setHosName(rs.getString("hosName"));
        appt.setFirstname(rs.getString("firstname"));
        appt.setLastname(rs.getString("lastname"));
        appt.setAge(rs.getInt("age"));
        appt.setGender(rs.getString("gender"));
        appt.setEmail(rs.getString("email"));
        appt.setPhNo(rs.getString("phNo"));
        appt.setAddress(rs.getString("address"));
        appt.setDay(rs.getString("day"));
        appt.setTimeslot(rs.getString("timeslot"));
        appt.setQuery(rs.getString("query"));
        appt.setStatus(rs.getString("status"));
        return appt;
    }
}
