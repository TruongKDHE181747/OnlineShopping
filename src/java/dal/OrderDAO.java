package dal;

import model.Order;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thanh Tan
 */
public class OrderDAO extends DBContext{
    
    public List<Order> getAllOrder() {
        List<Order> oList = new ArrayList<>();
        String sql = "select * from Orders";
        
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("orderId");
                Date orderedDate = rs.getDate("orderedDate");
                Date receivedDate = rs.getDate("receivedDate");
                int shippingFee = rs.getInt("shippingFee");
                int totalPrice = rs.getInt("totalPrice");
                int totalAmount = rs.getInt("totalAmount");
                String phoneNumber = rs.getString("phoneNumber");
                Date paymentDate = rs.getDate("paymentDate");
                int paymentStatusId = rs.getInt("paymentStatusId");
                String receiverName = rs.getString("receiverName");
                String email = rs.getString("email");
                int statusId = rs.getInt("statusId");
                int voucherId = rs.getInt("voucherId");
                Order order = new Order(oid, orderedDate, receivedDate, shippingFee, totalPrice, totalAmount, phoneNumber, paymentDate, paymentStatusId, receiverName, email, statusId, voucherId);
                oList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return oList;        
    }
}
