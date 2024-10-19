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
    
    public static void main(String[] args) {
        OrderDAO orderDAO= new OrderDAO();
        Order order = new Order();
        
        order.setCustomerId(1);
        order.setOrderedDate("2024-10-19");
        order.setReceiverName("John Doe");
        order.setPhone("123456789");
        order.setEmail("john.doe@example.com");
        order.setAddress("123 Main Street");
        order.setWardCode("WC001");
        order.setWardName("Ward A");
        order.setDistrictId(12);
        order.setDistrictName("District B");
        order.setProvinceId(34);
        order.setProvinceName("Province C");
        order.setTotalPrice(5000);
        order.setShippingFee(100);
        order.setVoucherId(1);
        order.setVoucherPercent(10);
        order.setTotalAmount(4500);
        order.setTotalGram(1500);
        order.setPaymentMethodId(1); // Assume 2 = VNPay, 1 = Cash, etc.
        order.setVnpTxnRef("VN123456789");
        order.setVnpCreateDate("2024-10-19 10:30:00");
        order.setPaymentStatusId(1); // Assume 1 = Paid, 2 = Pending, etc.
        order.setOrderStatusId(1); // Assume 1 = Processing, 2 = Shipped, etc.
        order.setShippingCode("SH123456789");

            // Insert the order and get the generated order_id
            int generatedOrderId = orderDAO.insertOrder(order);

            // Output the result
            if (generatedOrderId != -1) {
                System.out.println("Order inserted successfully! Generated Order ID: " + generatedOrderId);
            } else {
                System.out.println("Failed to insert order.");
            }
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
            PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
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
            
            if(rs.next()){
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
