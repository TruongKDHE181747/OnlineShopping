/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.*;


public class DBContext {

    protected Connection connection;

    public DBContext() {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=SWP391";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            //System.out.println("Connect successful");
        } catch (ClassNotFoundException | SQLException ex) {
            //System.out.println("Connect fail");
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        Statement statement;
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return rs;
    }
    
//    public static void main(String[] args) {
//        DBContext db = new DBContext();
//    }

//public static void main(String[] args) {
//        double price = 2000000;
//        Locale locale = new Locale("vi", "VN");
//        Currency currency = Currency.getInstance("VND");
//
//        DecimalFormatSymbols df = DecimalFormatSymbols.getInstance(locale);
//        df.setCurrency(currency);
//        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
//        numberFormat.setCurrency(currency);
//        String cmoney = numberFormat.format(price);
//        
//    }
}
