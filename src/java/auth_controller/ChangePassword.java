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
@WebServlet(name = "ChangePassword", urlPatterns = {"/changePassword"})
public class ChangePassword extends HttpServlet {

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
        request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);
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

        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();

        User account = (User) session.getAttribute("account");
        
        User user = userDAO.getUserById(account.getUser_id());

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!currentPassword.equals(user.getPassword())) {
            request.setAttribute("error", "Current password is incorrect!");
            request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);
            return;
        }
        
        if (newPassword.isBlank()) {
            request.setAttribute("error", "Password could not be blank!");
            request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New password and confirm password do not match!");
            request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);
            return;
        }

        boolean checkUpdatePassword = userDAO.updatePassword(user.getEmail(), newPassword);

        if (checkUpdatePassword) {
            request.setAttribute("success", "Your password has been successfully updated.");
            request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "An error occurred while changing your password. Please try again later.");
            request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);
        }
    }

}
