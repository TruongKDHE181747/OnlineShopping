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
import model.Post;
import model.PostFeedback;
import model.User;

/**
 *
 * @author Dell
 */
public class PostFeedbackDAO extends DBContext{
     public List<PostFeedback> getTop3FeedbackByPostId (String id, int n) {
        List<PostFeedback> pList = new ArrayList<>();
       String sql = "select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n" +
                    "where pf.customer_id = u.user_id and post_id = ? and pf.is_active=1 and u.is_banned=0\n" +
                    "order by post_feedback_id\n" +
                    "offset ? rows fetch next 3 rows only";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.setInt(2, n);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_feedback_id = rs.getInt("post_feedback_id");
                int customer_id = rs.getInt("customer_id");
                int post_id = rs.getInt("post_id"); 
                String review = rs.getString("review");
                int is_active = rs.getInt("is_active");
                String username = rs.getString("username");
                String profile_picture_url = rs.getString("profile_picture_url");
                
                PostFeedback pf = new PostFeedback(post_feedback_id, customer_id, post_id, review, is_active, username, profile_picture_url);
                pList.add(pf);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
     
     
     public List<PostFeedback> getAllFeedbackByPostId (String id) {
        List<PostFeedback> pList = new ArrayList<>();
       String sql = "select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n" +
"where pf.customer_id = u.user_id and post_id = ? and pf.is_active=1 and u.is_banned=0";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_feedback_id = rs.getInt("post_feedback_id");
                int customer_id = rs.getInt("customer_id");
                int post_id = rs.getInt("post_id"); 
                String review = rs.getString("review");
                int is_active = rs.getInt("is_active");
                String username = rs.getString("username");
                String profile_picture_url = rs.getString("profile_picture_url");
                
                PostFeedback pf = new PostFeedback(post_feedback_id, customer_id, post_id, review, is_active, username, profile_picture_url);
                pList.add(pf);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
     
     
     public void AddCustomerPostFeedback (PostFeedback pf) {
        
       String sql = "INSERT INTO Post_Feedbacks (customer_id, post_id, review, is_active) VALUES\n" +
                    "(?, ?, ?, 1)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, pf.getCustomer_id());
            pre.setInt(2, pf.getPost_id());
            pre.setString(3, pf.getReview());
            pre.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
     
       public List<PostFeedback> getAllFeedback (int page) {
        List<PostFeedback> pList = new ArrayList<>();
       String sql = "select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n"
               + "where pf.customer_id = u.user_id and pf.is_active=1 and u.is_banned=0 \n"
               + "   order by post_id\n"
               + " offset ? rows\n"
               + " fetch first 5 rows only ";
           PostDAO pdao=new  PostDAO();
           UserDAO udao=new UserDAO();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,(page-1)*5);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_feedback_id = rs.getInt("post_feedback_id");
                int customer_id = rs.getInt("customer_id");
                int post_id = rs.getInt("post_id"); 
                String review = rs.getString("review");
                int is_active = rs.getInt("is_active");
                String username = rs.getString("username");
                String profile_picture_url = rs.getString("profile_picture_url");
                Post post= pdao.getPostByID(String.valueOf(post_id));
                User user= udao.getUserById(customer_id);
               PostFeedback pf=new PostFeedback(post_feedback_id, review, is_active, post, user);
                
                pList.add(pf);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
     public int getTotalFeedBack()
     {
     
       String sql = "select COUNT(post_feedback_id) as totalpage\n" +
                    "  from Post_Feedbacks";
        int totalfeedback=1;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
        
            ResultSet rs = pre.executeQuery();
            if (rs.next()) { // Move the cursor to the first row
            totalfeedback = rs.getInt("totalpage"); // Retrieve the count
        };
            
            
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalfeedback;
     }
   
     
}
