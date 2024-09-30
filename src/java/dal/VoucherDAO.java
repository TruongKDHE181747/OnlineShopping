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
public class VoucherDAO extends DBContext{
    public List<Voucher> getAllVoucher(){
        List<Voucher> vlist= new ArrayList<>();    
        String sql = "select * from Voucher";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int voucher_id=rs.getInt("voucher_id");
                String voucher_name=rs.getString("voucher_name");
                String description=rs.getString("description");
                String start_date=rs.getString("start_date");
                String end_date=rs.getString("end_date");
                int quantity=rs.getInt("quantity");
                int percent=rs.getInt("percent");
                int is_active=rs.getInt("is_active");
                Voucher v= new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active);
                vlist.add(v);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }    
        return vlist;
                
    }
    public List<Voucher> getVoucherPaging(int index){
        List<Voucher> vlist= new ArrayList<>();
        String sql="select * from Voucher\n" +
                    " order by voucher_id\n" +
                    " offset ? row fetch next 5 rows only";
        try{
            PreparedStatement pre= connection.prepareStatement(sql);
              pre.setInt(1, (index-1)*5);
            ResultSet rs=pre.executeQuery();
            while(rs.next()){
                int voucher_id=rs.getInt("voucher_id");
                String voucher_name=rs.getString("voucher_name");
                String description=rs.getString("description");
                String start_date=rs.getString("start_date");
                String end_date=rs.getString("end_date");
                int quantity=rs.getInt("quantity");
                int percent=rs.getInt("percent");
                int is_active=rs.getInt("is_active");
                Voucher v= new Voucher(voucher_id, voucher_name, description, start_date, end_date, quantity, percent, is_active);
                vlist.add(v);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return vlist;
    }
    public void addVoucher(Voucher v){
        try {
            String sql = "INSERT INTO Voucher (\n" +
                        "    voucher_name,\n" +
                        "    [description],\n" +
                        "    [start_date],\n" +
                        "    [end_date],\n" +
                        "    quantity,\n" +
                        "    [percent],\n" +
                        "    is_active\n" +
                        ") \n" +
                        "VALUES\n" +
                        "	(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, v.getVoucher_name());
            pre.setString(2, v.getDescription());
            pre.setString(3, v.getStart_date());
            pre.setString(4, v.getEnd_date());
            pre.setInt(5, v.getQuantity());
            pre.setInt(6, v.getPercent());
            pre.setInt(7, v.getIs_active());
           pre.executeUpdate();

        } catch(Exception e){
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        VoucherDAO vdao= new VoucherDAO();
        List<Voucher> vlist=vdao.getVoucherPaging(1);
        System.out.println(vlist);
    }
}
