/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package admin_controller;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;

/**
 *
 * @author 84983
 */
@WebServlet(name="AddUserList", urlPatterns={"/adduserlist"})
public class AddUserList extends HttpServlet {
   
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
        UserDAO ud= new UserDAO();
        RoleDAO rd=new RoleDAO();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String firstname= request.getParameter("first_name");
        String lastname=request.getParameter("last_name");
        String picture=request.getParameter("profile_picture_url");
        String gender=request.getParameter("gender");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String dob=request.getParameter("dob");
        String role=request.getParameter("role");
        int role_id=Integer.parseInt(role);
        Role r=rd.getRoleById(role_id);
        
        boolean checkExistUsername = ud.checkExistUsername(username);
        boolean checkExistEmail = ud.checkExistEmail(email);
        String error="";
        if(checkExistUsername){
            error="Username is existed!";
        }else{
            if(checkExistEmail){
                error="Email is existed!";
            }
        }
        if(error.length()>0){
            session.setAttribute("error", error);
            response.sendRedirect(request.getContextPath()+"/management/adduserlist.jsp");
        }else{
        User u= new User(0, username, password, firstname, lastname, phone, email, true, dob, null, null, null, picture, true, false, r);
        ud.addUser(u);
        response.sendRedirect("adminuser");}
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
