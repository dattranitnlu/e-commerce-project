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
	public static List<Category> getCategories() {
		List<Category> categories = new ArrayList<>();
		
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM CATEGORY;";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Category ca = new Category();
				ca.setCategoryID(rs.getInt("categoryid"));
				ca.setCategoryName(rs.getString("categoryname"));
				categories.add(ca);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return categories;
	}
	
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
