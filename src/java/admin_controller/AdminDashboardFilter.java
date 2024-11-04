/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package admin_controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.SaleChart;

/**
 *
 * @author 84983
 */
@WebServlet(name="AdminDashboardFilter", urlPatterns={"/admindashboardfilter"})
public class AdminDashboardFilter extends HttpServlet {
   
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
        int choosemonth= Integer.parseInt(request.getParameter("months"));
        int chooseyear= Integer.parseInt(request.getParameter("years"));
        HttpSession session=request.getSession();
        OrderDAO odao= new OrderDAO();
        List<SaleChart> monthChart= odao.getRevenueAccumulateByMonth(chooseyear);
        List<SaleChart> monthOrder= odao.getNumberOfOrderByMonth(chooseyear);
        List<SaleChart> monthStatus= odao.getNumberStatusOrderByMonth(choosemonth,chooseyear);
        List<SaleChart> mmonthBrand= odao.getTotalByBrandInMonth(choosemonth,chooseyear);
        int totalOrder = odao.getTotalOrderInMonth(choosemonth, chooseyear);
        session.setAttribute("monthOrder", monthOrder);
        session.setAttribute("monthChart", monthChart);
        session.setAttribute("monthStatus", monthStatus);
        session.setAttribute("monthBrand", mmonthBrand);
        session.setAttribute("month", choosemonth);
        session.setAttribute("year", chooseyear);
        session.setAttribute("totalOrder", totalOrder);
        response.sendRedirect(request.getContextPath()+"/management/admindasboard.jsp");
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