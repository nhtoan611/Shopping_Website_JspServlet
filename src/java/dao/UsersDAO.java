/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;

/**
 *
 * @author nhtoan
 */
public class UsersDAO {

    //Kiem tra email ton tai?
    public boolean checkEmail(String email) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM users WHERE user_email='" + email + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            connection.close();
            return true;
        }
        return false;
    }

    //Them user moi
    public boolean insertUser(Users u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO users VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserEmail());
            ps.setString(3, u.getUserPass());
            ps.setBoolean(4, u.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //Kiem tra dang nhap
    public Users login(String email, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "select * from users where user_email='" + email + "' and user_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            Users u = new Users();
            if (rs.next()) {
                u.setUserID(rs.getLong("user_id"));
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPass(rs.getString("user_pass"));
                u.setUserRole(rs.getBoolean("user_role"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
