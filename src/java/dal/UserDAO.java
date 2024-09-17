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

    public void insertUser(User user) {
        String sql = """
                     INSERT INTO [dbo].[Users]
                                ([username]
                                ,[password]
                                ,[first_name]
                                ,[last_name]
                                ,[phone]
                                ,[email]
                                ,[gender]
                                ,[dob]
                                ,[verification_code]
                                ,[reset_password_code]
                                ,[google_id]
                                ,[profile_picture_url]
                                ,[is_active]
                                ,[is_banned]
                                ,[role_id])
                          VALUES
                                (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirst_name());
            ps.setString(4, user.getLast_name());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getEmail());
            ps.setBoolean(7, user.isGender());
            ps.setString(8, user.getDob());
            ps.setString(9, user.getVerification_code());
            ps.setString(10, user.getReset_password_code());
            ps.setString(11, user.getGoogle_id());
            ps.setString(12, user.getProfile_picture_url());
            ps.setBoolean(13, user.isIs_active());
            ps.setBoolean(14, user.isIs_banned());
            ps.setInt(15, user.getRole().getRole_id());
            
            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

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
                String verification_code = rs.getString(10);
                String reset_password_code = rs.getString(11);
                String google_id = rs.getString(12);
                String profile_picture_url = rs.getString(13);
                boolean is_active = rs.getBoolean(14);
                boolean is_banned = rs.getBoolean(15);
                Role role = roleDAO.getRoleById(rs.getInt(16));
                user = new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role);
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
                String verification_code = rs.getString(10);
                String reset_password_code = rs.getString(11);
                String google_id = rs.getString(12);
                String profile_picture_url = rs.getString(13);
                boolean is_active = rs.getBoolean(14);
                boolean is_banned = rs.getBoolean(15);
                Role role = roleDAO.getRoleById(rs.getInt(16));

                listUsers.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));

            }

            rs.close();
            statement.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listUsers;
    }

}
