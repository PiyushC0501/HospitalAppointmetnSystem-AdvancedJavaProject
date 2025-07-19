package com.servlet.apptDAO;

import com.conn.util.DButil;
import com.servlet.appModel.Appointment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {

    private static final String FIND_BY_USER_ID = "SELECT * FROM appmts WHERE userid = ?";
    private static final String FIND_BY_ID = "SELECT * FROM appmts WHERE id = ?";
    private static final String DELETE_BY_ID = "DELETE FROM appmts WHERE id = ?";

    public List<Appointment> findByUserId(String userId) {
        List<Appointment> list = new ArrayList<>();
        try (Connection con = DButil.getConnection();
             PreparedStatement ps = con.prepareStatement(FIND_BY_USER_ID)) {

            ps.setString(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(map(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Appointment findById(int id) {
        Appointment appt = null;
        try (Connection con = DButil.getConnection();
             PreparedStatement ps = con.prepareStatement(FIND_BY_ID)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    appt = map(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appt;
    }

    public boolean deleteById(int id) {
        try (Connection con = DButil.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_BY_ID)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Appointment map(ResultSet rs) throws SQLException {
        Appointment a = new Appointment();
        a.setId(rs.getInt("id"));
        a.setUserId(rs.getString("userid"));
        a.setHosName(rs.getString("hosName"));
        a.setFirstname(rs.getString("firstname"));
        a.setLastname(rs.getString("lastname"));
        a.setAge(rs.getInt("age"));
        a.setGender(rs.getString("gender"));
        a.setEmail(rs.getString("email"));
        a.setPhNo(rs.getString("phNo"));
        a.setAddress(rs.getString("address"));
        a.setDay(rs.getString("day"));
        a.setTimeslot(rs.getString("timeslot"));
        a.setQuery(rs.getString("query"));
        a.setStatus(rs.getString("status"));
        return a;
    }
}
