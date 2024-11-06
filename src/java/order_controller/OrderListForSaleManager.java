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
import java.util.List;
import model.Order;

/**
 *
 * @author Thanh Tan
 */
@WebServlet(name = "OrderListForSaleManager", urlPatterns = {"/orderlistsm"})
public class OrderListForSaleManager extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        OrderDAO odao = new OrderDAO();
        HttpSession session = request.getSession();

        String beginDate = request.getParameter("begindate");
        String endDate = request.getParameter("enddate");
        String sale = request.getParameter("sale");

        if (beginDate == null) {
            beginDate = (String) session.getAttribute("begin_date");
            if (beginDate == null) {
                beginDate = "";
            }
        }

        if (endDate == null) {
            endDate = (String) session.getAttribute("end_date");
            if (endDate == null) {
                endDate = "";
            }
        }

        if (sale == null) {
            sale = (String) session.getAttribute("sale");
            if (sale == null) {
                sale = "";
            }
        }

        session.setAttribute("begin_date", beginDate);
        session.setAttribute("end_date", endDate);

        String err = "";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if ((beginDate.isEmpty() && !endDate.isEmpty() && !sale.isEmpty()) || (!beginDate.isEmpty() && endDate.isEmpty() && !sale.isEmpty())) {
            err = "Hãy nhập cả ngày bắt đầu và kết thúc";
            session.setAttribute("error_sm", err);
        } else if (!beginDate.isEmpty() && !endDate.isEmpty() && !sale.isEmpty()) {
            LocalDate begin = LocalDate.parse(beginDate, formatter);
            LocalDate end = LocalDate.parse(endDate, formatter);

            long diff = ChronoUnit.DAYS.between(begin, end);
            if (diff < 0) {
                err = "Từ dd-MM-yyyy phải >= Đến dd-MM-yyyy";
                session.setAttribute("error_sm", err);
            } else {
                session.setAttribute("begin_date", beginDate);
                session.setAttribute("end_date", endDate);
                session.setAttribute("sale", sale);
                session.removeAttribute("error_sm");
            }
        } else if (!beginDate.isEmpty() && !endDate.isEmpty() && sale.isEmpty()) {
            err = "Hãy chọn tên Sale";
            session.setAttribute("error_sm", err);
        } else {
            session.setAttribute("begin_date", beginDate);
            session.setAttribute("end_date", endDate);
            session.setAttribute("sale", sale);
            session.removeAttribute("error_sm");
        }

        if (sale.isEmpty()) {
            List<Order> order = odao.getOrderByFilterDate(
                    beginDate.isEmpty() ? null : beginDate,
                    endDate.isEmpty() ? null : endDate
            );
            session.setAttribute("list-order", order);
            response.sendRedirect(request.getContextPath() + "/management/list-order-sm.jsp");
        } else {
            List<Order> order = odao.getOrderBySale(
                    sale.isEmpty() ? null : Integer.parseInt(sale),
                    beginDate.isEmpty() ? null : beginDate,
                    endDate.isEmpty() ? null : endDate
            );
            session.setAttribute("list-order", order);
            response.sendRedirect(request.getContextPath() + "/management/list-order-sm.jsp");
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
