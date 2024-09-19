/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package product_controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import model.Product;

/**
 *
 * @author Dell
 */
@WebServlet(name="ProductSort", urlPatterns={"/productsort"})
public class ProductSort extends HttpServlet {
   
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
       HttpSession session = request.getSession();
       List<Product> apList = (List<Product>)session.getAttribute("apList");
       
       String sortValue = request.getParameter("sortValue");
       if(sortValue.equals("low")){
           apList.sort(new Comparator<Product>() {
               @Override
               public int compare(Product o1, Product o2) {
                   return (o1.getPrice()-o1.getPrice()*o1.getDiscount()/100)-(o2.getPrice()-o2.getPrice()*o2.getDiscount()/100);
               }
           });
       } else {
          apList.sort(new Comparator<Product>() {
               @Override
               public int compare(Product o1, Product o2) {
                   return (o2.getPrice()-o2.getPrice()*o2.getDiscount()/100)-(o1.getPrice()-o1.getPrice()*o1.getDiscount()/100);
               }
           }); 
       }
       int totalProduct = apList.size();
        int npage = totalProduct/9 + 1;
        int cpage = 0;
        List<Product> p9List = select9Products(apList, cpage);
        
        
        session.setAttribute("sortValue", sortValue);
        session.setAttribute("ppList", p9List);  
        session.setAttribute("curpage", cpage);
        session.setAttribute("ppage", npage);
        session.setAttribute("totalProduct", totalProduct);
       
       response.sendRedirect(request.getContextPath()+"/common/product.jsp");
    } 
    
    public static List<Product> select9Products( List<Product> pList, int pageNum){
        List<Product> top9List = new ArrayList<>();
        for(int i = pageNum*9;i<=pageNum*9+8;i++){
            if(i>=pList.size()) {
                break;
            } else {
                top9List.add(pList.get(i));
            }
        }
        
        return top9List;
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
