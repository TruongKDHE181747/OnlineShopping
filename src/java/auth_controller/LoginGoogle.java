/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package auth_controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.GoogleUser;
import model.Role;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import utils.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginGoogle", urlPatterns = {"/loginGoogle"})
public class LoginGoogle extends HttpServlet {

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

        HttpSession session = request.getSession(true);

        UserDAO userDAO = new UserDAO();

        String code = request.getParameter("code");
        String accessToken = getToken(code);
        GoogleUser ggUser = getUserInfo(accessToken);

        //user with this googleId not exist, insert new user
        if (!userDAO.checkExistGoogleId(ggUser.getId())) {

            boolean checkExistEmail = userDAO.checkExistEmail(ggUser.getEmail());

            /*if user already registed with this email, update googleId
            so user can login with both method*/
            if (checkExistEmail) {

                userDAO.updateGoogleId(ggUser.getId(), ggUser.getEmail());

            } else {
                //username is google id
                User newUser = new User(ggUser.getId(), null, ggUser.getFamily_name(), ggUser.getGiven_name(), null, ggUser.getEmail(), true, null, null, null, ggUser.getId(), ggUser.getPicture(), true, false, new Role(5));

                userDAO.insertUser(newUser);
            }
        }

        User user = userDAO.loginGoogle(ggUser.getId());

        session.setAttribute("account", user);

        response.sendRedirect(request.getContextPath() + "/homeslider");

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleUser getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        GoogleUser googlePojo = new Gson().fromJson(response, GoogleUser.class);

        return googlePojo;
    }

}
