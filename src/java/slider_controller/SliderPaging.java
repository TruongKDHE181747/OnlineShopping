/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package slider_controller;

import dal.SliderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Slider;

/**
 *
 * @author quanpyke
 */
@WebServlet(name="SliderPaging", urlPatterns={"/sliderpaging"})
public class SliderPaging extends HttpServlet {
   
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
      HttpSession session=request.getSession(true);
        if(request.getParameter("p")!=null)
        {
        int p=Integer.parseInt(request.getParameter("p"));
        SliderDao sdao=new SliderDao();
        ArrayList<Slider> slist=sdao.getSliderPaging(p);
        
       
        session.setAttribute("slider", slist);
        session.setAttribute("cpage", p);
//         session.setAttribute("slider","clink");
           response.sendRedirect(request.getContextPath()+"/management/sliderlist.jsp");}
        else
        {
            int p=(int)session.getAttribute("cpage");
            SliderDao sdao=new SliderDao();
        ArrayList<Slider> slist=sdao.getSliderPaging(p);
        
       
        session.setAttribute("slider", slist);
        session.setAttribute("cpage", p);
         response.sendRedirect(request.getContextPath()+"/management/sliderlist.jsp");}

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
