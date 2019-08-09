package com.laptopweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.laptopweb.connection.DBConnection;
import com.laptopweb.model.Category;

public class CategoryDAO {
	
	public static boolean insert(Category c) {
		try {
	         Connection connection = DBConnection.getConnection();
	         String sql = "INSERT INTO category VALUE(?,?)";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setLong(1, c.getCategoryID());
	         ps.setString(2, c.getCategoryName());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}

	public static boolean update(Category c) {
		try {
			Connection connection = DBConnection.getConnection();
			String sql = "UPDATE category SET categoryname = ? WHERE categoryid = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, c.getCategoryName());
			ps.setLong(2, c.getCategoryID());
			int temp = ps.executeUpdate();
			return temp == 1;
		} catch (Exception e) {
			return false;
		}
	}
}
