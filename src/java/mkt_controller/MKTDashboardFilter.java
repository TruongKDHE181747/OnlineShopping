/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package mkt_controller;

import dal.OrderDAO;
import dal.PostDAO;
import dal.PostFeedbackDAO;
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

/**
 *
 * @author quanpyke
 */
@WebServlet(name="MKTDashboardFilter", urlPatterns={"/mktdashboardfilter"})
public class MKTDashboardFilter extends HttpServlet {
   
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
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
        String pobegin = request.getParameter("begin");
        String poend = request.getParameter("end");
        HttpSession session=request.getSession(true);
        PostDAO pdao=new PostDAO();
        OrderDAO odao=new OrderDAO();
        PostFeedbackDAO pfdao=new PostFeedbackDAO();
         LocalDate beginDate;
         LocalDate endDate;
        String loi ="";
            String filter=request.getParameter("filter");
        if(pobegin.length()==0 || poend.length()==0){
            loi = "Please input both From and To";
            session.setAttribute("mkt_de", loi);
            
        } else if(pobegin.length()!=0 && poend.length()!=0){
            session.setAttribute("sadbegin", pobegin);
            session.setAttribute("sadend", poend);
             beginDate = LocalDate.parse(pobegin,formatter);
             endDate = LocalDate.parse(poend,formatter);
            
            long diff = ChronoUnit.DAYS.between(beginDate, endDate);
            if(diff<0){
                loi = "To Date must be >= From Date";
                session.setAttribute("mkt_de", loi);
            
            }
        List<SaleChart> chart1;
        List<SaleChart> chart2;
        List<SaleChart> chart3;
        List<SaleChart> chart4;
              
            
    
        
        if(filter.equals("post"))
        {
       chart1=pdao.getNumberPostByDay(beginDate,endDate );
           chart2=pdao.getPostEachDay(beginDate,endDate );
        chart3= pfdao.getNewFeedBackEachDay(beginDate, endDate);
       chart4=pfdao.getNumberPostFeedBaclByDay(beginDate, endDate);
          
       session.setAttribute("chart1", chart1);
             session.setAttribute("chart2", chart2);
             session.setAttribute("chart3", chart3);
             session.setAttribute("chart4", chart4);
        }
        else if(filter.equals("product"))
        {
            chart1=odao.getAmmountPerDay(beginDate, endDate);
                   session.setAttribute("chart1", chart1);
                   session.setAttribute("chart1name", "Sản phẩm đã bán");
                     chart2=odao.getTotalAmountByDay(beginDate, endDate);
                     session.setAttribute("chart2", chart2);
                     session.setAttribute("chart2name", "Tổng số sản phẩm bán được");
                     chart3=odao.getRevenueAccumulateByDay(0, beginDate, diff);
                      session.setAttribute("chart3", chart3);
                     session.setAttribute("chart3name", "Tổng doanh số");
                     chart4=odao.getTotalRevenueByDay(0, beginDate, diff);
                        session.setAttribute("chart4", chart4);
                     session.setAttribute("chart4name", "Doanh số theo ngày");
                     
                     
        }
           
        
          session.setAttribute("filter", filter);
        
        
        
        
        
        
        
        
        
        
    }
      
         response.sendRedirect(request.getContextPath()+"/management/mkt_dashboard.jsp");
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
