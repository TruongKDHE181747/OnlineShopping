/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package product_controller;

import dal.ProductDAO;
import dal.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;
import model.Product;
import model.Size;

/**
 *
 * @author Thanh Tan
 */
@WebServlet(name="AddProduct", urlPatterns={"/addproduct"})
public class AddProduct extends HttpServlet {
   
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
        
        SizeDAO sdao = new SizeDAO();
        List<Size> sizes = sdao.getAllSize();
        
        Part file=request.getPart("img");
        String imgfileName = file.getSubmittedFileName();
        boolean is_active = false;
        
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int total_quantity = 0;
        String description = request.getParameter("description");
        String img = "product_img/"+imgfileName;
        int status = Integer.parseInt(request.getParameter("status"));
        int rated_star = 0;
        int brand = Integer.parseInt(request.getParameter("brand"));
        int category = Integer.parseInt(request.getParameter("category"));
        
        for (Size size : sizes) {
            int quantity = Integer.parseInt(request.getParameter("size_") + size.getSize_id());
            total_quantity += quantity;
        }
        
        if(status == 1) {
            is_active = true;
        }
        
        ProductDAO pdao = new ProductDAO();
        pdao.addProduct(new Product(0, name, price, total_quantity, discount, description, name, is_active, rated_star, brand, category));
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
