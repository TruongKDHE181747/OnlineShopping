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
import java.io.IOException;
import model.Role;
import model.User;
import utils.Email;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AccountServlet", urlPatterns = {"/account", "/account/login", "/account/register", "/account/verify"})
public class AccountServlet extends HttpServlet {

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
        String action = request.getServletPath();

        switch (action) {
            case "/account":

                break;
            case "/account/login":
                request.getRequestDispatcher("/account/login.jsp").forward(request, response);
                break;
            case "/account/register":
                request.getRequestDispatcher("/account/register.jsp").forward(request, response);
                break;
            case "/account/logout":

                break;

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
        String action = request.getServletPath();

        switch (action) {
            case "/account":

                break;
            case "/account/login":

                break;
            case "/account/register":
                postRegister(request, response);
                break;
            case "/account/logout":

                break;
            case "/account/verify":

                break;

        }
    }

    private void postRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        UserDAO userDAO = new UserDAO();
        Email mail = new Email();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String userEmail = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");

        boolean checkExistUsername = userDAO.checkExistUsername(username);
        boolean checkExistEmail = userDAO.checkExistEmail(userEmail);

        if (checkExistUsername) {
            String errorMessage = "Username is existed!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/register.jsp").forward(request, response);
            return;
        }

        if (checkExistEmail) {
            String errorMessage = "Email is existed!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            String errorMessage = "Password and Confirm password are not matched!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/register.jsp").forward(request, response);
            return;
        }

//        generate verify code 
        String verificationCode = mail.getRandom();

//        initialize user with customer role(id = 5)
        User newUser = new User(username, password, firstname, lastname, phone, userEmail, gender, dob, verificationCode, null, null, null, false, false, new Role(5));

//        insert to database
        boolean checkInsertUser = userDAO.insertUser(newUser);

        if (!checkInsertUser) {
            String errorMessage = "Something went wrong!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/register.jsp").forward(request, response);
            return;
        }

        //send mail to user to activate account
        boolean checkSendMail = mail.sendRegisterEmail(newUser);

//        fail to send email
        if (!checkSendMail) {
            String errorMessage = "Cannot sent email!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/account/register.jsp").forward(request, response);
            return;
        }

        String successMessage = "Register successfully, click on the link in your email to activate account!";
        request.setAttribute("success", successMessage);

        request.getRequestDispatcher("/account/register.jsp").forward(request, response);

    }

}
