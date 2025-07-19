package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.conn.util.DButil;
import com.login.model.User;

public class UserDaoImplements implements UserDao {

    @Override
    public User getUserByCredentials(String username, String password) {
        User user = null;

        try (Connection con = DButil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT id, username, email FROM users WHERE username = ? AND password = ?")) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
