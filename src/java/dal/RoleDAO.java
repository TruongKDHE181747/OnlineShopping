/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Role;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RoleDAO extends DBContext {

    public Role getRoleById(int id) {

        ResultSet rs = getData("select * from Roles where role_id = " + id);

        Role role = null;
        try {
            if (rs.next()) {
                int role_id = rs.getInt(1);
                String rolename = rs.getString(2);
                role = new Role(role_id, rolename);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
    }
    
    

}
