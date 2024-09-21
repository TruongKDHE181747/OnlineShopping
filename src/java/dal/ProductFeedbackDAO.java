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
import model.ProductFeedback;

/**
 *
 * @author Dell
 */
public class ProductFeedbackDAO extends DBContext{
    public List<ProductFeedback> getAllFeetBackByProductId(String id) {
        List<ProductFeedback> pList = new ArrayList<>();
        String sql = "select * from Feedbacks where product_id = "+id+" and is_active = 1;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int feedback_id = rs.getInt("feedback_id");
                int customer_id = rs.getInt("customer_id");
                int order_id = rs.getInt("order_id");
                int product_id = rs.getInt("product_id");
                String review = rs.getString("review");
                int rating = rs.getInt("rating");
                int is_active = rs.getInt("is_active");
                ProductFeedback pf = new ProductFeedback(feedback_id, customer_id, order_id, product_id, review, rating, is_active);
                pList.add(pf);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
}
