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
import model.ProductSize;

/**
 *
 * @author Dell
 */
public class ProductSizeDAO extends DBContext {

    public List<ProductSize> getAllProductSizeById(String id) {
        List<ProductSize> pList = new ArrayList<>();
        String sql = "select distinct ps.*, s.size_name \n"
                + "from Product_Size as ps, Sizes as s\n"
                + "where ps.size_id = s.size_id and product_id = " + id;

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int size_id = rs.getInt("size_id");
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                String size_name = rs.getString("size_name");
                ProductSize ps = new ProductSize(size_id, product_id, quantity, size_name);
                pList.add(ps);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }

    public void addSizeProduct(ProductSize p) {
        String sql = "insert into Product_Size \n"
                + "(size_id, product_id, quantity) \n"
                + "values \n"
                + "(?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, p.getSize_id());
            pre.setInt(2, p.getProduct_id());
            pre.setInt(3, p.getQuantity());
            pre.execute();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getQuantityOfEachSize(int sid, int pid) {
        String sql = "SELECT ps.quantity FROM Product_Size AS ps, Sizes AS s "
                + "WHERE ps.size_id = s.size_id AND ps.size_id = ? AND product_id = ?";
        int quantity = 0;  // Initialize to 0 in case there's no result.

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, sid);
            pre.setInt(2, pid);
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return quantity;
    }

    public void updateSizeProduct(int size, int pid, int quantity) {
        String sql = "update Product_Size set \n"
                + "quantity = ? \n"
                + "where size_id = ?, product_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, quantity);
            pre.setInt(2, size);
            pre.setInt(3, pid);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
