package com.lapshop.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://locahost:3306/lapshop", "root","root");
        } catch (Exception e) {
            System.out.println("failed");
            e.printStackTrace();
        }
        System.out.println("success");

        return connection;
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
