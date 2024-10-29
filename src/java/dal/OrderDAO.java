package dal;

import model.Order;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SaleChart;
import model.User;

/**
 *
 * @author Thanh Tan
 */
public class OrderDAO extends DBContext {

    public Order getOrderBySaleIdAndOrderId(int sid, int ordId) {
        String sql = """
                     select o.*,pm.payment_method_name,ps.payment_status_name,os.order_status_name
                       from Orders o
                       left join Payment_Methods pm on pm.payment_method_id = o.payment_method_id
                       left join Payment_Status ps on ps.payment_status_id = o.payment_status_id
                       left join Order_Status os on os.order_status_id = o.order_status_id
                       WHERE [salerId] = ? and [order_id] = ?""";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, sid);
            pre.setInt(2, ordId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiveDate = rs.getString("receive_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");

                String paymentMethodName = rs.getString("payment_method_name");
                String paymentStatusName = rs.getString("payment_status_name");
                String orderStatusName = rs.getString("order_status_name");
                return new Order(oid, cid, orderedDate, receiveDate, receiverName, phone, email, address, wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee, voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate, paymentStatusId, orderStatusId, shippingCode, saleId, paymentMethodName, paymentStatusName, orderStatusName);

            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Order getOrderByCustomerIdAndOrderId(int cusId, int ordId) {
        String sql = """
                     select o.*,pm.payment_method_name,ps.payment_status_name,os.order_status_name
                       from Orders o
                       left join Payment_Methods pm on pm.payment_method_id = o.payment_method_id
                       left join Payment_Status ps on ps.payment_status_id = o.payment_status_id
                       left join Order_Status os on os.order_status_id = o.order_status_id
                       WHERE [customer_id] = ? and [order_id] = ?""";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cusId);
            pre.setInt(2, ordId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiveDate = rs.getString("receive_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");

                String paymentMethodName = rs.getString("payment_method_name");
                String paymentStatusName = rs.getString("payment_status_name");
                String orderStatusName = rs.getString("order_status_name");
                return new Order(oid, cid, orderedDate, receiveDate, receiverName, phone, email, address, wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee, voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate, paymentStatusId, orderStatusId, shippingCode, saleId, paymentMethodName, paymentStatusName, orderStatusName);

            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Order> getOrderByCustomer(int id) {
        List<Order> oList = new ArrayList<>();
        String sql = """
                     select o.*,pm.payment_method_name,ps.payment_status_name,os.order_status_name
                       from Orders o
                       left join Payment_Methods pm on pm.payment_method_id = o.payment_method_id
                       left join Payment_Status ps on ps.payment_status_id = o.payment_status_id
                       left join Order_Status os on os.order_status_id = o.order_status_id
                       WHERE [customer_id] = ?
                        order by o.ordered_date desc""";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");

                String paymentMethodName = rs.getString("payment_method_name");
                String paymentStatusName = rs.getString("payment_status_name");
                String orderStatusName = rs.getString("order_status_name");
                Order order = new Order(oid, cid, orderedDate, receiverName, phone, email, address, wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee, voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate, paymentStatusId, orderStatusId, shippingCode, saleId, paymentMethodName, paymentStatusName, orderStatusName);
                oList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return oList;
    }

    public boolean updateOrderStatus(int orderId, int orderStatusId) {
        String sql = """
                     UPDATE [dbo].[Orders]
                         SET 
                            [order_status_id] = ?
                       WHERE [order_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderStatusId);
            ps.setInt(2, orderId);

            int n = ps.executeUpdate();

            return n > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

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

    public boolean updatePaymentStatus(int orderId, int paymentStatusId) {
        String sql = """
                     UPDATE [dbo].[Orders]
                        SET 
                           [payment_status_id] = ?
                      WHERE [order_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, paymentStatusId);
            ps.setInt(2, orderId);

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

    public List<Order> getAllOrder() {
        List<Order> oList = new ArrayList<>();
        String sql = "select * from Orders";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");
                Order order = new Order(oid, cid, orderedDate, receiverName, phone, email, address,
                        wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee,
                        voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate,
                        paymentStatusId, orderStatusId, shippingCode, saleId);
                oList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return oList;
    }

    public List<Order> getOrderBySale(int id) {
        List<Order> oList = new ArrayList<>();
        String sql = """
                     select o.*,pm.payment_method_name,ps.payment_status_name,os.order_status_name
                       from Orders o
                       left join Payment_Methods pm on pm.payment_method_id = o.payment_method_id
                       left join Payment_Status ps on ps.payment_status_id = o.payment_status_id
                       left join Order_Status os on os.order_status_id = o.order_status_id
                       WHERE [salerId] = ?
                     order by o.ordered_date desc""";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");

                String paymentMethodName = rs.getString("payment_method_name");
                String paymentStatusName = rs.getString("payment_status_name");
                String orderStatusName = rs.getString("order_status_name");
                Order order = new Order(oid, cid, orderedDate, receiverName, phone, email, address, wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee, voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate, paymentStatusId, orderStatusId, shippingCode, saleId, paymentMethodName, paymentStatusName, orderStatusName);
                oList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return oList;
    }

    public Order getOrderById(int oid) {
        Order order = new Order();
        String sql = "select * from Orders "
                + "where order_id=?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, oid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");
                order = new Order(cid, orderedDate, receiverName, phone, email, address,
                        wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee,
                        voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate,
                        paymentStatusId, orderStatusId, shippingCode, saleId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return order;
    }

    public List<SaleChart> getSucsessOnTotalOrder(int saleId, LocalDate startDate, long days) {
        List<SaleChart> sList = new ArrayList<>();

        String sql = "Select os.order_status_id, os.order_status_name, count(order_id) as Total_Order\n"
                + "from Order_Status as os\n"
                + "right join Orders as o on os.order_status_id = o.order_status_id\n"
                + "where ordered_date>= ? and ordered_date <= ?\n"
                + "group by os.order_status_id,os.order_status_name\n"
                + "order by os.order_status_id";

        if (saleId != 0) {
            sql = "Select os.order_status_id, os.order_status_name, count(order_id) as Total_Order\n"
                    + "from Order_Status as os\n"
                    + "right join Orders as o on os.order_status_id = o.order_status_id\n"
                    + "where ordered_date>= ? and ordered_date <= ?\n"
                    + "and salerId = " + saleId + " "
                    + "group by os.order_status_id,os.order_status_name\n"
                    + "order by os.order_status_id";
        }

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, startDate + "");
            pre.setString(2, startDate.plusDays(days) + "");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String name = rs.getString("order_status_name");
                int value = rs.getInt("Total_Order");
                SaleChart saleChart = new SaleChart(name, value);
                sList.add(saleChart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sList;
    }

    public List<SaleChart> getNumberOfOrderByDay(int saleId, LocalDate startDate, long days) {
        List<SaleChart> sList = new ArrayList<>();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String sql = "select count(order_id) as Total_number from Orders\n"
                + "where ordered_date = ?";

        if (saleId != 0) {
            sql = "select count(order_id) as Total_number from Orders\n"
                    + "where ordered_date = ? and salerid = " + saleId;
        }

        for (int i = 0; i <= days; i++) {

            try {
                PreparedStatement pre = connection.prepareStatement(sql);
                LocalDate date = startDate.plusDays(i);
                pre.setString(1, date + "");

                ResultSet rs = pre.executeQuery();
                while (rs.next()) {

                    String fdate = dtf.format(date);
                    int value = rs.getInt("Total_number");
                    SaleChart saleChart = new SaleChart(fdate, value);
                    sList.add(saleChart);
                }
            } catch (SQLException ex) {
                Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return sList;
    }

    public List<SaleChart> getTotalRevenueByDay(int saleId, LocalDate startDate, long days) {
        List<SaleChart> sList = new ArrayList<>();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String sql = "select sum(total_price) as Total_Price \n"
                + "from Orders\n"
                + "where ordered_date = ?";

        if (saleId != 0) {
            sql = "select sum(total_price) as Total_Price \n"
                    + "from Orders\n"
                    + "where ordered_date = ? and salerid = " + saleId;
        }

        for (int i = 0; i <= days; i++) {

            try {
                PreparedStatement pre = connection.prepareStatement(sql);
                LocalDate date = startDate.plusDays(i);
                pre.setString(1, date + "");

                ResultSet rs = pre.executeQuery();

                while (rs.next()) {

                    String fdate = dtf.format(date);
                    int value = rs.getInt("Total_Price");
                    SaleChart saleChart = new SaleChart(fdate, value);
                    sList.add(saleChart);
                }
            } catch (SQLException ex) {
                Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return sList;
    }

    public List<SaleChart> getRevenueAccumulateByDay(int saleId, LocalDate startDate, long days) {
        List<SaleChart> sList = new ArrayList<>();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String sql = "select sum(total_price) as Total_Price \n"
                + "from Orders\n"
                + "where ordered_date <= ?";

        if (saleId != 0) {
            sql = "select sum(total_price) as Total_Price \n"
                    + "from Orders\n"
                    + "where ordered_date <= ? and salerid = " + saleId;
        }

        for (int i = 0; i <= days; i++) {

            try {
                PreparedStatement pre = connection.prepareStatement(sql);
                LocalDate date = startDate.plusDays(i);
                pre.setString(1, date + "");

                ResultSet rs = pre.executeQuery();

                while (rs.next()) {

                    String fdate = dtf.format(date);
                    int value = rs.getInt("Total_Price");
                    SaleChart saleChart = new SaleChart(fdate, value);
                    sList.add(saleChart);
                }
            } catch (SQLException ex) {
                Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return sList;
    }

    public int getTotalOrder(int saleId, LocalDate startDate, long days) {
        int total = 0;

        String sql = "select count(*) as Total_Order\n"
                + "from Orders where ordered_date>= ? and ordered_date <= ?";

        if (saleId != 0) {
            sql = "select count(*) as Total_Order\n"
                    + "from Orders where ordered_date>= ? and ordered_date <= ? and salerid = " + saleId;
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, startDate + "");
            pre.setString(2, startDate.plusDays(days) + "");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total_Order");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return total;
    }

    public List<Order> getOrderPending() {
        List<Order> oList = new ArrayList<>();
        String sql = """
                     select o.*,pm.payment_method_name,ps.payment_status_name,os.order_status_name
                       from Orders o
                       left join Payment_Methods pm on pm.payment_method_id = o.payment_method_id
                       left join Payment_Status ps on ps.payment_status_id = o.payment_status_id
                       left join Order_Status os on os.order_status_id = o.order_status_id
                       WHERE o.order_status_id = 1
                        order by o.ordered_date desc""";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");

                String paymentMethodName = rs.getString("payment_method_name");
                String paymentStatusName = rs.getString("payment_status_name");
                String orderStatusName = rs.getString("order_status_name");
                Order order = new Order(oid, cid, orderedDate, receiverName, phone, email, address, wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee, voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate, paymentStatusId, orderStatusId, shippingCode, saleId, paymentMethodName, paymentStatusName, orderStatusName);
                oList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return oList;
    }

    public List<Order> getOrderPending(String startDate, String endDate) {
        List<Order> oList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("""
                 select o.*, pm.payment_method_name, ps.payment_status_name, os.order_status_name
                   from Orders o
                   left join Payment_Methods pm on pm.payment_method_id = o.payment_method_id
                   left join Payment_Status ps on ps.payment_status_id = o.payment_status_id
                   left join Order_Status os on os.order_status_id = o.order_status_id
                   WHERE o.order_status_id = 1
                 """);

        // Append date condition only if both dates are provided
        if (startDate != null && endDate != null) {
            sql.append(" AND o.ordered_date BETWEEN ? AND ?");
        }
        sql.append(" order by o.ordered_date desc");

        try {
            PreparedStatement pre = connection.prepareStatement(sql.toString());

            // Set date parameters only if both dates are provided
            if (startDate != null && endDate != null) {
                pre.setString(1, startDate);
                pre.setString(2, endDate);
            }

            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int oid = rs.getInt("order_id");
                int cid = rs.getInt("customer_id");
                String orderedDate = rs.getString("ordered_date");
                String receiverName = rs.getString("receiver_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String wardCode = rs.getString("ward_code");
                String wardName = rs.getString("ward_name");
                int districtId = rs.getInt("district_id");
                String districtName = rs.getString("district_name");
                int provinceId = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                int totalPrice = rs.getInt("total_price");
                int shippingFee = rs.getInt("shipping_fee");
                int voucherId = rs.getInt("voucher_id");
                int voucherPercent = rs.getInt("voucher_percent");
                int totalAmount = rs.getInt("total_amount");
                int totalGram = rs.getInt("total_gram");
                int paymentMethodId = rs.getInt("payment_method_id");
                String vnpTxnRef = rs.getString("vnp_TxnRef");
                String vnpCreateDate = rs.getString("vnp_CreateDate");
                int paymentStatusId = rs.getInt("payment_status_id");
                int orderStatusId = rs.getInt("order_status_id");
                String shippingCode = rs.getString("shipping_code");
                int saleId = rs.getInt("salerId");

                String paymentMethodName = rs.getString("payment_method_name");
                String paymentStatusName = rs.getString("payment_status_name");
                String orderStatusName = rs.getString("order_status_name");

                Order order = new Order(oid, cid, orderedDate, receiverName, phone, email, address, wardCode, wardName, districtId, districtName, provinceId, provinceName, totalPrice, shippingFee, voucherId, voucherPercent, totalAmount, totalGram, paymentMethodId, vnpTxnRef, vnpCreateDate, paymentStatusId, orderStatusId, shippingCode, saleId, paymentMethodName, paymentStatusName, orderStatusName);
                oList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return oList;
    }

//    public static void main(String[] args) {
//        OrderDAO odao = new OrderDAO();
//        List<Order> o = odao.getAllOrder();
//        System.out.println(o);
//    }
}
