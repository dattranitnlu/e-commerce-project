package com.lapshop.dao;

import com.lapshop.connection.DBConnection;
import com.lapshop.model.Product;

import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ProductDAO {
    public static List<Product> getListProducts() throws SQLException {
        List<Product> products = new ArrayList<>();

        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM PRODUCT";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setProductID(rs.getInt("productid"));
            p.setProductName(rs.getString("producname"));
            p.setProductImage(rs.getString("productimage"));
            p.setProductPrice(rs.getDouble("productprice"));
            p.setProductDescription(rs.getString("productdescription"));
            p.setCategoryID(rs.getInt("categoryid"));

            products.add(p);
        }

        return products;
    }

    public static Product getProduct(long productID) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM PRODUCT WHERE PRODUCTID = '" + productID+ "'";
        PreparedStatement pr = conn.prepareCall(sql);
        ResultSet rs = pr.executeQuery();
        Product p = new Product();

        while(rs.next()) {
            p.setProductID(rs.getLong("productid"));
            p.setProductName(rs.getString("productname"));
            p.setProductImage(rs.getString("productimage"));
            p.setProductPrice(rs.getDouble("productprice"));
            p.setProductDescription(rs.getString("productdescription"));
            p.setCategoryID(rs.getLong("categoryid"));
        }

        return p;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(getProduct(16).getProductImage());
    }
}