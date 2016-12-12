package ch.ysyang.ecommerce;
import java.sql.*;
/**
 * Created by ysyang on 10/12/2016.
 */


public class JDBConnection {
    private final String url = "jdbc:mysql://localhost:3306/BookStore";
    private final String userName = "finley";
    private final String password = "password";
    private Connection con = null;


    public JDBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.print("Connection established!");
        } catch (Exception ex) {
            System.out.println("");
        }
    }

    private Connection createConnection() {
        try {
            con = DriverManager.getConnection(url, userName, password);
            con.setAutoCommit(true);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("createConnectionError!");
        }
        return con;
    }


    public int executeUpdate(String sql) {
        int iCount;
        if (con == null) {
            createConnection();
        }
        try {
            Statement stmt = con.createStatement();
            iCount = stmt.executeUpdate(sql);
            System.out.println("Affected row: " + String.valueOf(iCount));
            return iCount;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeUpdaterError!");
            return 0;
        }

    }


    public ResultSet executeQuery(String sql) {
        ResultSet rs;
        System.out.print(sql);
        try {
            if (con == null) {
                createConnection();
            }
            Statement stmt = con.createStatement();
            try {
                rs = stmt.executeQuery(sql);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeQueryError!");
            return null;
        }
        return rs;
    }

    public boolean isContained(String sql){
        ResultSet resultSet = executeQuery(sql);
        try {
            if (!resultSet.next()){
                return false;
            }
            else{
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void closeConnection() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(); //To change body of catch statement use File | Settings | File Templates.
                System.out.println("Failed to close connection!");
            } finally {
                con = null;
            }
        }
    }

}

