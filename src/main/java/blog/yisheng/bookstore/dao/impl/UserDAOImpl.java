package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.BaseEntity;
import blog.yisheng.bookstore.entity.User;
import blog.yisheng.bookstore.exception.MethodNotImplemented;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

public class UserDAOImpl implements EntityDAO {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.bookdaoimpl");
    private JDBConnection conn = null;

    public UserDAOImpl() {
        conn = new JDBConnection();
    }

    @Override
    public void add(BaseEntity obj) {
        User user = (User) obj;
        String sql = "insert into user (username, password, email)" +
                "values (?,?,?);";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }

    }

    @Override
    public void delete(BaseEntity obj) {
        User user = (User) obj;
        String sql = "delete from book where isbn = ?;";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public void update(BaseEntity obj) {
        User user = (User) obj;
        String sql = "update User set password = ? where email = ?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public ArrayList<BaseEntity> listEntities() {
        String sql = "select * from User;";
        ArrayList<BaseEntity> userList = new ArrayList<BaseEntity>();
        try {
            ResultSet resultSet = conn.executeQuery(sql);
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                userList.add(user);
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return userList;
    }

    @Override
    public BaseEntity retrieve(String id) throws Exception {
        throw new MethodNotImplemented();
    }

    public boolean isUserExist(User user) {
        String sql = "select * from User where email = ? or username = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUsername());
            ResultSet resultSet = stmt.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return false;
    }

    public boolean checkCredentials(User user) {
        String sql = "select * from User where email = ? and password = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            ResultSet resultSet = stmt.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return false;
    }
}
