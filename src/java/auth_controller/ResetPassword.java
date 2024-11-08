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
@WebServlet(name = "ResetPassword", urlPatterns = {"/resetPassword"})
public class ResetPassword extends HttpServlet {

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
        Email em = new Email();
        UserDAO userDAO = new UserDAO();
        String email = request.getParameter("email");

        String resetCode = em.getRandom();

        userDAO.updateResetPassCode(email, resetCode);

        User user = userDAO.getUserByEmail(email);

        if (user != null) {
            em.sendResetPassEmail(user);
            request.setAttribute("success", "Kiểm tra email của bạn để nhận liên kết đặt lại mật khẩu.");
        } else {
            request.setAttribute("error", "Không tìm thấy email!");
        }

        request.getRequestDispatcher("/account/emailReset.jsp").forward(request, response);
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
        User account = (User) session.getAttribute("account");

        UserDAO userDAO = new UserDAO();

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword.isBlank()) {
            request.setAttribute("error", "Mật khẩu không thể trống!");
            request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp!");
            request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);
            return;
        }

        if (userDAO.updatePassword(email, newPassword)) {
            userDAO.deleteResetCode(email);
        }

        if (account != null) {
            request.setAttribute("success", "Đặt lại mật khẩu thành công.");
            request.getRequestDispatcher("/account/changePassword.jsp").forward(request, response);        
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }

    }

}
