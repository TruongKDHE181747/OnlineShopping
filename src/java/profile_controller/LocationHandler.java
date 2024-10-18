/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package profile_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.JSONArray;
import org.json.JSONObject;
import utils.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LocationHandler", urlPatterns = {"/location"})
public class LocationHandler extends HttpServlet {

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
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        if ("getProvinces".equals(action)) {
            String apiResponse = callGHNAPI("https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province");
            out.write(parseProvinces(apiResponse));
            
        } else if ("getDistricts".equals(action)) {
            String provinceId = request.getParameter("provinceId");
            String apiResponse = callGHNAPI("https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=" + provinceId);
            out.write(parseDistricts(apiResponse));
            
        } else if ("getWards".equals(action)) {
            String districtId = request.getParameter("districtId");
            String apiResponse = callGHNAPI("https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=" + districtId);
            out.write(parseWards(apiResponse));
            
        }
        
    }
    
    private String callGHNAPI(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Token", Constants.GHN_API_KEY);
        
        InputStream responseStream = connection.getInputStream();
        Scanner scanner = new Scanner(new InputStreamReader(responseStream, "UTF-8")).useDelimiter("\\A");
        
        return scanner.hasNext() ? scanner.next() : "";
    }
    
    private String parseProvinces(String jsonResponse) {
        JSONObject obj = new JSONObject(jsonResponse);
        JSONArray provinces = obj.getJSONArray("data");

       
        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Select Province</option>");
        
        for (int i = 0; i < provinces.length(); i++) {
            JSONObject province = provinces.getJSONObject(i);
            options.append("<option value='").append(province.getInt("ProvinceID")).append("#").append(province.getString("ProvinceName")).append("'>")
                    .append(province.getString("ProvinceName")).append("</option>");
        }
        return options.toString();
    }
    
    private String parseDistricts(String jsonResponse) {
        JSONObject obj = new JSONObject(jsonResponse);
        JSONArray districts = obj.getJSONArray("data");


        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Select District</option>");
        
        for (int i = 0; i < districts.length(); i++) {
            JSONObject district = districts.getJSONObject(i);
            options.append("<option value='").append(district.getInt("DistrictID")).append("#").append(district.getString("DistrictName")).append("'>")
                    .append(district.getString("DistrictName")).append("</option>");
        }
        return options.toString();
    }
    
    private String parseWards(String jsonResponse) {
        JSONObject obj = new JSONObject(jsonResponse);
        JSONArray wards = obj.getJSONArray("data");


        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Select Ward</option>");
        
        for (int i = 0; i < wards.length(); i++) {
            JSONObject ward = wards.getJSONObject(i);
            options.append("<option value='").append(ward.getString("WardCode")).append("#").append(ward.getString("WardName")).append("'>")
                    .append(ward.getString("WardName")).append("</option>");
        }
        return options.toString();
    }
    
}
