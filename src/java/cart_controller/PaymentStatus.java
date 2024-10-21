/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.ObjectInputFilter.Config;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import utils.ConfigVNPAY;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PaymentStatus", urlPatterns = {"/paymentstatus"})
public class PaymentStatus extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        int vnp_Amount = Integer.parseInt(request.getParameter("vnp_Amount")) / 100;
        String vnp_PayDate = request.getParameter("vnp_PayDate");

        boolean isValidSignature = verifySignature(request);

        if (!isValidSignature) {
            response.getWriter().print("Invalid signature !");
            return;
        }

        request.setAttribute("vnp_TxnRef", vnp_TxnRef);
        request.setAttribute("vnp_Amount", vnp_Amount);
        request.setAttribute("vnp_PayDate", vnp_PayDate);
        if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
            request.getRequestDispatcher("/common/payment-success.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/common/payment-fail.jsp").forward(request, response);
        }

    }

    private boolean verifySignature(HttpServletRequest request) throws UnsupportedEncodingException {

        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = ConfigVNPAY.hashAllFields(fields);

        return signValue.equals(vnp_SecureHash);
    }

}
