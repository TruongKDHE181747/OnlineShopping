package dal;

import model.Product;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO extends DBContext{
    
    public Product getProductById (int pid) {
        
        ResultSet rs = getData("select * from Roles where role_id = " + pid);

        Product product = null;
        try {
            if (rs.next()) {
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
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
}
