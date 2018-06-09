package blog.yisheng.bookstore.dao.impl;

import blog.yisheng.bookstore.dao.EntityDAO;
import blog.yisheng.bookstore.db.ConnectionFactory;
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
        conn = ConnectionFactory.getConnection();
    }

    private ArrayList<Book> bookSerializer(ResultSet resultSet) {
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            while (resultSet.next()) {
                Book book = new Book();
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setISBN(resultSet.getString("isbn"));
                book.setPress(resultSet.getString("press"));
                book.setPrice(resultSet.getDouble("price"));
                book.setStock(resultSet.getInt("stock"));
                book.setID(resultSet.getInt("id"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            logger.info("Empty result set");
        }
        return bookList;

    }

    @Override
    public void add(BaseEntity obj) {
        Book book = (Book) obj;
        String sql = "insert into Book (title, isbn, price, stock, press, author)" +
                "values (?,?,?,?,?,?);";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getISBN());
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
            preparedStatement.setString(1, book.getISBN());
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
            preparedStatement.setString(2, book.getISBN());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setInt(4, book.getStock());
            preparedStatement.setString(5, book.getPress());
            preparedStatement.setString(6, book.getAuthor());
            preparedStatement.setString(7, book.getISBN());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
    }


    public ArrayList<Book> listEntities() {
        String sql = "select * from book;";
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            ResultSet resultSet = conn.executeQuery(sql);
            bookList = bookSerializer(resultSet);
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
            preparedStatement.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                book = new Book();
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setISBN(resultSet.getString("isbn"));
                book.setPress(resultSet.getString("press"));
                book.setPrice(resultSet.getDouble("price"));
                book.setStock(resultSet.getInt("stock"));
                book.setID(resultSet.getInt("id"));
            } else {
                throw new EntityNotFoundException("Book with id " + id + " not found!");
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return book;
    }

    public ArrayList<Book> searchBooks(String keyword) {
        String sql = "select * from Book where title like ?";
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet resultSet = stmt.executeQuery();
            bookList = bookSerializer(resultSet);
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        }
        return bookList;
    }
}
