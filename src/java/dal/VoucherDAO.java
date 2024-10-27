/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Voucher;

/**
 *
 * @author 84983
 */
public class VoucherDAO extends DBContext {

    public boolean updateVoucherQuantity(int voucherId, int quantity) {
        String sql = """
                     UPDATE [dbo].[Voucher]
                        SET 
                           [quantity] = ?
                      WHERE [voucher_id] = ?""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, voucherId);
            ps.setInt(1, quantity);

            int n = ps.executeUpdate();

            return n > 0;
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public List<Voucher> getAllVoucher() {
        List<Voucher> vlist = new ArrayList<>();
        String sql = "select * from Voucher";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int voucher_id = rs.getInt("voucher_id");
                String voucher_name = rs.getString("voucher_name");
                String description = rs.getString("description");
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                int quantity = rs.getInt("quantity");
                int percent = rs.getInt("percent");
                int is_active = rs.getInt("is_active");
                String voucher_code = rs.getString("voucher_code");
                Voucher v = new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active, voucher_code);
                vlist.add(v);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vlist;

    }

    public List<Voucher> getVoucherPaging(int index) {
        List<Voucher> vlist = new ArrayList<>();
        String sql = "select * from Voucher\n"
                + " order by voucher_id\n"
                + " offset ? row fetch next 5 rows only";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 5);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int voucher_id = rs.getInt("voucher_id");
                String voucher_name = rs.getString("voucher_name");
                String description = rs.getString("description");
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                int quantity = rs.getInt("quantity");
                int percent = rs.getInt("percent");
                int is_active = rs.getInt("is_active");
                String voucher_code = rs.getString("voucher_code");
                Voucher v = new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active, voucher_code);
                vlist.add(v);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vlist;
    }

    public void addVoucher(Voucher v) {
        try {
            String sql = "INSERT INTO Voucher (\n"
                    + "    voucher_name,\n"
                    + "    [description],\n"
                    + "    [start_date],\n"
                    + "    [end_date],\n"
                    + "    quantity,\n"
                    + "    [percent],\n"
                    + "    is_active,\n"
                    + "	voucher_code\n"
                    + ") \n"
                    + "VALUES\n"
                    + "	(?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, v.getVoucher_name());
            pre.setString(2, v.getDescription());
            pre.setString(3, v.getStart_date());
            pre.setString(4, v.getEnd_date());
            pre.setInt(5, v.getQuantity());
            pre.setInt(6, v.getPercent());
            pre.setInt(7, v.getIs_active());
            pre.setString(8, v.getVoucher_code());
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Voucher> searchVoucher(String sql) {
        List<Voucher> vlist = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int voucher_id = rs.getInt("voucher_id");
                String voucher_name = rs.getString("voucher_name");
                String description = rs.getString("description");
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                int quantity = rs.getInt("quantity");
                int percent = rs.getInt("percent");
                int is_active = rs.getInt("is_active");
                String voucher_code = rs.getString("voucher_code");
                Voucher v = new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active, voucher_code);
                vlist.add(v);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vlist;
    }

    public Voucher getVoucherbyId(int voucher_id) {
        Voucher v = null;
        String sql = "select * from Voucher\n"
                + " where voucher_id= ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, voucher_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                voucher_id = rs.getInt("voucher_id");
                String voucher_name = rs.getString("voucher_name");
                String description = rs.getString("description");
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                int quantity = rs.getInt("quantity");
                int percent = rs.getInt("percent");
                int is_active = rs.getInt("is_active");
                String voucher_code = rs.getString("voucher_code");
                v = new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active, voucher_code);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return v;
    }

    public void editVoucher(Voucher v) {
        try {
            String sql = "Update Voucher set \n"
                    + "voucher_name= ?,\n"
                    + "description=?,\n"
                    + "start_date=?,\n"
                    + "end_date=?,\n"
                    + "quantity=?,\n"
                    + "[percent] = ?,\n"
                    + "is_active=?,\n"
                    + "voucher_code=?\n"
                    + "where voucher_id=?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, v.getVoucher_name());
            pre.setString(2, v.getDescription());
            pre.setString(3, v.getStart_date());
            pre.setString(4, v.getEnd_date());
            pre.setInt(5, v.getQuantity());
            pre.setInt(6, v.getPercent());
            pre.setInt(7, v.getIs_active());
            pre.setString(8, v.getVoucher_code());
            pre.setInt(9, v.getVoucher_id());
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Voucher getVoucherbyCode(String code) {
        Voucher v = null;
        String sql = "select * from Voucher\n"
                + " where voucher_code = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, code);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int voucher_id = rs.getInt("voucher_id");
                String voucher_name = rs.getString("voucher_name");
                String description = rs.getString("description");
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                int quantity = rs.getInt("quantity");
                int percent = rs.getInt("percent");
                int is_active = rs.getInt("is_active");
                String voucher_code = rs.getString("voucher_code");
                v = new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active, voucher_code);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return v;
    }

    public void updateStatus() {
        try {
            String sql = "UPDATE Voucher SET is_active = 0 WHERE end_date <= GETDATE()";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
//    public static void main(String[] args) {
//        VoucherDAO vdao = new VoucherDAO();
//        Voucher vlist = vdao.getVoucherbyId(1);
//        System.out.println(vlist);
//    }
}
