/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package order_controller;

import dal.OrderDAO;
import dal.UserDAO;
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
import java.time.temporal.ChronoUnit;
import java.util.List;
import model.SaleChart;
import model.User;

/**
 *
 * @author Dell
 */
@WebServlet(name="SaleManagerDashboard", urlPatterns={"/salemanagerdashboard"})
public class SaleManagerDashboard extends HttpServlet {
   
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
        HttpSession session = request.getSession();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
        LocalDate today = LocalDate.now();   //2024-10-01
        LocalDate daybefore = today.minusDays(7);
        
        String pobegin = "2024-10-01";
        LocalDate poDate = LocalDate.parse(pobegin, formatter);
        
//         LocalDate beginDate = LocalDate.parse(pobegin,formatter);
//            LocalDate endDate = LocalDate.parse(poend,formatter);
//            
//            long diff = ChronoUnit.DAYS.between(beginDate, endDate);

        OrderDAO odao = new OrderDAO();
        UserDAO udao = new UserDAO();
        List<SaleChart> sList = odao.getSucsessOnTotalOrder(-1, poDate, 7);
        int totalOrder = odao.getTotalOrder(-1, poDate, 7);
        List<SaleChart> orderByDayList = odao.getNumberOfOrderByDay(-1, poDate, 7);
        List<SaleChart> revenueByDayList = odao.getTotalRevenueByDay(-1, poDate, 7);
        List<SaleChart> revenueAccumulateByDayList = odao.getRevenueAccumulateByDay(-1, poDate, 7);
        List<User> salerList = udao.getAllSaler();
        
        session.setAttribute("sotoChart", sList);
        session.setAttribute("orderByDayList", orderByDayList);
        session.setAttribute("revenueByDayList", revenueByDayList);
        session.setAttribute("revenueAccumulateByDayList", revenueAccumulateByDayList);
        session.setAttribute("dsalerList", salerList);
        
        session.setAttribute("ctotalOrder", totalOrder);
        
        
        response.sendRedirect(request.getContextPath()+"/management/saledashboard.jsp");
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
