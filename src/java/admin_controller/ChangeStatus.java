/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package admin_controller;

import dal.PostCategoriesDAO;
import dal.ProductCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PostCategories;
import model.ProductCategory;

/**
 *
 * @author 84983
 */
@WebServlet(name="ChangeStatus", urlPatterns={"/changestatus"})
public class ChangeStatus extends HttpServlet {
   
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
        HttpSession session=request.getSession();
        PostCategoriesDAO pcdao=new PostCategoriesDAO();
        ProductCategoryDAO pdao= new ProductCategoryDAO();
        int pdid=Integer.parseInt(request.getParameter("pdid"));
        String button=request.getParameter("button");
        String type=request.getParameter("type");
        ProductCategory oldproduct=pdao.getProductCategories(pdid);
        PostCategories oldpost=pcdao.getPostCategories(pdid);
        if(type.equals("product")){
            if(button.equals("show")){
                ProductCategory newproduct=new ProductCategory(pdid,oldproduct.getProduct_category_name(), 1);
                pdao.updateProductCategory(newproduct);
            }else if(button.equals("hide")){
                ProductCategory newproduct=new ProductCategory(pdid,oldproduct.getProduct_category_name(), 0);
                pdao.updateProductCategory(newproduct);
            }
        }else if(type.equals("post")){
            if(button.equals("show")){
                PostCategories newpost=new PostCategories(pdid,oldpost.getPost_category_name(), 1);
                pcdao.updatePostCategory(newpost);
            }else if(button.equals("hide")){
                PostCategories newpost=new PostCategories(pdid,oldpost.getPost_category_name(), 0);
                pcdao.updatePostCategory(newpost);
            }
        }
        response.sendRedirect("settinglist");
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
