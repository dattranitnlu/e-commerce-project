package com.laptopweb.dao;

import com.laptopweb.connection.DBConnection;
import com.laptopweb.model.Category;
import com.laptopweb.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProductDAO {
    public static boolean insert(Product p) {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "INSERT INTO product(productid, productname, productprice, productdescription, categoryid) VALUES(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, p.getProductID());
            ps.setString(2, p.getProductName());
            ps.setDouble(3, p.getProductPrice());
            ps.setString(4, p.getProductDescription());
            ps.setInt(5, p.getCategoryID());
            int temp = ps.executeUpdate();
            
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean update(Product p) {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "UPDATE product SET productname = ?, productprice = ?, productdescription = ? WHERE productid = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, p.getProductName());
            ps.setDouble(2, p.getProductPrice());
            ps.setString(3, p.getProductDescription());
            ps.setLong(4, p.getProductID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean updateImage(Product p) {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "UPDATE product SET productimage = ? WHERE productid = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, p.getProductImage());
            ps.setInt(2, p.getProductID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public static void main(String[] args) {
        Product p  =new Product();
        p.setProductID(654546);
        p.setProductImage("a");

        System.out.println(insert(p));
    }
}
