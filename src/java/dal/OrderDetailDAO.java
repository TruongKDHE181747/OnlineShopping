/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.OrderDetail;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends DBContext {

    public boolean insertOrderDetail(OrderDetail od) {
        String sql = """
               INSERT INTO [dbo].[Order_Details]
                          ([order_id]
                          ,[product_id]
                          ,[product_name]
                          ,[thumbnail]
                          ,[size_id]
                          ,[quantity]
                          ,[UnitPrice]
                          ,[TotalPrice])
                    VALUES
                          (?,?,?,?,?,?,?,?)""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            // Set values for each placeholder
            ps.setInt(1, od.getOrderId());
            ps.setInt(2, od.getProductId());
            ps.setString(3, od.getProductName());
            ps.setString(4, od.getThumbnail());
            ps.setInt(5, od.getSizeId());
            ps.setInt(6, od.getQuantity());
            ps.setInt(7, od.getUnitPrice());
            ps.setInt(8, od.getTotalPrice());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
