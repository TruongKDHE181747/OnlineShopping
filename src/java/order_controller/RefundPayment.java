/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package order_controller;

import com.google.gson.JsonObject;
import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;
import org.json.JSONObject;
import utils.ConfigVNPAY;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RefundPayment", urlPatterns = {"/refundpayment"})
public class RefundPayment extends HttpServlet {

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

        response.setContentType("application/json");
        String vnp_RequestId = ConfigVNPAY.getRandomNumber(8);
        String vnp_Version = "2.1.0";
        String vnp_Command = "refund";
        String vnp_TmnCode = ConfigVNPAY.vnp_TmnCode;
        String vnp_TransactionType = "02";
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        long amount = Long.parseLong(request.getParameter("amount")) * 100;
        String vnp_Amount = String.valueOf(amount);
        String vnp_OrderInfo = "Hoan tien GD OrderId:" + vnp_TxnRef;
        String vnp_TransactionDate = request.getParameter("vnp_CreateDate");
        String vnp_CreateBy = request.getParameter("vnp_CreateBy");

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        String vnp_IpAddr = ConfigVNPAY.getIpAddress(request);

        JsonObject vnp_Params = new JsonObject();
        vnp_Params.addProperty("vnp_RequestId", vnp_RequestId);
        vnp_Params.addProperty("vnp_Version", vnp_Version);
        vnp_Params.addProperty("vnp_Command", vnp_Command);
        vnp_Params.addProperty("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.addProperty("vnp_TransactionType", vnp_TransactionType);
        vnp_Params.addProperty("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.addProperty("vnp_Amount", vnp_Amount);
        vnp_Params.addProperty("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.addProperty("vnp_TransactionDate", vnp_TransactionDate);
        vnp_Params.addProperty("vnp_CreateBy", vnp_CreateBy);
        vnp_Params.addProperty("vnp_CreateDate", vnp_CreateDate);
        vnp_Params.addProperty("vnp_IpAddr", vnp_IpAddr);

        String hash_Data = String.join("|", vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
                vnp_TransactionType, vnp_TxnRef, vnp_Amount, "", vnp_TransactionDate,
                vnp_CreateBy, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);

        String vnp_SecureHash = ConfigVNPAY.hmacSHA512(ConfigVNPAY.secretKey, hash_Data);
        vnp_Params.addProperty("vnp_SecureHash", vnp_SecureHash);

        URL url = new URL(ConfigVNPAY.vnp_ApiUrl);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoOutput(true);

        try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
            wr.writeBytes(vnp_Params.toString());
            wr.flush();
            wr.close();
        }

        int responseCode = con.getResponseCode();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                StringBuilder responseVNPAY = new StringBuilder();
                String output;
                while ((output = in.readLine()) != null) {
                    responseVNPAY.append(output);
                }

                JSONObject obj = new JSONObject(responseVNPAY.toString());
                if ("00".equals(obj.getString("vnp_ResponseCode"))) {
                    String vnp_TransactionStatus = obj.getString("vnp_TransactionStatus");
                    int paymentStatus = "00".equals(vnp_TransactionStatus) ? 6 : ("05".equals(vnp_TransactionStatus) ? 5 : -1);

                    if (paymentStatus != -1) {
                        OrderDAO orderDAO = new OrderDAO();
                        orderDAO.updatePaymentStatus(vnp_TxnRef, paymentStatus);
                        session.setAttribute("refundMsg", "Yêu cầu hoàn tiền thành công.");

                    } else {
                        session.setAttribute("refundMsg", "Yêu cầu hoàn tiền thất bại. Vui lòng thử lại sau.");
                    }
                } else {
                    session.setAttribute("refundMsg", "Lỗi phản hồi VNPay.");

                }
            }
        } else {
            session.setAttribute("refundMsg", "Không thể kết nối với VNPay, mã lỗi: " + responseCode);
        }

        response.sendRedirect(request.getContextPath() + "/orderdetail?orderId=" + request.getParameter("orderId"));
        
    }

}
