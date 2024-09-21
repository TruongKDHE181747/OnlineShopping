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
import utils.Email;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Verify", urlPatterns = {"/verify"})
public class Verify extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        UserDAO userDAO = new UserDAO();      
        Email mail = new Email();
        
        //User user = (User) session.getAttribute("activateAccount");
        
        int userId = Integer.parseInt(request.getParameter("userId")) ;
        User user = userDAO.getUserById(userId);
        
        if(user == null){
            response.sendRedirect(request.getContextPath()+"/register");
            return;
        }
        //send mail to user to activate account
        boolean checkSendMail = mail.sendRegisterEmail(user);

//        fail to send email
        if (!checkSendMail) {
            String errorMessage = "Cannot sent email!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/register.jsp").forward(request, response);
            return;
        }

        request.setAttribute("userId", userId);
        request.getRequestDispatcher("/account/verify.jsp").forward(request, response);
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

        String otp = request.getParameter("otp");
        int userId = Integer.parseInt(request.getParameter("userId")) ;
        User user = userDAO.getUserById(userId);
        //User user = (User) session.getAttribute("activateAccount");

        if(user == null){
            response.sendRedirect(request.getContextPath()+"/register");
            return;
        }
        if (!otp.equals(user.getVerification_code())) {
            String errorMessage = "Wrong verification code!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/verify.jsp").forward(request, response);
            return;
        }

        userDAO.activateUser(user.getUsername());
        userDAO.deleteVerifyCode(userId);
        
        response.sendRedirect(request.getContextPath()+"/login");

    }

}
