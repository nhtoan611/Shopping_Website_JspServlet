/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nhtoan
 */
public class DBConnect {
    public static Connection getConnection(){
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String URL="jdbc:mysql://node43562-nhtoan.jelastic.skali.net/shop";
            String username="user";
            String password="7JLuGq8BvQ6Wv5XB";
            conn=DriverManager.getConnection(URL,username,password);
//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "0969220842");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    } 
    
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
