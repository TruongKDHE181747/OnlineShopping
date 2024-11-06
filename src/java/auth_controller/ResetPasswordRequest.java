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
import java.util.ArrayList;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ResetPasswordRequest", urlPatterns = {"/resetPasswordRequest"})
public class ResetPasswordRequest extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        
        User account = (User) session.getAttribute("account");
        
        if(account == null){
            request.getRequestDispatcher("/account/emailReset.jsp").forward(request, response);
            return;
        }
        
        int roleId = account.getRole().getRole_id();
        
        switch (roleId) {
            case 1 -> response.sendRedirect(request.getContextPath()+"/admindashboard");
            case 2 -> response.sendRedirect(request.getContextPath()+"/salemanagerdashboard");
            case 3 -> response.sendRedirect(request.getContextPath()+"/orderlist");
            case 4 -> response.sendRedirect(request.getContextPath()+"/marketinghome");
            default -> response.sendRedirect(request.getContextPath()+"/homeslider");
        }
        
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

        UserDAO userDAO = new UserDAO();

        String resetCode = request.getParameter("resetCode");
        String email = request.getParameter("email");

        ArrayList<User> users = userDAO.getUsers("select * from Users where email = '" + email + "' and reset_password_code = '" + resetCode + "'");

        if (users.isEmpty()) {
            return;
        }

        request.setAttribute("email", email);
        request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);

    }

}
