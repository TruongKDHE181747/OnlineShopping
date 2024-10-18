/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
        String sql = "select f.*, u.username, u.profile_picture_url\n" +
                    "from Feedbacks as f, Users as u\n" +
                    "where f.customer_id = u.user_id and \n" +
                    "product_id = ? and f.is_active = 1\n" +
                    "and u.is_banned=0;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int feedback_id = rs.getInt("feedback_id");
                int customer_id = rs.getInt("customer_id");
                int order_id = rs.getInt("order_id");
                int product_id = rs.getInt("product_id");
                String review = rs.getString("review");
                String thumbnail = rs.getString("thumbnail");
                int rating = rs.getInt("rating");
                int is_active = rs.getInt("is_active");
                Date create_at = rs.getDate("create_at");
                Date modified_at = rs.getDate("modified_at");
                String username = rs.getString("username");
                String customer_img = rs.getString("profile_picture_url");
                ProductFeedback pf = new ProductFeedback(feedback_id, customer_id, order_id, product_id, review, thumbnail, rating, is_active, create_at, modified_at,username,customer_img);
                pList.add(pf);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
    
    public List<ProductFeedback> get2FeetBackByProductId(String id, int n) {
        List<ProductFeedback> pList = new ArrayList<>();
        String sql = "select f.* ,u.username, u.profile_picture_url\n" +
                    "from Feedbacks as f, Users as u\n" +
                    "where f.customer_id = u.user_id and \n" +
                    "product_id = ? and f.is_active = 1\n" +
                    "and u.is_banned=0\n" +
                    "order by feedback_id\n" +
                    "offset ? rows fetch next 2 rows only";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.setInt(2, n);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int feedback_id = rs.getInt("feedback_id");
                int customer_id = rs.getInt("customer_id");
                int order_id = rs.getInt("order_id");
                int product_id = rs.getInt("product_id");
                String review = rs.getString("review");
                String thumbnail = rs.getString("thumbnail");
                int rating = rs.getInt("rating");
                int is_active = rs.getInt("is_active");
                Date create_at = rs.getDate("create_at");
                Date modified_at = rs.getDate("modified_at");
                String username = rs.getString("username");
                String customer_img = rs.getString("profile_picture_url");
                ProductFeedback pf = new ProductFeedback(feedback_id, customer_id, order_id, product_id, review, thumbnail, rating, is_active, create_at, modified_at,username,customer_img);
                pList.add(pf);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
//    public static void main(String[] args) {
//        ProductFeedbackDAO pdao = new ProductFeedbackDAO();
//        List<ProductFeedback> alldpfList = pdao.getAllFeetBackByProductId("1");
//        for (ProductFeedback productFeedback : alldpfList) {
//            System.out.println(productFeedback.getCustomer_img()+" "+productFeedback.getUpdate_at());
//        }
//    }
}
