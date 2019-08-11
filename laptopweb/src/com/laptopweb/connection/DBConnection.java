package com.laptopweb.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://den1.mssql8.gear.host;databaseName=lapshop", "lapshop", "Kq9lPD!D?9L4");
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
