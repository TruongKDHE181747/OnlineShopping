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
import utils.Email;

/**
 *
 * @author 84983
 */
@WebServlet(name="EditUser", urlPatterns={"/edituser"})
public class EditUser extends HttpServlet {
   
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
        
        RoleDAO rdao= new RoleDAO();
        UserDAO userDAO = new UserDAO();
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String userEmail = request.getParameter("email");
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String profilepic=request.getParameter("profile_picture_url");
        int role_id=Integer.parseInt(request.getParameter("role"));
        boolean checkExistUsername = userDAO.checkExistUsername(username);
        boolean checkExistEmail = userDAO.checkExistEmail(userEmail);
        Role role=rdao.getRoleById(role_id);
        
        User oldu= userDAO.getUserById(user_id);
        User newu=new User(user_id, username, oldu.getPassword(), firstname, lastname, phone, userEmail, gender, dob, null, null, null, profilepic, true, false, role);
        userDAO.edituser(newu);
        response.sendRedirect("detailuser");
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
    

}
