/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package order_controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import dal.ProductSizeDAO;
import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.ProductSize;
import model.Voucher;
import utils.Email;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CancelOrder", urlPatterns = {"/cancelorder"})
public class CancelOrder extends HttpServlet {

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

        try {

            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            ProductSizeDAO productSizeDAO = new ProductSizeDAO();
            VoucherDAO voucherDAO = new VoucherDAO();
            ProductDAO productDAO = new ProductDAO();

            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int methodId = Integer.parseInt(request.getParameter("methodId"));
            int payStatus = Integer.parseInt(request.getParameter("payStatus"));

            orderDAO.updateOrderStatus(orderId, 5);
            
            Email em = new Email();
            
            

            if (methodId == 2 && payStatus == 2) {
                orderDAO.updatePaymentStatus(orderId, 4);
            }

            List<OrderDetail> listDetail = orderDetailDAO.getOrderDetailByOrderId(orderId);

            for (OrderDetail od : listDetail) {
                int sid = od.getSizeId();
                int pid = od.getProductId();
                int quantity = od.getQuantity();
                ProductSize ps = productSizeDAO.getProductSize(sid, pid);
                productSizeDAO.updateSizeProduct(sid, pid, ps.getQuantity() + quantity);
                
                productDAO.updateTotalQuantity(pid);

            }

            Order order = orderDAO.getOrderById(orderId);
            int voucherId = order.getVoucherId();
            if (voucherId != 1) {
                Voucher voucher = voucherDAO.getVoucherbyId(voucherId);
                voucherDAO.updateVoucherQuantity(voucherId, voucher.getQuantity() + 1);
            }
            
            em.sendNotifyCancelOrder(orderDAO.getOrder(orderId));

        } catch (NumberFormatException e) {
        }

    }

}
