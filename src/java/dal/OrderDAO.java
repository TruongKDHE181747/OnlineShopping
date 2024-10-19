package dal;

import model.Order;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
//    public List<Order> getAllOrder() {
//        List<Order> oList = new ArrayList<>();
//        String sql = "select * from Orders";
//        
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            ResultSet rs = pre.executeQuery();
//            while (rs.next()) {
//                int oid = rs.getInt("order_id");
//                Date orderedDate = rs.getDate("ordered_date");
//                Date receivedDate = rs.getDate("received_date");
//                int shippingFee = rs.getInt("shipping_fee");
//                int totalPrice = rs.getInt("total_price");
//                int totalAmount = rs.getInt("total_amount");
//                String phoneNumber = rs.getString("phoneNumber");
//                Date paymentDate = rs.getDate("payment_date");
//                int paymentMethodId = rs.getInt("payment_method_id");
//                int paymentStatusId = rs.getInt("payment_status_id");
//                String receiverName = rs.getString("receiver_name");
//                String email = rs.getString("email");
//                int statusId = rs.getInt("status_id");
//                int voucherId = rs.getInt("voucherId");
//                int salerId = rs.getInt("salerId");
//                Order order = new Order(oid, orderedDate, receivedDate, shippingFee, totalPrice, totalAmount, phoneNumber, paymentDate, paymentMethodId, paymentStatusId, receiverName, email, statusId, voucherId, salerId);
//                oList.add(order);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return oList;        
//    }
//    
//    public List<Order> getOrderBySale(String sName) {
//        List<Order> oList = new ArrayList<>();
//        String sql = "select * from Orders "
//                + "join Users on Orders.salerId = Users.role_id "
//                + "where Users.username=?";
//        
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            pre.setString(1, sName);
//            ResultSet rs = pre.executeQuery();
//            while (rs.next()) {
//                int oid = rs.getInt("order_id");
//                Date orderedDate = rs.getDate("ordered_date");
//                Date receivedDate = rs.getDate("received_date");
//                int shippingFee = rs.getInt("shipping_fee");
//                int totalPrice = rs.getInt("total_price");
//                int totalAmount = rs.getInt("total_amount");
//                String phoneNumber = rs.getString("phoneNumber");
//                Date paymentDate = rs.getDate("payment_date");
//                int paymentMethodId = rs.getInt("payment_method_id");
//                int paymentStatusId = rs.getInt("payment_status_id");
//                String receiverName = rs.getString("receiver_name");
//                String email = rs.getString("email");
//                int statusId = rs.getInt("status_id");
//                int voucherId = rs.getInt("voucherId");
//                int salerId = rs.getInt("salerId");
//                Order order = new Order(oid, orderedDate, receivedDate, shippingFee, totalPrice, totalAmount, phoneNumber, paymentDate, paymentMethodId, paymentStatusId, receiverName, email, statusId, voucherId, salerId);
//                oList.add(order);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return oList;  
//    }
    
//    public static void main(String[] args) {
//        OrderDAO odao = new OrderDAO();
//        List<Order> o = odao.getAllOrder();
//        System.out.println(o);
//    }
}
