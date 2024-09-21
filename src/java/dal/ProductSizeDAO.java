/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductSize;

/**
 *
 * @author Dell
 */
public class ProductSizeDAO extends DBContext{
    public List<ProductSize> getAllProductSizeById(String id) {
        List<ProductSize> pList = new ArrayList<>();
        String sql = "select distinct ps.*, s.size_name \n" +
                    "from Product_Size as ps, Sizes as s\n" +
                    "where ps.size_id = s.size_id and product_id = "+id;

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int size_id = rs.getInt("size_id");
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                String size_name = rs.getString("size_name");
                ProductSize ps = new ProductSize(size_id, product_id, quantity,size_name);
                pList.add(ps); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
}
