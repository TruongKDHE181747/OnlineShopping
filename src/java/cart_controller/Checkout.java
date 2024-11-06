/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart_controller;

import dal.CustomerAddressDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductSizeDAO;
import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.CustomerAddress;
import model.Order;
import model.OrderDetail;
import model.User;
import model.Voucher;
import utils.Constants;
import utils.ShippingFee;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        CustomerAddressDAO addressDAO = new CustomerAddressDAO();
        ProductSizeDAO productSizeDAO = new ProductSizeDAO();

        String txt = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(Constants.COOKIE_CART)) {
                txt = cookie.getValue();
                break;
            }
        }
        Cart cart = new Cart(txt);

        int totalQuantity = cart.cartSize(txt);

        if (totalQuantity == 0) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        List<CartItem> items = cart.getItems();

        request.setAttribute("items", items);

        User customer = (User) session.getAttribute("account");

        CustomerAddress address = addressDAO.getDefaultAddress(customer.getUser_id());

        if (address == null) {
            session.setAttribute("noAddressError",
                    "Không tìm thấy địa chỉ. Thêm địa chỉ trước khi tiến hành thanh toán.");
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        request.setAttribute("address", address);

        int weight = 0;
        for (CartItem item : items) {
            int sid = item.getSize().getSize_id();
            int pid = item.getProduct().getProduct_id();
            weight += (productSizeDAO.getWeightOfEachSize(sid, pid) * item.getQuantity());
        }

        int shippingFee = ShippingFee.caculateShippingFee(address.getWard_code(), address.getDistrict_id(), weight);

        if(shippingFee == 0){
            session.setAttribute("cartError",
                    "Đã có lỗi xảy ra khi tính chi phí vận chuyển đến khu vực của bạn. Vui lòng thử lại sau.");
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        request.setAttribute("ship", shippingFee);

        request.getRequestDispatcher("/common/checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        CustomerAddressDAO addressDAO = new CustomerAddressDAO();
        VoucherDAO voucherDAO = new VoucherDAO();
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ProductSizeDAO productSizeDAO = new ProductSizeDAO();

        String txt = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(Constants.COOKIE_CART)) {
                txt = cookie.getValue();
                break;
            }
        }

        Cart cart = new Cart(txt);

        List<CartItem> items = cart.getItems();

        User customer = (User) session.getAttribute("account");

        CustomerAddress address = addressDAO.getDefaultAddress(customer.getUser_id());

        try {
            //insert Order
            int totalPrice = (int) Double.parseDouble(request.getParameter("totalPrice"));
            int shippingFee = Integer.parseInt(request.getParameter("shippingFee"));
            String voucherId = request.getParameter("voucherId");
            int totalAmount = (int) Double.parseDouble(request.getParameter("totalAmount"));
            int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));

            if (paymentMethod == 1 && totalAmount >= 5000000) {
                session.setAttribute("totalAmountError", "* Phương thức thanh toán khi nhận hàng chỉ áp dụng với đơn hàng dưới 5.000.000đ.\\n* Quý khách vui lòng giảm giá trị đơn hàng hoặc chọn phương thức thanh toán khác để tiếp tục.\\n");
                response.sendRedirect(request.getContextPath() + "/checkout");
                return;
            }

            int intVoucherId = 1;
            if (voucherId != null && !voucherId.isEmpty()) {
                intVoucherId = Integer.parseInt(voucherId);
            }
            int weight = 0;
            for (CartItem item : items) {
                weight += productSizeDAO.getWeightOfEachSize(item.getSize().getSize_id(), item.getProduct().getProduct_id()) * item.getQuantity();
            }

            if (weight == 0) {
                response.sendRedirect(request.getContextPath() + "/orderstatus?status=fail");
                return;
            }

            Voucher voucher = voucherDAO.getVoucherbyId(intVoucherId);

            LocalDateTime currentDate = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String currentDateString = currentDate.format(formatter);

            Order order = new Order(
                    customer.getUser_id(),
                    currentDateString,
                    address.getReceiver_name(),
                    address.getPhone(),
                    customer.getEmail(),
                    address.getAddress(),
                    address.getWard_code(),
                    address.getWard_name(),
                    address.getDistrict_id(),
                    address.getDistrict_name(),
                    address.getProvince_id(),
                    address.getProvince_name(),
                    totalPrice,
                    shippingFee,
                    intVoucherId,
                    voucher.getPercent(),
                    totalAmount,
                    weight,
                    paymentMethod,
                    1,
                    1);

            int orderId = orderDAO.insertOrder(order);

            if (orderId == -1) {
                response.sendRedirect(request.getContextPath() + "/orderstatus?status=fail");
                return;
            }

            //end insert Order
            //insert Order Detail
            boolean check = false;
            for (CartItem item : items) {

                int unitPrice = item.getProduct().getPrice() - item.getProduct().getPrice() * item.getProduct().getDiscount() / 100;
                int productId = item.getProduct().getProduct_id();
                int sizeId = item.getSize().getSize_id();
                int itemQuantity = item.getQuantity();

                OrderDetail od = new OrderDetail(
                        orderId,
                        productId,
                        item.getProduct().getProduct_name(),
                        item.getProduct().getThumbnail(),
                        sizeId,
                        itemQuantity,
                        unitPrice,
                        unitPrice * itemQuantity);

                check = orderDetailDAO.insertOrderDetail(od);

                //if insert success
            }
            for (CartItem item : items) {
               
                int productId = item.getProduct().getProduct_id();
                int sizeId = item.getSize().getSize_id();
                int itemQuantity = item.getQuantity();
                if (check) {

                    session.removeAttribute("voucher");
                    if (intVoucherId != 1) {
                        voucherDAO.updateVoucherQuantity(intVoucherId, voucher.getQuantity() - 1);
                    }

                    int stock = productSizeDAO.getQuantityOfEachSize(sizeId, productId);

                    productSizeDAO.updateQuantityOfEachSize(sizeId, productId, stock - itemQuantity);

                } else {
                    response.sendRedirect(request.getContextPath() + "/orderstatus?status=fail");
                    return;
                }
            }
            //end insert

            //remove from cart
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(Constants.COOKIE_CART)) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break;
                }
            }

            //payment
            if (paymentMethod == 2) {
                request.setAttribute("orderId", orderId);
                request.setAttribute("totalAmount", totalAmount);
                request.getRequestDispatcher("/payment").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/orderstatus?status=success");

            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/cart");

        }
    }

}
