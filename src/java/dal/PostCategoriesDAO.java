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
"		   (? , ?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, p.getPost_category_name());
            pre.setInt(2, p.getIs_active());
           pre.executeUpdate();

        } catch (SQLException ex) {

        }
    }
   public List<PostCategory> searchCategory2(String search){
        List<PostCategory> pList = new ArrayList<>();
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
                PostCategory p =new PostCategory(post_category_id, post_category_name, is_active);
                pList.add(p);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    public static void main(String[] args) {
        PostCategoriesDAO pdao= new PostCategoriesDAO();
        List<PostCategory> pd= pdao.searchCategory2("New");
        System.out.println(pd);
    }
}
