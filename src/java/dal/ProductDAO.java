package dal;

import model.Product;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO extends DBContext{
    
    public Product getProductById (int pid) {
        
        ResultSet rs = getData("select * from Roles where role_id = " + pid);

        Product product = null;
        try {
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                int price = rs.getInt(3);
                int total_quantity = rs.getInt(4);
                int discount = rs.getInt(5);
                String description = rs.getString(6);
                String thumbnail = rs.getString(7);
                boolean is_active = rs.getBoolean(8);
                int rated_star = rs.getInt(9);
                int brand_id = rs.getInt(10);
                int product_category_id = rs.getInt(5);
                product = new Product(product_id, product_name, price, total_quantity, discount, description, thumbnail, is_active, rated_star, brand_id, product_category_id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    
    
    public List<Product> getAllProduct () {
        List<Product> pList = new ArrayList<>();
       String sql = "select * from Products";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int price = rs.getInt("price");
                int total_quantity = rs.getInt("total_quantity");
                int discount = rs.getInt("discount");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                boolean is_active = rs.getBoolean("is_active");
                int rated_star = rs.getInt("rated_star");
                int brand_id = rs.getInt("brand_id");
                int product_category_id = rs.getInt("product_category_id");
                Product product = new Product(product_id, product_name, price, total_quantity, discount, description, thumbnail, is_active, rated_star, brand_id, product_category_id);
                pList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
    
    public List<Product> getHotProduct () {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 8 p.product_id, p.product_name,p.price, p.total_quantity, p.discount,p.description, p.thumbnail, p.is_active, p.rated_star,p.brand_id,p.product_category_id, sum(od.TotalPrice) as TotalPrice\n" +
                                "from Products as p, Order_Details as od, Orders as o\n" +
                                "where p.product_id = od.product_id and od.order_id = o.order_id\n" +
                                "and o.payment_status_id = 2\n" +
                                "group by p.product_id, p.product_name, p.price, p.total_quantity, p.discount,p.description, p.thumbnail, p.is_active, p.rated_star,p.brand_id,p.product_category_id\n" +
                                "order by sum(od.TotalPrice) desc, p.product_id";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int price = rs.getInt("price");
                int total_quantity = rs.getInt("total_quantity");
                int discount = rs.getInt("discount");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                boolean is_active = rs.getBoolean("is_active");
                int rated_star = rs.getInt("rated_star");
                int brand_id = rs.getInt("brand_id");
                int product_category_id = rs.getInt("product_category_id");
                Product product = new Product(product_id, product_name, price, total_quantity, discount, description, thumbnail, is_active, rated_star, brand_id, product_category_id);
                pList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
    
    public List<Product> getNewProduct () {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 8 * from Products\n" +
                    "order by product_id desc";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int price = rs.getInt("price");
                int total_quantity = rs.getInt("total_quantity");
                int discount = rs.getInt("discount");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                boolean is_active = rs.getBoolean("is_active");
                int rated_star = rs.getInt("rated_star");
                int brand_id = rs.getInt("brand_id");
                int product_category_id = rs.getInt("product_category_id");
                Product product = new Product(product_id, product_name, price, total_quantity, discount, description, thumbnail, is_active, rated_star, brand_id, product_category_id);
                pList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
    
    public List<Product> getSaleProduct () {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 8 * from Products\n" +
                    "where discount!=0";


        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int price = rs.getInt("price");
                int total_quantity = rs.getInt("total_quantity");
                int discount = rs.getInt("discount");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                boolean is_active = rs.getBoolean("is_active");
                int rated_star = rs.getInt("rated_star");
                int brand_id = rs.getInt("brand_id");
                int product_category_id = rs.getInt("product_category_id");
                Product product = new Product(product_id, product_name, price, total_quantity, discount, description, thumbnail, is_active, rated_star, brand_id, product_category_id);
                pList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }
//    public static void main(String[] args) {
//        ProductDAO pdao = new ProductDAO();
//        List<Product> pList = pdao.getHotProduct();
//        System.out.println(pList.size());
//    }
}
