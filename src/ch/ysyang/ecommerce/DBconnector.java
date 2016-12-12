package ch.ysyang.ecommerce;

import java.sql.*;

/**
 * Created by ysyang on 10/12/2016.
 */
public class DBconnector {

    public static void main(String args[]) throws Exception{
        String url ="jdbc:mysql://localhost:3306/Ecommerce";
        String username = "finley";
        String password = "password";
        Connection cont = DriverManager.getConnection(url,username,password);

        Statement stmt = cont.createStatement();
        String sql = "select * from User";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()){
            System.out.print(rs.getString("e-mail"));
        }
    }
}
