/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package order_controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import model.Order;
import model.OrderDetail;
import org.json.JSONArray;
import org.json.JSONObject;
import utils.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateOrderGHN", urlPatterns = {"/createorderghn"})
public class CreateOrderGHN extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

        int orderId;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
            return;
        }

        Order order = orderDAO.getOrderById(orderId);

        int codAmount = 0;

        if (order.getPaymentMethodId() == 1) {
            codAmount = order.getTotalAmount();
        }

        try {

            JSONArray itemsArray = new JSONArray();
            for (OrderDetail item : orderDetailDAO.getOrderDetailByOrderId(orderId)) {
                JSONObject itemObject = new JSONObject()
                        .put("name", item.getProductName())
                        .put("quantity", item.getQuantity())
                        .put("price", item.getUnitPrice());
                itemsArray.put(itemObject);
            }

            String requestBody = new JSONObject()
                    .put("to_name", order.getReceiverName())
                    .put("to_phone", order.getPhone())
                    .put("to_address", order.getAddress())
                    .put("to_ward_code", order.getWardCode())
                    .put("to_district_id", order.getDistrictId())
                    .put("cod_amount", codAmount)
                    .put("weight", order.getTotalGram())
                    .put("length", 0)
                    .put("width", 0)
                    .put("height", 0)
                    .put("service_type_id", 2)
                    .put("payment_type_id", 1)
                    .put("required_note", "CHOXEMHANGKHONGTHU")
                    .put("items", itemsArray)
                    .toString();

            URL url = new URL("https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/create");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");
            connection.setRequestProperty("token", Constants.GHN_API_KEY);
            connection.setRequestProperty("shop_id", Constants.GHN_SHOP_ID);
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            connection.setDoOutput(true);

            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = requestBody.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();

            InputStream inputStream = responseCode >= 200 && responseCode < 300
                    ? connection.getInputStream()
                    : connection.getErrorStream();

            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
            StringBuilder responseBuilder = new StringBuilder();
            String responseLine;

            while ((responseLine = reader.readLine()) != null) {
                responseBuilder.append(responseLine.trim());
            }

            String responseBody = responseBuilder.toString();

            JSONObject jsonResponse = new JSONObject(responseBody);

            
            if (responseCode == HttpURLConnection.HTTP_OK) {

                String shippingCode = jsonResponse.getJSONObject("data").getString("order_code");
                orderDAO.updateShippingCode(orderId, shippingCode);
                orderDAO.updateOrderStatus(orderId, 3);
                session.setAttribute("notify", "Tạo đơn vận chuyển thành công. Mã vận đơn: " + shippingCode);
                response.sendRedirect(request.getContextPath() + "/orderdetail?orderId=" + orderId);

            } else {
                String msgGHN = jsonResponse.getString("code_message_value");
                session.setAttribute("notify", "Tạo đơn vận chuyển thất bại. " + msgGHN);
                response.sendRedirect(request.getContextPath() + "/orderdetail?orderId=" + orderId);

            }

        } catch (Exception ex) {

        }
    }

}
