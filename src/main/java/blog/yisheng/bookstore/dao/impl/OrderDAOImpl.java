package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.BaseEntity;
import blog.yisheng.bookstore.entity.Order;
import blog.yisheng.bookstore.entity.User;
import blog.yisheng.bookstore.exception.MethodNotImplemented;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

public class OrderDAOImpl implements EntityDAO {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.bookdaoimpl");
    private JDBConnection conn = null;

    private ArrayList<Order> orderSerializer(ResultSet resultSet) {
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            while (resultSet.next()) {
                Order order = new Order();
                order.setUsername(resultSet.getString("username"));
                order.setOrderID(resultSet.getInt("orderid"));
                order.setDate(resultSet.getDate("date"));
                order.setAddress(resultSet.getString("address"));
                order.setMobile(resultSet.getInt("mobile"));
                order.setReceiver(resultSet.getString("receiver"));
                orderList.add(order);
            }
        } catch (SQLException e) {
            logger.severe(e.getSQLState());
        }
        return orderList;
    }

    public OrderDAOImpl() {
        conn = new JDBConnection();
    }

    @Override
    public void add(BaseEntity obj) {
        Order order = (Order) obj;
        String sql = "insert into order (username, data, address, mobile, receiver)" +
                "values (?,?,?,?,?);";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, order.getUsername());
            preparedStatement.setDate(2, order.getDate());
            preparedStatement.setString(3, order.getAddress());
            preparedStatement.setInt(4, order.getMobile());
            preparedStatement.setString(5, order.getReceiver());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public void delete(BaseEntity obj) {
        logger.info("Order deletion is not supported");
    }

    @Override
    public void update(BaseEntity obj) {
        Order order = (Order) obj;
        String sql = "update order set address = ?, mobile = ?, receiver = ?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, order.getAddress());
            preparedStatement.setInt(2, order.getMobile());
            preparedStatement.setString(3, order.getReceiver());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public BaseEntity retrieve(String id) throws Exception {
        throw new MethodNotImplemented();
    }

    public ArrayList<Order> listOrders(User user) {
        String sql = "select * from order where username = ?";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            ResultSet resultSet = stmt.executeQuery();
            orderList = orderSerializer(resultSet);
        } catch (SQLException e) {
            logger.severe(e.getSQLState());
        }
        return orderList;
    }
}
