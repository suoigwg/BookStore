package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.ConnectionFactory;
import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.BaseEntity;
import blog.yisheng.bookstore.entity.OrderRecord;
import blog.yisheng.bookstore.exception.MethodNotImplemented;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

public class OrderRecordDAOImpl implements EntityDAO {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.bookdaoimpl");
    private JDBConnection conn = null;

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
}
