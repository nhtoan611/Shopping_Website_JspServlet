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
    public ArrayList<Product> getListProductByName(String search_name) throws SQLException{
       Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE product_name LIKE '%"+search_name+"%'";
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
            product.setCategoryID(rs.getLong("category_id"));
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
            product.setCategoryID(rs.getLong("category_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getDouble("product_price"));
            product.setProductDesription(rs.getString("product_description"));
        }
        return product;
    }
    // lấy danh sách sản phẩm
    public ArrayList<Product> getListProductByNav(long categoryID, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE category_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
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
    // tính tổng sản phẩm
    public int countProductByCategory(long categoryID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(product_id) FROM product WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    //San pham nen mua
    public ArrayList<Product> getProductByPrice() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql="SELECT * FROM shop.product ORDER BY product_price ASC LIMIT 4";
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
    
   //Lay san pham by categoryID&limit
    public ArrayList<Product> getListProductByCategoryLimit(long category_id, long product_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE category_id='" + category_id + "' AND product_id!='"+product_id+"' LIMIT 3";
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
    public static void main(String[] args) throws SQLException {
        ProductDao dao = new ProductDao();
        
        for(Product p:dao.getListProductByName(Integer.toString(2))){
            System.out.println(p.getProductID()+"   "+p.getProductName()+"   "+p.getProductDesription()+"  "+p.getProductPrice()+"  "+p.getCategoryID()+"   "+p.getProductImage());
        }
//        System.out.println(dao.countProductByCategory(3));
    }
}
