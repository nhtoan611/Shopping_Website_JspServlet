/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author nhtoan
 */
//danh sach san pham theo category
public class ProductDao {

    public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE category_id='" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getDouble("product_price"));
            product.setProductDesription(rs.getString("product_description"));
            list.add(product);
        }
        return list;
    }

    //hien thi chi tiet san pham
    public Product getProduct(long productID) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE product_id='" + productID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) {
            //product.setProductID(rs.getLong("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getDouble("product_price"));
            product.setProductDesription(rs.getString("product_description"));
        }
        return product;
    }

    public static void main(String[] args) throws SQLException {
        ProductDao dao = new ProductDao();
//        for(Product p:dao.getListProductByCategory(1)){
//            System.out.println(p.getProductID()+"   "+p.getProductName()+"   "+p.getProductDesription()+"  "+p.getProductPrice());
//        }
        System.out.println(dao.getProduct(2).getProductImage());
    }
}
