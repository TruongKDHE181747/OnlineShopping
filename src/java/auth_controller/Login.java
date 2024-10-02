/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package auth_controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

import utils.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
        
        Cookie[] cookies = request.getCookies();
        
        for (Cookie cookie : cookies) {
            if(cookie.getName().equals(Constants.COOKIE_REMEMBER)){
                request.setAttribute("u", cookie.getValue());
            }
                    
        }
        
        request.getRequestDispatcher("/account/login.jsp").forward(request, response);
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        
        User user = userDAO.login(username, password);

        if (user == null) {
            sendErrorMessage("Invalid username or password!", request, response);
            return;
        }

        if (user.isIs_banned()) {
            sendErrorMessage("Your account is suspended!", request, response);
            return;
        }

        if (!user.isIs_active()) {
            String activationLink = "<br><a href='" + request.getContextPath() + "/verify?userId=" + user.getUser_id() + "'>Click here to activate your account</a>";
            sendErrorMessage("Your account is not activated!" + activationLink, request, response);
            return;
        }
        
        if("On".equals(rememberMe)){
            saveRememberMe(username, response);
        }
        
        session.setAttribute("account", user);

        response.sendRedirect(request.getContextPath()+"/homeslider");
    }

    private void sendErrorMessage(String error, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("error", error);
        request.getRequestDispatcher("/account/login.jsp").forward(request, response);
    }
    
    private void saveRememberMe(String username, HttpServletResponse response){
        Cookie cookie = new Cookie(Constants.COOKIE_REMEMBER, username);
        cookie.setMaxAge(30 * 60);
        response.addCookie(cookie);
    }

}
