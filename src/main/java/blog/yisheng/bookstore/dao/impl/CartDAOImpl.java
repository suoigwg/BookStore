package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.ConnectionFactory;
import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.BaseEntity;
import blog.yisheng.bookstore.entity.Book;
import blog.yisheng.bookstore.entity.Cart;
import blog.yisheng.bookstore.exception.MethodNotImplemented;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

public class CartDAOImpl implements EntityDAO {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.cartdaoImpl");
    private JDBConnection conn = null;


    public CartDAOImpl() {
        conn = ConnectionFactory.getConnection();
    }

    @Override
    public void add(BaseEntity obj) {
        Cart cart = (Cart) obj;
        HashMap<Book, Integer> itemList = cart.getCartItems();
        for (Map.Entry<Book, Integer> item : itemList.entrySet()) {
            String sql = "insert into cart (username, id, amount) values" +
                    "(?, ?, ?)";
            try {
                logger.info(cart.getUsername() + item.getKey() + item.getValue());
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, cart.getUsername());
                stmt.setInt(2, item.getKey().getID());
                stmt.setInt(3, item.getValue());
                stmt.executeUpdate();
            } catch (SQLException e) {
                logger.severe(e.getMessage());
            }
        }
    }

    @Override
    public void delete(BaseEntity obj) {
        Cart cart = (Cart) obj;
        String sql = "delete from Cart where username = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cart.getUsername());
            int row = stmt.executeUpdate();
            logger.info(row + " records deleted from cart");
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public void update(BaseEntity obj) {
        Cart cart = (Cart) obj;
        delete(cart);
        add(cart);
    }

    @Override
    public BaseEntity retrieve(String id) throws Exception {
        throw new MethodNotImplemented();
    }
}
