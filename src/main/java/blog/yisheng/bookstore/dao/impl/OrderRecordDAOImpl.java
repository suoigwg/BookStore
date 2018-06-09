package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.ConnectionFactory;
import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.BaseEntity;
import blog.yisheng.bookstore.entity.OrderRecord;
import blog.yisheng.bookstore.exception.MethodNotImplemented;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

public class OrderRecordDAOImpl implements EntityDAO {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.bookdaoimpl");
    private JDBConnection conn = null;

    private ArrayList<OrderRecord> recordSerializer(ResultSet resultSet) {
        ArrayList<OrderRecord> orderRecords = new ArrayList<OrderRecord>();
        try {
            while (resultSet.next()) {
                OrderRecord record = new OrderRecord();
                record.setId(resultSet.getInt("id"));
                record.setAmount(resultSet.getInt("amount"));
                record.setOrderID(resultSet.getInt("orderid"));
                orderRecords.add(record);
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return orderRecords;
    }

    public OrderRecordDAOImpl() {
        logger = Logger.getLogger("blog.yisheng.bookstore.bookdaoimpl");
        conn = ConnectionFactory.getConnection();
    }


    @Override
    public void add(BaseEntity obj) {
        OrderRecord orderRecord = (OrderRecord) obj;
        String sql = "insert into orderDetail (orderid, id, amount) values" +
                "(?,?,?)";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, orderRecord.getId());
            preparedStatement.setInt(2, orderRecord.getOrderID());
            preparedStatement.setInt(3, orderRecord.getAmount());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public void delete(BaseEntity obj) {
        logger.warning("Deletion of order is not supported");
    }

    @Override
    public void update(BaseEntity obj) {
        logger.warning("Change of a placed order is not supported");
    }

    @Override
    public BaseEntity retrieve(String id) throws Exception {
        throw new MethodNotImplemented();
    }

    public ArrayList<OrderRecord> getOrderDetail(int orderid) {
        ArrayList<OrderRecord> orderRecords = new ArrayList<OrderRecord>();
        String sql = "select * from orderdetail where orderid = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderid);
            ResultSet resultSet = stmt.executeQuery();
            orderRecords = recordSerializer(resultSet);
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return orderRecords;
    }
}
