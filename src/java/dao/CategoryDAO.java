/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author nhtoan
 */
public class CategoryDAO {

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
    
//    public static void main(String[] args) throws SQLException {
//        CategoryDAO dao=new CategoryDAO();
//        for(Category ds: dao.getListCategory()){
//            System.out.println(ds.getCategoryID()+"    "+ds.getCategoryName());
//        }
//    }
}
