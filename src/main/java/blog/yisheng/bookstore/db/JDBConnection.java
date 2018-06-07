package blog.yisheng.bookstore.db;

import java.sql.*;
import java.util.logging.Logger;

/**
 * Created by ysyang on 10/12/2016.
 */


public class JDBConnection {
    private final String url = "jdbc:sqlite:bookstore.sqlite";
    private Connection conn = null;
    Logger logger = Logger.getLogger("blog.yisheng.bookstore.db.jdbc");

    public JDBConnection() {
        try {
            conn = DriverManager.getConnection(url);
            conn.setAutoCommit(true);
            logger.info("Database connection established");
        } catch (SQLException e) {
            logger.severe("Fail to establish Database connection");
            logger.severe(e.getMessage());
        }
    }


    public Connection getConnection() {
        return conn;
    }

    public int executeUpdate(String sql) throws SQLException {
        logger.info("Executing " + sql);
        Statement stmt = conn.createStatement();
        int affectRows = stmt.executeUpdate(sql);
        logger.info(affectRows + " rows affected");
        return affectRows;
    }


    public ResultSet executeQuery(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        ResultSet resultSet = stmt.executeQuery(sql);
        logger.info("Executing " + sql);
        logger.info(resultSet.getFetchSize() + " record(s) affected");
        return resultSet;
    }

    public PreparedStatement preparedStatement(String sql) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement(sql);
        } catch (SQLException e) {
            logger.severe("Fail to prepare statement " + sql);
            logger.severe(e.getMessage());
        }
        return preparedStatement;
    }

    @Override
    protected void finalize() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                logger.severe("Error closing db connection");
                logger.severe(e.getMessage());
            }
        }
        conn = null;
    }


}

