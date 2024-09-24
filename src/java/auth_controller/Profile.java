/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package auth_controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Profile", urlPatterns = {"/profile"})
public class Profile extends HttpServlet {

    
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
        
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        
        
        User account = (User) session.getAttribute("account");
        
        User profile = userDAO.getUserByUsername(account.getUsername());
        
        request.setAttribute("profile", profile);
        
        request.getRequestDispatcher("/account/profile.jsp").forward(request, response);
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
        
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        
        User account = (User) session.getAttribute("account");
        
        User profile = new User(account.getUser_id(), firstname, lastname, phone, phone, gender, dob);
        
        userDAO.updateUserProfile(profile);
        
        response.sendRedirect(request.getContextPath()+"/profile");
    }


}
