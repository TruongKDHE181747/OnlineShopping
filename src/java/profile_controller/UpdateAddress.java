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
import model.CustomerAddress;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateAddress", urlPatterns = {"/updateAddress"})
public class UpdateAddress extends HttpServlet {

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
        CustomerAddressDAO dao = new CustomerAddressDAO();
        HttpSession session = request.getSession();
        try {

            User user = (User) session.getAttribute("account");

            int addressId = Integer.parseInt(request.getParameter("addressId"));
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

            CustomerAddress current = dao.getAddressById(addressId);

            if (current.isIs_default()) {
                isDefaultAddress = true;
            }

            CustomerAddress customerAddress = new CustomerAddress(addressId, address, province_id, province_name, district_id, district_name, ward_code, ward_name, phone, reciever_name, isDefaultAddress, user.getUser_id());

            //Check if duplicate address
            if (dao.checkAddressExist(customerAddress, addressId)) {
                session.setAttribute("addressMsg", "Cập nhật địa chỉ thất bại do địa chỉ đã bị trùng.");
                response.sendRedirect(request.getContextPath() + "/address");
                return;
            }

            if (isDefaultAddress) {
                dao.updateAllDefaultToFalse(user.getUser_id());

            }

            boolean check = dao.updateAddress(customerAddress);

            if (check) {
                session.setAttribute("addressMsg", "Cập nhật địa chỉ thành công.");
            } else {
                session.setAttribute("addressMsg", "Cập nhật địa chỉ thất bại. Vui lòng thử lại.");
            }

            response.sendRedirect(request.getContextPath() + "/address");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/address");
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
