/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package order_controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author Thanh Tan
 */
@WebServlet(name="OrderList", urlPatterns={"/orderlist"})
public class OrderList extends HttpServlet {
   
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
        
        OrderDAO odao = new OrderDAO();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("account");
        if (user == null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            String beginDate = request.getParameter("begindate");
        String endDate = request.getParameter("enddate");

        if (beginDate == null) {
            beginDate = (String) session.getAttribute("begin_date_o");
            if (beginDate == null) beginDate = "";
        }
        
        if (endDate == null) {
            endDate = (String) session.getAttribute("end_date_o");
            if (endDate == null) endDate = "";
        }
        
        session.setAttribute("begin_date_o", beginDate);
        session.setAttribute("end_date_o", endDate);
        
        String err = "";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if ((beginDate.isEmpty() && !endDate.isEmpty()) || (!beginDate.isEmpty() && endDate.isEmpty())) {
            err = "Hãy nhập cả ngày bắt đầu và kết thúc";
            session.setAttribute("error_dmy", err);
        } else if (!beginDate.isEmpty() && !endDate.isEmpty()) {
            LocalDate begin = LocalDate.parse(beginDate, formatter);
            LocalDate end = LocalDate.parse(endDate, formatter);
            
            long diff = ChronoUnit.DAYS.between(begin, end);
            if (diff < 0) {
                err = "Từ dd-MM-yyyy phải >= Đến dd-MM-yyyy";
                session.setAttribute("error_dmy", err);
            } else {
                session.setAttribute("begin_date_o", beginDate);
                session.setAttribute("end_date_o", endDate);
                session.removeAttribute("error_dmy");
            }
        }

        List<Order> order = odao.getOrderBySale(
            user.getUser_id(),
            beginDate.isEmpty() ? null : beginDate,
            endDate.isEmpty() ? null : endDate
        );

        session.setAttribute("order_list", order);
        response.sendRedirect(request.getContextPath() + "/management/list-order.jsp");
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
