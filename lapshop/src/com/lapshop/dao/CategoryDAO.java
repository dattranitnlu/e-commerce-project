package com.lapshop.dao;

import com.lapshop.connection.DBConnection;
import com.lapshop.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    public static List<Category> getListCategory() throws SQLException {
        Connection conn = DBConnection.getConnection();
        List<Category> categories = new ArrayList<>();

        String sql = "SELECT * FROM CATEGORY";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getInt("categoryid"));
            category.setCategoryName(rs.getString("categoryname"));
            categories.add(category);
        }

        return categories;

    }

    public boolean insertCategory(Category c) throws SQLException {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "INSERT INTO category VALUE(?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getCategoryName());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean updateCategory(Category c) throws SQLException {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setLong(2, c.getCategoryID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean deleteCategory(long category_id) throws SQLException {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "DELETE FROM category WHERE category_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public static void main(String[] args) throws SQLException {
        List<Category> categories = getListCategory();

        for (int i = 0; i < categories.size(); i++) {
            System.out.println(categories.get(i).getCategoryID() + "\n");
        }

    }
}
