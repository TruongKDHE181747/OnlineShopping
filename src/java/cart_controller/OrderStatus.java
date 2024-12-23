/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart_controller;

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
@WebServlet(name = "OrderStatus", urlPatterns = {"/orderstatus"})
public class OrderStatus extends HttpServlet {



 
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
        String status = request.getParameter("status");
        
        if(status == null){
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        if(status.equals("success")){
            request.getRequestDispatcher("/common/order-success.jsp").forward(request, response);
            return;
        }
        
        if(status.equals("fail")){
            request.getRequestDispatcher("/common/order-fail.jsp").forward(request, response);
        }
        
    }



}
