package ch.ysyang.ecommerce;

import java.sql.*;

/**
 * Created by ysyang on 10/12/2016.
 */
public class DBconnector {

    public static void main(String args[]) throws Exception{
        String url ="jdbc:mysql://115.159.143.108:3306/BookDB";
        String username = "dbp";
        String password = "";
        Connection cont = DriverManager.getConnection(url,username,password);

        Statement stmt = cont.createStatement();
        String sql = "select * from User";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()){
            System.out.print(rs.getString("e-mail"));
        }
    }
}
