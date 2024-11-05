/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package profile_controller;

import dal.ProductDAO;
import dal.ProductFeedbackDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import model.Product;
import model.ProductFeedback;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddEditProductFeedback", urlPatterns = {"/productfeedback"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class AddEditProductFeedback extends HttpServlet {

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

        ProductFeedbackDAO pfDAO = new ProductFeedbackDAO();
        ProductDAO productDAO = new ProductDAO();

        try {
            int oid = Integer.parseInt(request.getParameter("oid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            Product product = productDAO.getProductById(pid);

            request.setAttribute("oid", oid);
            request.setAttribute("pid", pid);
            request.setAttribute("product", product);

            ProductFeedback pf = pfDAO.getFeedbackByProductAndOrder(oid, pid);

            if (pf != null) {
                request.setAttribute("pf", pf);
            }

            request.getRequestDispatcher("/account/feedbackProduct.jsp").forward(request, response);

        } catch (NumberFormatException e) {
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

        ProductFeedbackDAO pfDAO = new ProductFeedbackDAO();
        ProductDAO productDAO = new ProductDAO();
        HttpSession sesion = request.getSession();

        User account = (User) sesion.getAttribute("account");

        try {
            int customerId = account.getUser_id();

            int oid = Integer.parseInt(request.getParameter("oid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String review = request.getParameter("review");

            ProductFeedback pf = pfDAO.getFeedbackByProductAndOrder(oid, pid);

            Part filePart = request.getPart("thumbnail");
            String fileName = filePart.getSubmittedFileName();

            if (!fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "product_img";

                filePart.write(uploadPath + File.separator + fileName);

                fileName = "product_img/" + fileName;
            } else if (pf != null) {
                fileName = pf.getThumbnail();
            }

            if (pf == null) {
                boolean check = pfDAO.insertFeedback(new ProductFeedback(customerId, oid, pid, review, fileName, rating));
                
                int newAvgRating = pfDAO.getAverageRatingOfProduct(pid);
                
                productDAO.updateProductRating(pid, newAvgRating);

                sesion.setAttribute("feedbackMsg", check ? "Gửi đánh giá thành công." : "Gửi đánh giá thất bại.");

            } else {
                boolean check = pfDAO.updateFeedback(new ProductFeedback(pf.getFeedback_id(), review, fileName, rating));
                int newAvgRating = pfDAO.getAverageRatingOfProduct(pid);
                
                productDAO.updateProductRating(pid, newAvgRating);
                sesion.setAttribute("feedbackMsg", check ? "Sửa đánh giá thành công." : "Sửa đánh giá thất bại.");
            }

            response.sendRedirect(request.getContextPath() + "/productfeedback?oid=" + oid + "&pid=" + pid);

        } catch (NumberFormatException e) {
        }

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
