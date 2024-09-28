/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package post_controller;

import dal.PostCategoryDAO;
import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import model.PostCategory;

/**
 *
 * @author Dell
 */
@WebServlet(name="ListPostMarketing", urlPatterns={"/listpostmarketing"})
public class ListPostMarketing extends HttpServlet {
   
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
        PostDAO pdao = new PostDAO();
        List<Post> pList = pdao.getAllPostMarketing();
        List<Post> top3post = select3Post(pList, 0);
        PostCategoryDAO pcdao = new PostCategoryDAO();
        List<PostCategory> pcList = pcdao.getAllPostCategory();
        Reset(session);
        
        session.setAttribute("listpostcategorymkt", pcList);
        session.setAttribute("listpostmarketing", pList);
        session.setAttribute("top3postmarketing", top3post);
        session.setAttribute("cpostmkt", 0);
        response.sendRedirect(request.getContextPath()+"/management/listpostmarketing.jsp");
    } 
    
    public static void Reset(HttpSession session){
        session.setAttribute("begindatemkt", "");
        session.setAttribute("enddatemkt", "");
        session.setAttribute("authormkt", "");
        session.setAttribute("titlemkt", "");
        session.setAttribute("sortValuemkt",null);
        session.setAttribute("pmktCategory",null);
        session.setAttribute("pmktloi", "");
    }
    
    public static List<Post> select3Post( List<Post> pList, int pageNum){
        List<Post> top6List = new ArrayList<>();
        for(int i = pageNum*3;i<=pageNum*3+2;i++){
            if(i>=pList.size()) {
                break;
            } else {
                top6List.add(pList.get(i));
            }
        }
        
        return top6List;
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
