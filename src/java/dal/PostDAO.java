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
import model.Product;

/**
 *
 * @author Dell
 */
public class PostDAO extends DBContext{
    public List<Post> getAllPost () {
        List<Post> pList = new ArrayList<>();
       String sql = "select * from Posts";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_id = rs.getInt("post_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String thumbnail = rs.getString("thumbnail");
                int author_id = rs.getInt("author_id");
                int is_active = rs.getInt("is_active");
                Date created_at = rs.getDate("created_at");
               Date modified_at = rs.getDate("modified_at");
                int post_category_id = rs.getInt("post_category_id");
                
                Post post = new Post(post_id, title, content, thumbnail, author_id, is_active, created_at, modified_at, post_category_id);
                pList.add(post);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
    public List<Post> getNewPost () {
        List<Post> pList = new ArrayList<>();
       String sql = "select *, DATEDIFF(DAY, modified_at ,GETDATE()) from Posts\n" +
                    "order by DATEDIFF(DAY, modified_at, GETDATE())";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int post_id = rs.getInt("post_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String thumbnail = rs.getString("thumbnail");
                int author_id = rs.getInt("author_id");
                int is_active = rs.getInt("is_active");
                Date created_at = rs.getDate("created_at");
               Date modified_at = rs.getDate("modified_at");
                int post_category_id = rs.getInt("post_category_id");
                
                Post post = new Post(post_id, title, content, thumbnail, author_id, is_active, created_at, modified_at, post_category_id);
                pList.add(post);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
}
