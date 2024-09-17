/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

public class UserDAO extends DBContext {

    public boolean checkExistUsername(String username) {

        ResultSet rs = getData("select * from Users where username = '" + username + "'");

        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public boolean checkExistEmail(String email) {

        ResultSet rs = getData("select * from Users where email = '" + email + "'");

        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public User getUserById(int id) {
        RoleDAO roleDAO = new RoleDAO();
        ResultSet rs = getData("select * from Users where user_id = " + id);
        User user = null;
        try {
            if (rs.next()) {
                int user_id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String first_name = rs.getString(4);
                String last_name = rs.getString(5);
                String phone = rs.getString(6);
                String email = rs.getString(7);
                boolean gender = rs.getBoolean(8);
                String dob = rs.getString(9);
                String reset_password_code = rs.getString(10);
                String google_id = rs.getString(11);
                String profile_picture_url = rs.getString(12);
                boolean is_active = rs.getBoolean(13);
                boolean is_banned = rs.getBoolean(14);
                Role role = roleDAO.getRoleById(rs.getInt(15));
                user = new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;

    }

    public ArrayList<User> getUsers(String sql) {
        ArrayList<User> listUsers = new ArrayList<>();
        RoleDAO roleDAO = new RoleDAO();
        try {
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                int user_id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String first_name = rs.getString(4);
                String last_name = rs.getString(5);
                String phone = rs.getString(6);
                String email = rs.getString(7);
                boolean gender = rs.getBoolean(8);
                String dob = rs.getString(9);
                String reset_password_code = rs.getString(10);
                String google_id = rs.getString(11);
                String profile_picture_url = rs.getString(12);
                boolean is_active = rs.getBoolean(13);
                boolean is_banned = rs.getBoolean(14);
                Role role = roleDAO.getRoleById(rs.getInt(15));

                listUsers.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));

            }

            rs.close();
            statement.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listUsers;
    }

}
