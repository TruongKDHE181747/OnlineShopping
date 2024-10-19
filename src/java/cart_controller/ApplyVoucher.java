/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart_controller;

import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import model.Voucher;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ApplyVoucher", urlPatterns = {"/applyVoucher"})
public class ApplyVoucher extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        VoucherDAO dao = new VoucherDAO();

        String code = request.getParameter("voucherCode");
        String checkout = request.getParameter("isCheckout");
        boolean isCheckout = false;
        if (checkout != null) {
            isCheckout = checkout.equals("true");
        }
        Voucher voucher = dao.getVoucherbyCode(code);

        if (voucher == null) {
            session.setAttribute("voucherError", "Voucher is invalid !");
            if (isCheckout) {
                response.sendRedirect(request.getContextPath() + "/checkout");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart");
            }
            return;
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(voucher.getStart_date(), formatter);
        LocalDate endDate = LocalDate.parse(voucher.getEnd_date(), formatter);
        LocalDate currentDate = LocalDate.now();
        
        if(currentDate.isBefore(startDate)){
            session.setAttribute("voucherError", "Voucher is not yet valid !");
            if (isCheckout) {
                response.sendRedirect(request.getContextPath() + "/checkout");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart");
            }
            return;
        }
        
        if(currentDate.isAfter(endDate)){
            session.setAttribute("voucherError", "Voucher has expired !");
            if (isCheckout) {
                response.sendRedirect(request.getContextPath() + "/checkout");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart");
            }
            return;
        }
        
        if(voucher.getQuantity() <= 0){
            session.setAttribute("voucherError", "Voucher out of quantity !");
            if (isCheckout) {
                response.sendRedirect(request.getContextPath() + "/checkout");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart");
            }
            return;
        }
        
                
        session.setAttribute("voucher", voucher);
        if (isCheckout) {
            response.sendRedirect(request.getContextPath() + "/checkout");
        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
