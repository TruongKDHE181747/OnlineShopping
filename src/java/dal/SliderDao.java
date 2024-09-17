  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Slider;

/**
 *
 * @author quanpyke
 */
public class SliderDao extends DBContext{
      public ArrayList<Slider> getAllSliders() {
        ArrayList<Slider> list = new ArrayList<>();
        String sql = "select * from Sliders";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("slider_id");
                 String description=rs.getString("description");
                 String img=rs.getString("image_url");
                 int status=rs.getInt("is_active");
               Slider s=new Slider(id, description, img, status);
                 list.add(s);
            }

        } catch (SQLException e) {
            System.out.println("e");
        }

        return list;
      }
}
      
   
