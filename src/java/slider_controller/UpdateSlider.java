/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package slider_controller;

import dal.SliderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Slider;

/**
 *
 * @author quanpyke
 */
@WebServlet(name="UpdateSlider", urlPatterns={"/updateslider"})
@MultipartConfig(maxFileSize = 16177215)
public class UpdateSlider extends HttpServlet {
   
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
         HttpSession session=request.getSession(true);
         
         if(request.getParameter("button")!=null)
         {
        String button=request.getParameter("button");
        int sid=Integer.parseInt(request.getParameter("sid"));
        if(button.equals("hide"))
        {
            SliderDao sdao=new SliderDao();
            Slider s=sdao.getSliderById(sid);
            s.setStatus(0);
            sdao.update(s);
           request.getRequestDispatcher("sliderpaging").forward(request, response);
            
            
        }
         else if(button.equals("show"))
        {
            SliderDao sdao=new SliderDao();
            Slider s=sdao.getSliderById(sid);
            s.setStatus(1);
            sdao.update(s);
              

           request.getRequestDispatcher("sliderpaging").forward(request, response);
            
            
        }
        else
          {
              
                  
                    SliderDao sdao=new SliderDao();
                    Slider s=sdao.getSliderById(sid);
                    session.setAttribute("s", s);
                  response.sendRedirect(request.getContextPath()+"/management/updateslider.jsp");
              
              
          }
        
         }
         
//         
        
        
        
        
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
       
         
         HttpSession session=request.getSession(true);
             
             SliderDao sdao=new SliderDao();
             int id=Integer.parseInt(request.getParameter("id"));
             Slider s=sdao.getSliderById(id);
            
             String title=request.getParameter("title");
             String description= request.getParameter("description");
             String img=s.getImg();
             int status=Integer.parseInt(request.getParameter("status"));
//             if(request.getPart("img")==null)
//             {
//                 img=s.getImg();
//             }
//             else
//             {
//                  Part file=request.getPart("img");
//          String imgfileName = file.getSubmittedFileName();    
//            
//     
//                 img = "slider_img/"+imgfileName;
//             }
//          
try {
          
          Part filePart = request.getPart("img"); 
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "slider_img";


        // Save the uploaded file to the specified path
        filePart.write(uploadPath + File.separator + fileName);

           img = "slider_img/"+fileName;
             if(fileName.isEmpty()) throw new Exception();
        } catch (Exception e) {
            img=s.getImg();
        }

             s.setDescription(description);
             s.setTitle(title);
          s.setStatus(status);
             s.setImg(img);
             sdao.update(s);
             response.sendRedirect("sliderlist");
         
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
