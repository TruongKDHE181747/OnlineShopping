/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package profile_controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderHistoryDetail", urlPatterns = {"/orderhistorydetail"})
public class OrderHistoryDetail extends HttpServlet {

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
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        try {

            User account = (User) session.getAttribute("account");
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            Order order = orderDAO.getOrderByCustomerIdAndOrderId(account.getUser_id(), orderId);

            if(order == null){
                request.getRequestDispatcher("/account/orderHistoryDetail.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("order", order);
            
            List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailByOrderId(orderId);
            
            request.setAttribute("orderDetails", orderDetails);
                       
            request.getRequestDispatcher("/account/orderHistoryDetail.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.getRequestDispatcher("/account/orderHistoryDetail.jsp").forward(request, response);
        }

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

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
