package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "bhoomi@123"; // ⚠️ CHANGE THIS

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("✅ DB CONNECTED");

        } catch (Exception e) {
            System.out.println("❌ DB FAILED");
            e.printStackTrace();
        }

        return con;
    }
}