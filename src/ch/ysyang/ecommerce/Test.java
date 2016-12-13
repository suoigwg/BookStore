package ch.ysyang.ecommerce;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ysyang on 10/12/2016.
 */
public class Test {
    public static void main(String  args[]){
        JDBConnection con = new JDBConnection();
        ResultSet resultSet = con.executeQuery("select * from user");
        try {
            while (resultSet.next()){
                System.out.print(resultSet.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
