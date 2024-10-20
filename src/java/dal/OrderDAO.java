package dal;

import model.Order;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thanh Tan
 */
public class OrderDAO extends DBContext {

    public boolean updateOrderStatus(String vnp_TxnRef, int orderStatusId) {
        String sql = """
                     UPDATE [dbo].[Orders]
                         SET 
                            [order_status_id] = ?
                       WHERE [vnp_TxnRef] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderStatusId);
            ps.setString(2, vnp_TxnRef);

            int n = ps.executeUpdate();

            return n > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updatePaymentStatus(String vnp_TxnRef, int paymentStatusId) {
        String sql = """
                     UPDATE [dbo].[Orders]
                        SET 
                           [payment_status_id] = ?
                      WHERE [vnp_TxnRef] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, paymentStatusId);
            ps.setString(2, vnp_TxnRef);

            int n = ps.executeUpdate();

            return n > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updateVnPayField(int orderId, String vnp_TxnRef, String vnp_CreateDate) {
        String sql = """
                     UPDATE [dbo].[Orders]
                        SET 
                           [vnp_TxnRef] = ?
                           ,[vnp_CreateDate] = ?
                      WHERE [order_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, vnp_TxnRef);
            ps.setString(2, vnp_CreateDate);
            ps.setInt(3, orderId);

            int n = ps.executeUpdate();

            return n > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public int insertOrder(Order order) {

        String sql = """
                     INSERT INTO [dbo].[Orders]
                                           ([customer_id]
                                           ,[ordered_date]
                                           ,[receiver_name]
                                           ,[phone]
                                           ,[email]
                                           ,[address]
                                           ,[ward_code]
                                           ,[ward_name]
                                           ,[district_id]
                                           ,[district_name]
                                           ,[province_id]
                                           ,[province_name]
                                           ,[total_price]
                                           ,[shipping_fee]
                                           ,[voucher_id]
                                           ,[voucher_percent]
                                           ,[total_amount]
                                           ,[total_gram]
                                           ,[payment_method_id]
                                           ,[vnp_TxnRef]
                                           ,[vnp_CreateDate]
                                           ,[payment_status_id]
                                           ,[order_status_id]
                                           ,[shipping_code])
                                           
                                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getCustomerId());
            ps.setString(2, order.getOrderedDate());
            ps.setString(3, order.getReceiverName());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getEmail());
            ps.setString(6, order.getAddress());
            ps.setString(7, order.getWardCode());
            ps.setString(8, order.getWardName());
            ps.setInt(9, order.getDistrictId());
            ps.setString(10, order.getDistrictName());
            ps.setInt(11, order.getProvinceId());
            ps.setString(12, order.getProvinceName());
            ps.setInt(13, order.getTotalPrice());
            ps.setInt(14, order.getShippingFee());
            ps.setInt(15, order.getVoucherId());
            ps.setInt(16, order.getVoucherPercent());
            ps.setInt(17, order.getTotalAmount());
            ps.setInt(18, order.getTotalGram());
            ps.setInt(19, order.getPaymentMethodId());
            ps.setString(20, null);
            ps.setString(21, null);
            ps.setInt(22, order.getPaymentStatusId());
            ps.setInt(23, order.getOrderStatusId());
            ps.setString(24, null);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return -1;
    }

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
