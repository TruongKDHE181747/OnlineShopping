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
import model.ResultSearch;

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
    public void addproductcate(ProductCategory p){
        try {
            String sql = "insert into Product_Categories( product_category_name, is_active) values   \n" +
"		   (? , ?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, p.getProduct_category_name());
            pre.setInt(2, p.getIs_active());
           pre.executeUpdate();

        } catch (SQLException ex) {

        }
    }
    public List<ResultSearch> searchCategory(String search){
        List<ResultSearch> pList = new ArrayList<>();
        String sql = "(SELECT 'Product_Categories' AS type, product_category_id as pid, product_category_name AS pname, is_active\n" +
                            " FROM Product_Categories\n" +
                            " WHERE product_category_name LIKE ?) \n" +
                            "UNION\n" +
                            "(SELECT 'Post_Categories' AS type, post_category_id as pid, post_category_name AS pname, is_active \n" +
                            " FROM Post_Categories\n" +
                            " WHERE post_category_name LIKE ?)";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%"+search+"%");
            pre.setString(2, "%"+search+"%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pname = rs.getString("pname");
                int is_active = rs.getInt("is_active");
                ResultSearch p =new ResultSearch(pid, pname, is_active);
                pList.add(p);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    public static void main(String[] args) {
        ProductCategoryDAO pdao=new ProductCategoryDAO();
        List<ResultSearch> plist=pdao.searchCategory("New");
        System.out.println(plist);
    }
}
