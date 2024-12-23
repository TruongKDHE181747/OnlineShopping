/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package voucher_controller;

import dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.Voucher;

/**
 *
 * @author 84983
 */
@WebServlet(name="VoucherStatus", urlPatterns={"/voucherstatus"})
public class VoucherStatus extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        int vid= Integer.parseInt(request.getParameter("vid"));
        VoucherDAO vdao= new VoucherDAO();
        Voucher voucher=vdao.getVoucherbyId(vid);
        int status=Integer.parseInt(request.getParameter("status"));
        String mes="";
        LocalDate endDate = LocalDate.parse(voucher.getEnd_date());
        LocalDate startDate =LocalDate.parse(voucher.getStart_date());
        LocalDate today = LocalDate.now();
        if(endDate.isBefore(today) || startDate.isAfter(today)){
            mes="Mã giảm giá đã hết hạn hoặc chưa đến hạn sử dụng, hãy cập nhập lại ngày để sửa đổi trạng thái";
            
        }
        if(mes.length()>0){
            session.setAttribute("mes", mes);
            response.sendRedirect(request.getContextPath()+"/management/voucherlist.jsp");
        }else{
        vdao.editVoucher(new Voucher(vid, voucher.getVoucher_name(), voucher.getDescription(), voucher.getStart_date(), voucher.getEnd_date(), voucher.getQuantity(), voucher.getPercent(), status,voucher.getVoucher_code()));
        response.sendRedirect("voucherlist");}
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
