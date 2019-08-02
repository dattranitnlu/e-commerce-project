package com.laptopweb.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lapshop", "root", "root");
			System.out.println("success");
		}catch(Exception e) {
			System.out.println("Failed");
			e.printStackTrace();
		}
		
		
		return conn;
	}
	
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
