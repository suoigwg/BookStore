package blog.yisheng.bookstore.db;

import java.sql.*;

/**
 * Created by ysyang on 10/12/2016.
 */


public class JDBConnection {
    private final static String url = "jdbc:sqlite:bookstore.sqlite";
    private static Connection conn = null;


    public JDBConnection() {

    }

    private static Connection createConnection() {
        try {
            conn = DriverManager.getConnection(url);
            conn.setAutoCommit(true);
            System.out.println("Connection established");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("createConnectionError!");
        }
        return conn;
    }

    public static Connection getConnection() {
        if (conn == null) {
            createConnection();
        }
        return conn;
    }

    public static int executeUpdate(String sql) {
        int iCount;
        if (conn == null) {
            createConnection();
        }
        try {
            Statement stmt = conn.createStatement();
            iCount = stmt.executeUpdate(sql);
            System.out.println("Affected row: " + String.valueOf(iCount));
            return iCount;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeUpdaterError!");
            return 0;
        }

    }


    public static ResultSet executeQuery(String sql) {
        ResultSet rs;
        System.out.println(sql);
        try {
            if (conn == null) {
                createConnection();
            }
            Statement stmt = conn.createStatement();
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
        try {
            System.out.println(rs.getFetchSize() + " record(s) retrieved");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }


    public boolean isContained(String sql) {
        ResultSet resultSet = executeQuery(sql);
        try {
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); //To change body of catch statement use File | Settings | File Templates.
                System.out.println("Failed to close connection!");
            } finally {
                conn = null;
            }
        }
    }

}

