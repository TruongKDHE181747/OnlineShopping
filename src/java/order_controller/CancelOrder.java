/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package order_controller;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        
        try{
        
            OrderDAO orderDAO = new OrderDAO();
            
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int methodId = Integer.parseInt(request.getParameter("methodId"));
            int payStatus = Integer.parseInt(request.getParameter("payStatus"));
            
            orderDAO.updateOrderStatus(orderId, 5);
            
            if(methodId == 2 && payStatus == 2){
                orderDAO.updatePaymentStatus(orderId, 4);
            }
            
            
            
        }catch(NumberFormatException e){}
        
        
        
        
    }


}
