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
@WebServlet(name="EditVoucher", urlPatterns={"/editvoucher"})
public class EditVoucher extends HttpServlet {
   
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
        int voucher_id= (int) session.getAttribute("vid");
        String voucher_name= request.getParameter("voucher_name");
        String description=request.getParameter("description");
        String start_date=request.getParameter("start_date");
        String end_date=request.getParameter("end_date");
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        int percent=Integer.parseInt(request.getParameter("percent"));
        int status=Integer.parseInt(request.getParameter("status"));
        String code=request.getParameter("code");
        String error="";
        
        Voucher v=vdao.getVoucherbyId(voucher_id);
            
        LocalDate startDate = LocalDate.parse(start_date);
        LocalDate endDate = LocalDate.parse(end_date);

        if (startDate.isAfter(endDate)) {
            // Start date is before end date
            error="Start date must be before end date";
        }
        Voucher vo=vdao.getVoucherbyCode(code);
        if(vo !=null && !code.equals(v.getVoucher_code())){
            error="Voucher code already has existed!";
        }
        
        if(error.length()>0){
                session.setAttribute("error", error);
                response.sendRedirect(request.getContextPath()+"/management/detailvoucher.jsp");
            }else{
        vdao.editVoucher(new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, status,code));
        response.sendRedirect("voucherlist");
        }
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
