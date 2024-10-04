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
import model.PostCategories;
import model.PostCategory;
import model.ProductCategory;

/**
 *
 * @author 84983
 */
public class PostCategoriesDAO extends DBContext{
    public List<PostCategories> getAllPostCategory() {
        List<PostCategories> pList = new ArrayList<>();
        String sql = "select * from Post_Categories";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_category_id = rs.getInt("post_category_id");
                String post_category_name = rs.getString("post_category_name");
                int is_active = rs.getInt("is_active");
                PostCategories p = new PostCategories(post_category_id, post_category_name, is_active);
                pList.add(p);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    public void addpostcate(PostCategories p){
        try {
            String sql = "insert into Post_Categories ( post_category_name, is_active) values   \n" +
                        "(? , ?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, p.getPost_category_name());
            pre.setInt(2, p.getIs_active());
           pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   public List<PostCategories> searchCategory2(String search){
        List<PostCategories> pList = new ArrayList<>();
        String sql = "select * from Post_Categories\n" +
"   where post_category_name like ?";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%"+search+"%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_category_id = rs.getInt("post_category_id");
                String post_category_name = rs.getString("post_category_name");
                int is_active = rs.getInt("is_active");
                PostCategories p =new PostCategories(post_category_id, post_category_name, is_active);
                pList.add(p);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
   public PostCategories getPostCategories(int post_category_id){
       PostCategories pc=null;
       String sql=" select * from Post_Categories\n" +
                " where post_category_id=?";
       try{
           PreparedStatement pre= connection.prepareStatement(sql);
           pre.setInt(1, post_category_id);
           ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                post_category_id = rs.getInt("post_category_id");
                String post_category_name = rs.getString("post_category_name");
                int is_active = rs.getInt("is_active");
                pc =new PostCategories(post_category_id, post_category_name, is_active);
                
            }
            
       }catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return pc;
   }
    public void updatePostCategory(PostCategories pd){
        try {
            String sql = "Update Post_Categories\n" +
                         " set post_category_name=?,\n" +
                         " is_active=?\n" +
                         " where post_category_id=?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, pd.getPost_category_name());
            pre.setInt(2, pd.getIs_active());
            pre.setInt(3, pd.getPost_category_id());
           pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
