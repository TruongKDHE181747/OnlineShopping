/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.CustomerAddress;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CustomerAddressDAO extends DBContext {

    public boolean updateAllDefaultToFalse(int customerId){
        String sql = """
                     UPDATE [dbo].[Customer_Addresses]
                        SET 
                           [is_default] = ?
                      WHERE [customer_id] = ?""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, false);
            ps.setInt(2, customerId);

            int exe = ps.executeUpdate();

            if (exe > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        
        return false;
    }
    
    
    public boolean checkDefaultAddress(int customerId) {
        String sql = """
                     select * 
                     from Customer_Addresses
                     where customer_id = ? and is_default = ?
                     """;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerId);
            ps.setBoolean(2, true);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerAddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean checkAddressExist(CustomerAddress customerAdress) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Customer_Addresses]
                       WHERE [address] = ?
                           and [province_id] = ?
                           and [province_name] = ?
                           and [district_id] = ?
                           and[district_name] = ?
                          and [ward_code] = ?
                          and [ward_name] = ?
                           and[phone] = ?
                          and [receiver_name] = ?
                          and [customer_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customerAdress.getAddress());
            ps.setInt(2, customerAdress.getProvince_id());
            ps.setString(3, customerAdress.getProvince_name());
            ps.setInt(4, customerAdress.getDistrict_id());
            ps.setString(5, customerAdress.getDistrict_name());
            ps.setString(6, customerAdress.getWard_code());
            ps.setString(7, customerAdress.getWard_name());
            ps.setString(8, customerAdress.getPhone());
            ps.setString(9, customerAdress.getReceiver_name());
            ps.setInt(10, customerAdress.getCustomer_id());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerAddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insertCustomerAddress(CustomerAddress customerAdress) {
        String sql = """
                     INSERT INTO [dbo].[Customer_Addresses]
                                ([address]
                                ,[province_id]
                                ,[province_name]
                                ,[district_id]
                                ,[district_name]
                                ,[ward_code]
                                ,[ward_name]
                                ,[phone]
                                ,[receiver_name]
                                ,[is_default]
                                ,[customer_id])
                          VALUES
                                (?,?,?,?,?,?,?,?,?,?,?)""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customerAdress.getAddress());
            ps.setInt(2, customerAdress.getProvince_id());
            ps.setString(3, customerAdress.getProvince_name());
            ps.setInt(4, customerAdress.getDistrict_id());
            ps.setString(5, customerAdress.getDistrict_name());
            ps.setString(6, customerAdress.getWard_code());
            ps.setString(7, customerAdress.getWard_name());
            ps.setString(8, customerAdress.getPhone());
            ps.setString(9, customerAdress.getReceiver_name());
            ps.setBoolean(10, customerAdress.isIs_default());
            ps.setInt(11, customerAdress.getCustomer_id());

            int exe = ps.executeUpdate();

            if (exe > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public List<CustomerAddress> getAddressByCustomerId(int customerId) {
        String sql = "Select * from [Customer_Addresses] where [customer_id] = ? order by is_default desc";
        List<CustomerAddress> list = new ArrayList<>();
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int customer_addresses_id = rs.getInt(1);
                String address = rs.getString(2);
                int province_id = rs.getInt(3);
                String province_name = rs.getString(4);
                int district_id = rs.getInt(5);
                String district_name = rs.getString(6);
                String ward_code = rs.getString(7);
                String ward_name = rs.getString(8);
                String phone = rs.getString(9);
                String receiver_name = rs.getString(10);
                boolean is_default = rs.getBoolean(11);
                int customer_id = rs.getInt(12);

                list.add(new CustomerAddress(customer_addresses_id, address, province_id, province_name, district_id, district_name, ward_code, ward_name, phone, receiver_name, is_default, customer_id));
            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(CustomerAddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
