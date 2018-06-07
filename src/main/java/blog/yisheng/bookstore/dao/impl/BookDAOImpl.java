package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.BaseEntity;
import blog.yisheng.bookstore.entity.Book;
import blog.yisheng.bookstore.exception.EntityNotFoundException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

public class BookDAOImpl implements EntityDAO {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.bookdaoimpl");
    private JDBConnection conn = null;

    public BookDAOImpl() {
        conn = new JDBConnection();
    }

    @Override
    public void add(BaseEntity obj) {
        Book book = (Book) obj;
        String sql = "insert into Book (title, isbn, price, stock, press, author)" +
                "values (?,?,?,?,?,?);";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getISBN());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setInt(4, book.getStock());
            preparedStatement.setString(5, book.getPress());
            preparedStatement.setString(6, book.getAuthor());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }

    }

    @Override
    public void delete(BaseEntity obj) {
        Book book = (Book) obj;
        String sql = "delete from book where isbn = ?;";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, book.getISBN());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public void update(BaseEntity obj) {
        Book book = (Book) obj;
        String sql = "update book set title = ?, isbn = ?, price = ?," +
                "stock = ?, press = ?, author = ? where isbn = ?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getISBN());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setInt(4, book.getStock());
            preparedStatement.setString(5, book.getPress());
            preparedStatement.setString(6, book.getAuthor());
            preparedStatement.setInt(7, book.getISBN());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }

    @Override
    public ArrayList<BaseEntity> listEntities() {
        String sql = "select * from book;";
        ArrayList<BaseEntity> bookList = new ArrayList<BaseEntity>();
        try {
            ResultSet resultSet = conn.executeQuery(sql);
            while (resultSet.next()) {
                Book book = new Book();
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setISBN(resultSet.getInt("isbn"));
                book.setPress(resultSet.getString("press"));
                book.setPrice(resultSet.getDouble("price"));
                book.setStock(resultSet.getInt("stock"));
                book.setID(resultSet.getInt("id"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return bookList;
    }

    @Override
    public BaseEntity retrieve(String id) throws EntityNotFoundException {
        String sql = "select * from book where id = ?;";
        Book book = null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.getFetchSize() == 0)
                throw new EntityNotFoundException("Book with id " + id + " not found!");
            while (resultSet.next()) {
                book = new Book();
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setISBN(resultSet.getInt("isbn"));
                book.setPress(resultSet.getString("press"));
                book.setPrice(resultSet.getDouble("price"));
                book.setStock(resultSet.getInt("stock"));
                book.setID(resultSet.getInt("id"));
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return book;
    }
}
