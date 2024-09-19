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
import model.ProductCategory;

/**
 *
 * @author Dell
 */
public class ProductCategoryDAO extends DBContext{
    public List<ProductCategory> getAllProductCategory() {
        List<ProductCategory> pList = new ArrayList<>();
        String sql = "select * from Product_Categories";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int product_category_id = rs.getInt("product_category_id");
                String product_category_name = rs.getString("product_category_name");
                int is_active = rs.getInt("is_active");
                ProductCategory p = new ProductCategory(product_category_id, product_category_name, is_active);
                pList.add(p);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
}
