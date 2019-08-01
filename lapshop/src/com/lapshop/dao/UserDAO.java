package com.lapshop.dao;

import com.lapshop.connection.DBConnection;
import com.lapshop.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    public static boolean checkEmail(String email) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM user WHERE useremail = '" + email + "';";
        PreparedStatement pr = null;
        try {
            pr = conn.prepareCall(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                conn.close();
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean insertUser(User u) {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO USER VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserEmail());
            ps.setString(3, u.getUserPass());
            ps.setBoolean(4, u.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;

    }

}
