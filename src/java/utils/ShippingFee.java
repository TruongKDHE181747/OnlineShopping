/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class ShippingFee {

    public static int caculateShippingFee(String wardCode, int districtId,int weight) throws IOException {
        
        
        String apiURL = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";

        URL url = new URL(apiURL);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Token", Constants.GHN_API_KEY);
        connection.setRequestProperty("shop_id", Constants.GHN_SHOP_ID);
        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        connection.setDoOutput(true);

        String requestBody = new JSONObject()
            .put("service_id", 53321)
            .put("weight", weight)
            .put("to_ward_code", wardCode)
            .put("to_district_id", districtId)
            .toString();

        try (OutputStream os = connection.getOutputStream()) {
            os.write(requestBody.getBytes("UTF-8"));
        }

        InputStream responseStream = connection.getInputStream();
        Scanner scanner = new Scanner(new InputStreamReader(responseStream, "UTF-8")).useDelimiter("\\A");

        
        String jsonResponse = scanner.hasNext() ? scanner.next() : "";
        scanner.close();
        responseStream.close();
        
        JSONObject obj = new JSONObject(jsonResponse);
        
        int total = obj.getJSONObject("data").getInt("total");
        
        return total;
    }

}
