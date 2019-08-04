package com.laptopweb.dao;

import com.laptopweb.connection.DBConnection;
import com.laptopweb.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
    public static boolean insertUser(User user) {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "INSERT INTO user(useremail, userpass, userroleid, fullname) VALUES(?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getUserrole());
            ps.setString(4, user.getFullname());
            int temp = ps.executeUpdate();

            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean updateImage(User p) {
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "UPDATE user SET userimage = ? WHERE userid = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, p.getAvatar());
            ps.setInt(2, p.getUserID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public static void main(String[] args) {
        User user = new User();
        user.setFullname("Quynh Nguyen");
        user.setUsername("andy");
        user.setPassword("andynguyen");
        user.setUserrole(0);

        System.out.println(insertUser(user));
    }
}
