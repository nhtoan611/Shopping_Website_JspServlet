/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author nhtoan
 */
public class CategoryDAO {
    //hien thi category
    public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<Category>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getLong("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            list.add(category);
        }
        return list;
    }
    //them moi category
    public boolean insertCategory(Category c){
        Connection connection= DBConnect.getConnection();
        String sql="INSERT INTO category VALUE(?,?)";
        try {
            PreparedStatement ps=connection.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getCategoryName());
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //sua category
    public boolean updateCategory(Category c){
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
        try {
            PreparedStatement ps=connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setLong(2, c.getCategoryID());
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //xoa category
    public boolean deleteCategory(long category_id){
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM category WHERE category_id = ?";
        try {
            PreparedStatement ps= connection.prepareCall(sql);
            ps.setLong(1, category_id);
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
//    public static void main(String[] args) throws SQLException {
//        CategoryDAO dao=new CategoryDAO();
//        System.out.println(dao.deleteCategory(8));
//    }
}
