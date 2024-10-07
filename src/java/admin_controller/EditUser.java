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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Role;
import model.User;
import utils.Email;

/**
 *
 * @author 84983
 */
@WebServlet(name="EditUser", urlPatterns={"/edituser"})
@MultipartConfig(maxFileSize = 16177215)
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
        int user_id=(int) session.getAttribute("userid");
        String username = request.getParameter("username");
        String userEmail = request.getParameter("email");
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String profilepic=request.getParameter("profile_picture_url");
        String rolename=request.getParameter("role");
        String password=request.getParameter("password");
        User oldu=userDAO.getUserById(user_id);
        if(profilepic.equals(null)){
        profilepic= oldu.getProfile_picture_url();
        }else{
        try {
          
          Part filePart = request.getPart("profile_picture_url"); 
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "profile_img";


        // Save the uploaded file to the specified path
        filePart.write(uploadPath + File.separator + fileName);

            profilepic = "profile_img/"+fileName;
             if(fileName.isEmpty()) throw new Exception();
        } catch (Exception e) {
            profilepic=oldu.getProfile_picture_url();
        }
        }
        Role role=rdao.getRolebyname(rolename);
        
        User newu=new User(user_id, username, password, firstname, lastname, phone, userEmail, gender, dob, null, null, null, profilepic, true, false, role);
        userDAO.edituser(newu);
        response.sendRedirect("adminuser");
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
