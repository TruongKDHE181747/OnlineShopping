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
import model.ProductImg;

/**
 *
 * @author Dell
 */
public class ProductImageDAO extends DBContext{
    public List<ProductImg> getAllProductImgById(String id) {
        List<ProductImg> pList = new ArrayList<>();
        String sql = "select * from Product_Images where product_id = "+id;

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int product_image_id = rs.getInt("product_image_id");
                int product_id = rs.getInt("product_id");
                String image_url = rs.getString("image_url");
                int is_active = rs.getInt("is_active");
                ProductImg pi = new ProductImg(product_image_id, product_id, image_url, is_active);
                pList.add(pi);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
   
}
