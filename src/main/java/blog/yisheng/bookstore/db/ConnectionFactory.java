package blog.yisheng.bookstore.db;

public class ConnectionFactory {
    private static JDBConnection connection = null;

    private ConnectionFactory() {
        if (connection == null)
            connection = new JDBConnection();
    }

    public static JDBConnection getConnection() {
        if (connection == null)
            connection = new JDBConnection();
        return connection;
    }
}
