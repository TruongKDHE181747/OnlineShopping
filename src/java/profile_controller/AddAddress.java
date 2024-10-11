/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package profile_controller;

import dal.CustomerAddressDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.CustomerAddress;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddAddress", urlPatterns = {"/addAddress"})
public class AddAddress extends HttpServlet {

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

        CustomerAddressDAO dao = new CustomerAddressDAO();
        HttpSession session = request.getSession();
        try {

            User user = (User) session.getAttribute("account");

            String reciever_name = request.getParameter("receiver_name");

            String phone = request.getParameter("phone");

            String province = request.getParameter("province");
            int province_id = Integer.parseInt(province.split("#")[0]);
            String province_name = province.split("#")[1];

            String district = request.getParameter("district");
            int district_id = Integer.parseInt(district.split("#")[0]);
            String district_name = district.split("#")[1];

            String ward = request.getParameter("ward");
            String ward_code = ward.split("#")[0];
            String ward_name = ward.split("#")[1];

            String address = request.getParameter("address");

            String is_default = request.getParameter("is_default");

            boolean isDefaultAddress = false;

            if (is_default != null && is_default.equals("On")) {
                isDefaultAddress = true;
            }
        
            if (!dao.checkDefaultAddress(user.getUser_id())) {
                isDefaultAddress = true;
            }

            CustomerAddress customerAddress = new CustomerAddress(address, province_id, province_name, district_id, district_name, ward_code, ward_name, phone, reciever_name, isDefaultAddress, user.getUser_id());

            if (!dao.checkAddressExist(customerAddress)) {
                //Check if there are any default address existed
                if (isDefaultAddress && dao.checkDefaultAddress(user.getUser_id())) {
                    dao.updateAllDefaultToFalse(user.getUser_id());
                }
                dao.insertCustomerAddress(customerAddress);
            }

            response.sendRedirect(request.getContextPath() + "/address");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/address");
        }

    }

}
