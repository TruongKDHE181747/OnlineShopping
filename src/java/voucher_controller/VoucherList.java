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
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Voucher;

/**
 *
 * @author 84983
 */
@WebServlet(name="VoucherList", urlPatterns={"/voucherlist"})
public class VoucherList extends HttpServlet {
   
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
        HttpSession session= request.getSession();
        VoucherDAO vdao= new VoucherDAO();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        //update sql
        vdao.updateStatus();
        vdao.updateStatus2();
        List<Voucher> list= vdao.getAllVoucher();
        List<Voucher> vlist= vdao.getVoucherPaging(1);
//        for (Voucher voucher : vlist) {
//            
//            voucher.setStart_date(sdf.format(voucher.getStart_date()));
//            voucher.setEnd_date(sdf.format(voucher.getEnd_date())) ;
//            vlist.add(voucher);
//            
//        }
        session.setAttribute("curentpage", 1);
        session.setAttribute("vlist", vlist);
        session.setAttribute("npage", getNumberOfPage(list.size(), 5));
        session.setAttribute("mes", "");
        response.sendRedirect(request.getContextPath()+"/management/voucherlist.jsp");
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
    public int getNumberOfPage(int length, int n)
    {
        if(length%n==0) return length/n;
        else return length/n +1;
    }
}
