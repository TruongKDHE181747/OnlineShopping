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
import java.util.List;
import model.Voucher;

/**
 *
 * @author 84983
 */
@WebServlet(name="SearchVoucher", urlPatterns={"/searchvoucher"})
public class SearchVoucher extends HttpServlet {
   
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
        String vsearch=request.getParameter("vsearch");
        String begindate=request.getParameter("begindate");
        String enddate=request.getParameter("enddate");
        String sql="SELECT * FROM Voucher where is_active=1";
        String error="";
        if((begindate.length()!=0 && enddate.length()==0) || (begindate.length()==0 && enddate.length()!=0)){
            error = "Please input both From and To";
        }else if(begindate.length()!=0 && enddate.length()!=0){
            LocalDate begin=LocalDate.parse(begindate);
            LocalDate end=LocalDate.parse(enddate);
            if(begin.isAfter(end)){
                error="To must be before From";
            }else{
                sql+="and start_date >= '"+begin+"' AND end_date <= '"+end+"'";
            }
        } 
        if(vsearch.length()>0){
            sql+="and voucher_name like '%"+vsearch+"%'";
        }
        if(error.length()>0){
            session.setAttribute("messe", error);
        }else{
        List<Voucher> vlist =vdao.searchVoucher(sql);
        session.setAttribute("vlist", vlist);
        session.setAttribute("messe", "");
        }
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

}
