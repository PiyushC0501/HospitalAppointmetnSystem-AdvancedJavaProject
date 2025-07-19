package com.conn.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DButil {
    private static final String URL= "jdbc:mysql://localhost:3306/Hospital";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "tiger";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception e) {
            System.out.println(e.toString());
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL,USERNAME,PASSWORD);
    }
}
