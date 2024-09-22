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

public class ProductDAO extends DBContext {

    public Product getProductById(int pid) {

        Product p = new Product();
        String sql = "select * from Products where product_id=" + pid;

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
                p= new Product(product_id, product_name, price, total_quantity, discount, description, thumbnail, is_active, rated_star, brand_id, product_category_id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public List<Product> get9Product(int n) {
        List<Product> pList = new ArrayList<>();
        String sql = "select * from Products\n"
                + "order by product_id\n"
                + "offset " + n + " rows fetch next 9 rows only";

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

    public List<Product> getAllProductByName(String name) {
        List<Product> pList = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where product_name like '%" + name + "%'\n";

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

    public List<Product> getAllProductFilter(String sql) {
        List<Product> pList = new ArrayList<>();

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

    public List<Product> getAllProduct() {
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

    
    public List<Product> getAllRelatedProduct(String id) {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 3 * from Products\n" +
                    "where product_category_id = (\n" +
                    "select product_category_id from Products\n" +
                    "where product_id = ?\n" +
                    ") and product_id!=?;";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.setString(2, id);
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
    
    
    public List<Product> getHotProduct() {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 8 p.product_id, p.product_name,p.price, p.total_quantity, p.discount,p.description, p.thumbnail, p.is_active, p.rated_star,p.brand_id,p.product_category_id, sum(od.TotalPrice) as TotalPrice\n"
                + "from Products as p, Order_Details as od, Orders as o\n"
                + "where p.product_id = od.product_id and od.order_id = o.order_id\n"
                + "and o.payment_status_id = 2\n"
                + "group by p.product_id, p.product_name, p.price, p.total_quantity, p.discount,p.description, p.thumbnail, p.is_active, p.rated_star,p.brand_id,p.product_category_id\n"
                + "order by sum(od.TotalPrice) desc, p.product_id";

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

    public List<Product> getNewProduct() {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 8 * from Products\n"
                + "order by product_id desc";

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

    public List<Product> getSaleProduct() {
        List<Product> pList = new ArrayList<>();
        String sql = "select top 8 * from Products\n"
                + "where discount!=0";

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

    public List<Product> getProductPaging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Products\n"
                + " order by product_id\n"
                + " offset ? rows\n"
                + " fetch first 5 rows only";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);

            pre.setInt(1, (index - 1) * 5);
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
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public static void main(String[] args) {
//        ProductDAO pdao = new ProductDAO();
//        List<Product> pList = pdao.getProductPaging(1);
//        System.out.println(pList.size());
//    }
}
