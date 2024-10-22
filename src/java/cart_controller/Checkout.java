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
                    "No address found. Please add an address before checkout.");
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        request.setAttribute("address", address);

        int shippingFee = ShippingFee.caculateShippingFee(address.getWard_code(), address.getDistrict_id(), totalQuantity);

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

            int intVoucherId = 1;
            if (voucherId != null && !voucherId.isEmpty()) {
                intVoucherId = Integer.parseInt(voucherId);
            }
            int weight = 0;
            for (CartItem item : items) {
                weight += productSizeDAO.getWeightOfEachSize(item.getSize().getSize_id(), item.getProduct().getProduct_id());
            }
            
            if (weight == 0) {
                session.setAttribute("systemError", "error");
                response.sendRedirect(request.getContextPath() + "/checkout");
                return;
            }

            Voucher voucher = voucherDAO.getVoucherbyId(intVoucherId);

            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
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
                session.setAttribute("systemError", "error");
                response.sendRedirect(request.getContextPath() + "/checkout");
                return;
            }

            //end insert Order
            //insert Order Detail
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

                boolean check = orderDetailDAO.insertOrderDetail(od);

                //if insert success
                if (check) {

                    int stock = productSizeDAO.getQuantityOfEachSize(sizeId, productId);

                    productSizeDAO.updateQuantityOfEachSize(sizeId, productId, stock - itemQuantity);

                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals(Constants.COOKIE_CART)) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                            break;
                        }
                    }

                } else {
                    session.setAttribute("systemError", "error");
                    response.sendRedirect(request.getContextPath() + "/checkout");
                    return;
                }

            }
            //end insert

            if (paymentMethod == 2) {
                request.setAttribute("orderId", orderId);
                request.setAttribute("totalAmount", totalAmount);
                request.getRequestDispatcher("/payment").forward(request, response);
            } else {
                request.getRequestDispatcher("/common/thankyou.jsp").forward(request, response);

            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/cart");

        }
    }

}
