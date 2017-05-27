/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.*;
import model.Bill;

/**
 *
 * @author nhtoan
 */
public class BillDAO {
     public void insertBill(Bill bill) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bill.getBillID());
        ps.setLong(2, bill.getUserID());
        ps.setDouble(3, bill.getTotal());
        ps.setString(4, bill.getPayment());
        ps.setString(5, bill.getAddress());
        ps.setTimestamp(6, bill.getDate());
        ps.executeUpdate();
    }
    
//    public static void main(String[] args) throws SQLException {
//        BillDAO billdao=new BillDAO();
//        Bill bill=new Bill(0, 0, 0, "s", "s", new Timestamp(System.currentTimeMillis()));
//        billdao.insertBill(bill);
//    }
}
