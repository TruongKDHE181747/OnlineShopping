/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import utils.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/addToCart"})
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productId = request.getParameter("pid");
        String sizeId = request.getParameter("sid");
        String quantity = request.getParameter("quantity");

        Cookie[] cookies = request.getCookies();

        String txt = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(Constants.COOKIE_CART)) {
                txt = cookie.getValue();
                break;
            }
        }

        if (txt.isEmpty() || txt.isBlank()) {
            txt += productId + ":" + sizeId + ":" + quantity;
        } else {
            txt += "#" + productId + ":" + sizeId + ":" + quantity;
        }

        Cookie cart = new Cookie(Constants.COOKIE_CART, txt);
        cart.setMaxAge(30 * 60);
        response.addCookie(cart);

        response.sendRedirect(request.getContextPath() + "/cart");
    }

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
        processRequest(request, response);

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
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
