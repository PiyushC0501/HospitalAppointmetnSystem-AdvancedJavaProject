package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.conn.util.DButil;

public class UserDaoImplements implements UserDao {

    @Override
    public boolean isValidUser(String hosName, String password) {
        boolean isValid = false;

        try (Connection conn = DButil.getConnection()) {
            String sql = "SELECT * FROM Admin WHERE hosName = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, hosName);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            isValid = rs.next(); // returns true if a record exists

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }
}
