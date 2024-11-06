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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

public class UserDAO extends DBContext {
    
    
    public boolean updateProfileImage(int userId, String img) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [profile_picture_url] = ?
                      WHERE [user_id] = ?""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, img);
            ps.setInt(2, userId);

            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    

    public boolean updateUserProfile(User user) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [first_name] = ?
                           ,[last_name] = ?
                           ,[phone] = ?
                           ,[gender] = ?
                           ,[dob] = ?       
                      WHERE [user_id] = ?""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFirst_name());
            ps.setString(2, user.getLast_name());
            ps.setString(3, user.getPhone());
            ps.setBoolean(4, user.isGender());
            ps.setString(5, user.getDob());
            ps.setInt(6, user.getUser_id());

            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }

    public boolean deleteResetCode(String email) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [reset_password_code] = null
                      WHERE [email] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateResetPassCode(String email, String resetCode) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [reset_password_code] = ?
                      WHERE [email] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, resetCode);
            ps.setString(2, email);

            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updatePassword(String email, String password) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [password] = ?
                      WHERE [email] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);

            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateVerifyCode(int user_id, String verifyCode) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [verification_code] = ?
                      WHERE [user_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, verifyCode);
            ps.setInt(2, user_id);

            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteVerifyCode(int userId) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [verification_code] = null
                      WHERE [user_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateGoogleId(String googleId, String email) {

        String sql = """
                     UPDATE [dbo].[Users]
                        SET [google_id] = ?
                      WHERE [email] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, googleId);
            ps.setString(2, email);
            int exe = ps.executeUpdate();
            if (exe > 0) {
                return true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User loginGoogle(String googleId) {
        RoleDAO roleDAO = new RoleDAO();
        String sql = "select * from Users where google_id = ?";
        User user = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, googleId);

            ResultSet rs = ps.executeQuery();
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
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public User login(String username, String password) {

        String sql = "select * from Users where username = ? and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return getUserByUsername(username);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkExistGoogleId(String google_id) {

        ResultSet rs = getData("select * from Users where google_id = '" + google_id + "'");

        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public boolean activateUser(String username) {
        boolean check = false;
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [is_active] = ?
                      WHERE [username] = ?""";

        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setString(2, username);

            int exe = ps.executeUpdate();
            if (exe > 0) {
                check = true;
            }
            ps.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return check;
    }

    public Integer insertUser(User user) {
        Integer userId = null;
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
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
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
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userId;
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

    
    public List<User> getAllSaler(){
        List<User> sList = new ArrayList<>();
        
        
            String sql = "select * from Users\n" +
                        "where role_id in (2,3)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                
                User user = new User(user_id, username, first_name, last_name);
                sList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }


        return sList;
    }
    
    
    public User getUserByEmail(String uemail) {
        RoleDAO roleDAO = new RoleDAO();
        ResultSet rs = getData("select * from Users where email = '" + uemail + "'");
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

    public User getUserByUsername(String uname) {
        RoleDAO roleDAO = new RoleDAO();
        ResultSet rs = getData("select * from Users where username = '" + uname + "'");
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
    public List<User> getALlUser(){
           List<User> list=new ArrayList();
           RoleDAO roledao =new RoleDAO();
           String sql="select u.*,r.rolename from Users u join Roles r\n" +
                    "on u.role_id=r.role_id";
        try{
            // thực thi câu truy vấn
            PreparedStatement pre= connection.prepareStatement(sql);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                boolean gender = rs.getBoolean("gender");
                String dob = rs.getString("dob");
                String verification_code = rs.getString("verification_code");
                String reset_password_code = rs.getString("reset_password_code");
                String google_id = rs.getString("google_id");
                String profile_picture_url = rs.getString("profile_picture_url");
                boolean is_active = rs.getBoolean("is_active");
                boolean is_banned = rs.getBoolean("is_banned");
                Role role = roledao.getRoleById(rs.getInt("role_id"));
                list.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));
            }
        }catch(Exception e){
        }
        return list;
           
       }
    public void edituser(User u){
        try {
            String sql = "Update Users set \n" +
                            "username = ?, \n" +
                            "first_name=?, \n" +
                            "last_name=?,\n" +
                            "phone=?,\n" +
                            "email=?,\n" +
                            "gender=?,\n" +
                            "dob=?,\n" +
                            "profile_picture_url=?,\n" +
                            "role_id=?\n" +
                            "where user_id=?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getFirst_name());
            pre.setString(3, u.getLast_name());
            pre.setString(4, u.getPhone());
            pre.setString(5, u.getEmail());
            pre.setBoolean(6, u.isGender());
            pre.setString(7, u.getDob());
            pre.setString(8, u.getProfile_picture_url());
            pre.setInt(9, u.getRole().getRole_id());
            pre.setInt(10, u.getUser_id());
           pre.executeUpdate();

        } catch (SQLException ex) {

        }
    }

    public List<User> getALlUserInRole(int role_id){
           List<User> list=new ArrayList();
           RoleDAO roledao =new RoleDAO();
           String sql="select * from Users \n" +
                        "where role_id =?";
        try{
            // thực thi câu truy vấn
            PreparedStatement pre= connection.prepareStatement(sql);
            pre.setInt(1, role_id);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                boolean gender = rs.getBoolean("gender");
                String dob = rs.getString("dob");
                String verification_code = rs.getString("verification_code");
                String reset_password_code = rs.getString("reset_password_code");
                String google_id = rs.getString("google_id");
                String profile_picture_url = rs.getString("profile_picture_url");
                boolean is_active = rs.getBoolean("is_active");
                boolean is_banned = rs.getBoolean("is_banned");
                Role role = roledao.getRoleById(rs.getInt("role_id"));
                list.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
           
       }
    public void addUser(User u){
        try {
            String sql = "insert into Users values\n" +
"(?, ?, ?, ?, ?, ?, ?,?,null,null,null,?,1,0,?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getPassword());
            pre.setString(3, u.getFirst_name());
            pre.setString(4, u.getLast_name());
            pre.setString(5, u.getPhone());
            pre.setString(6, u.getEmail());
            pre.setBoolean(7, u.isGender());
            pre.setString(8, u.getDob());
            pre.setString(9, u.getProfile_picture_url());
            pre.setInt(10, u.getRole().getRole_id());
           pre.executeUpdate();

        } catch (SQLException ex) {

        }
    }
    
    public ArrayList<User> searchCustomer(String search)
    {
           ArrayList<User> list=new ArrayList();
           RoleDAO roledao =new RoleDAO();
           String sql="Select * from Users where role_id=5 AND (first_name like ? OR last_name like ? "
                   + " OR Concat(first_name,' ', last_name) like ? ) ";
        try{
            // thực thi câu truy vấn
            PreparedStatement pre= connection.prepareStatement(sql);
              pre.setString(1, "%"+search+"%");
            pre.setString(2, "%"+search+"%");
              pre.setString(3, "%"+search+"%");
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                boolean gender = rs.getBoolean("gender");
                String dob = rs.getString("dob");
                String verification_code = rs.getString("verification_code");
                String reset_password_code = rs.getString("reset_password_code");
                String google_id = rs.getString("google_id");
                String profile_picture_url = rs.getString("profile_picture_url");
                boolean is_active = rs.getBoolean("is_active");
                boolean is_banned = rs.getBoolean("is_banned");
                Role role = roledao.getRoleById(rs.getInt("role_id"));
                list.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public List<User> searchUser(String search)
    {
           List<User> list=new ArrayList();
           RoleDAO roledao =new RoleDAO();
           String sql="SELECT * FROM Users\n" +
                        "WHERE username LIKE ? \n" +
                        "   OR first_name LIKE ? \n" +
                        "   OR last_name LIKE ?; ";
        try{
            // thực thi câu truy vấn
            PreparedStatement pre= connection.prepareStatement(sql);
              pre.setString(1, "%"+search+"%");
            pre.setString(2, "%"+search+"%");
            pre.setString(3, "%"+search+"%");
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                boolean gender = rs.getBoolean("gender");
                String dob = rs.getString("dob");
                String verification_code = rs.getString("verification_code");
                String reset_password_code = rs.getString("reset_password_code");
                String google_id = rs.getString("google_id");
                String profile_picture_url = rs.getString("profile_picture_url");
                boolean is_active = rs.getBoolean("is_active");
                boolean is_banned = rs.getBoolean("is_banned");
                Role role = roledao.getRoleById(rs.getInt("role_id"));
                list.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public List<User> getUserPaging(int index){
        List<User> list= new ArrayList<>();
        RoleDAO roledao =new RoleDAO();
           String sql=" select * from Users \n" +
                    " order by user_id\n" +
                    " offset ? rows fetch next 5 rows only ";
        try{
            // thực thi câu truy vấn
            PreparedStatement pre= connection.prepareStatement(sql);
              pre.setInt(1, (index-1)*5);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                boolean gender = rs.getBoolean("gender");
                String dob = rs.getString("dob");
                String verification_code = rs.getString("verification_code");
                String reset_password_code = rs.getString("reset_password_code");
                String google_id = rs.getString("google_id");
                String profile_picture_url = rs.getString("profile_picture_url");
                boolean is_active = rs.getBoolean("is_active");
                boolean is_banned = rs.getBoolean("is_banned");
                Role role = roledao.getRoleById(rs.getInt("role_id"));
                list.add(new User(user_id, username, password, first_name, last_name, phone, email, gender, dob, verification_code, reset_password_code, google_id, profile_picture_url, is_active, is_banned, role));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public void banAcc(int user_id,boolean is_banned){
        try{
            String sql="update Users\n" +
                    "set is_banned=?\n" +
                    "where user_id=?" ;
            PreparedStatement pre=connection.prepareStatement(sql);
            pre.setBoolean(1, is_banned);
            pre.setInt(2, user_id);
            pre.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public User getUserByUserId(int rid) {
        RoleDAO roleDAO = new RoleDAO();
        String sql = "select * from Users where user_id = ?";
        User user = null;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, rid);
            ResultSet rs = pre.executeQuery();
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
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;

    }
    public boolean checkExistPhone(String phone) {

        ResultSet rs = getData("select * from Users where phone = '" + phone + "'");

        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }
    
    public List<User> getListUserByRoleId(int rid) {
        RoleDAO roleDAO = new RoleDAO();
        List<User> list= new ArrayList<>();
        String sql = "select * from Users where role_id = ?";
        User user = null;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, rid);
            ResultSet rs = pre.executeQuery();
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
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
//    public static void main(String[] args) {
//        UserDAO u= new UserDAO();
//        Boolean check=u.checkExistPhone("0123456789");
//        System.out.println(check );
//    }
}
