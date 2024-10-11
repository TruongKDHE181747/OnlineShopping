/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package post_controller;

import dal.PostFeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.PostFeedback;

/**
 *
 * @author quanpyke
 */
@WebServlet(name="PostFeedbackPaging", urlPatterns={"/postfeedbackpaging"})
public class PostFeedbackPaging extends HttpServlet {
   
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
         PostFeedbackDAO pfdao=new PostFeedbackDAO();
         int p;
             if(request.getParameter("p")!=null)
        {
         p=Integer.parseInt(request.getParameter("p")); }
           
        else
        {
                p=(int)session.getAttribute("pfpage");
         }
        
             String filter;
             if(session.getAttribute("filter")==null || request.getParameter("filter")!=null    )
             {
                 filter=request.getParameter("filter");
             }
             else
             {
                 filter=(String)session.getAttribute("filter");
             }
             
        String sql=getSql(filter, p);
         List<PostFeedback> pflist=pfdao.getFeedBackSql(sql);

        session.setAttribute("pflist", pflist);
        session.setAttribute("pfpage", p);
           

        session.setAttribute("filter", filter);
           response.sendRedirect(request.getContextPath()+"/management/postfeedbacklist.jsp");}
            
             
           
  
    
    
    

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

    public String getSql(String filter,int page)
    {
        String sql=null;
        
        if(filter == null) filter="post";
        if(filter.contains("post")   ) sql= "select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n"
               + "where pf.customer_id = u.user_id  and u.is_banned=0 \n"
               + "   order by post_id\n"
               + " offset "+ page+ " rows\n"
               + " fetch first 5 rows only ";
        if(filter.contains("user")) sql="select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n"
               + "where pf.customer_id = u.user_id  and u.is_banned=0 \n"
               + "   order by customer_id\n"
               + " offset " +page+ " rows\n"
               + " fetch first 5 rows only ";
        
          if(filter.contains("show")) sql="select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n"
               + "where pf.customer_id = u.user_id  and u.is_banned=0 and pf.is_active=1\n"
               + "   order by customer_id\n"
               + " offset " +page+ " rows\n"
               + " fetch first 5 rows only "; 
           if(filter.contains("hidden")) sql="select pf.*, u.username, u.profile_picture_url from Post_Feedbacks as pf, Users as u\n"
               + "where pf.customer_id = u.user_id  and u.is_banned=0 and pf.is_active=0\n"
               + "   order by customer_id\n"
               + " offset " +page+ " rows\n"
               + " fetch first 5 rows only "; 
        
        
        return sql;
    }
    
    
}
