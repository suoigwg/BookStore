package ch.ysyang.ecommerce;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by ysyang on 12/12/2016.
 */
public class BookDAO {
    public static Book getElementByID(String s) {
        if (s.equals("")) return null;
        int id = Integer.parseInt(s);
        JDBConnection con = new JDBConnection();
        String sql = "select * from Book where ID = "+ s;
        Book book = new Book();
        ResultSet resultSet = con.executeQuery(sql);
//            System.out.print(resultSet.getString("BookName"));
        try{
            if (resultSet.next()){
                book.setID(id);
                book.setBookName(resultSet.getString("BookName"));
                book.setAuthor(resultSet.getString("Author"));
                book.setISBN(resultSet.getString("ISBN"));
                book.setPress(resultSet.getString("Press"));
                book.setPrice(Double.parseDouble(resultSet.getString("Price")));
                book.setAmount(Integer.parseInt(resultSet.getString("Amount")));
            }
        }catch (Exception e){
            System.out.print("Try block failed");
            e.printStackTrace();
        }
        System.out.println(book.getBookName());
        return book;
    }

    public ArrayList<Book> getRecentViewList(String cookie){
        ArrayList<Book> recentViewed = new ArrayList<Book>();
        if (cookie.equals("")) return recentViewed;
        String[] view = cookie.split("#");
        for (String s: view){
            recentViewed.add(getElementByID(s));
        }
        while (recentViewed.size() > 5){
            recentViewed.remove(0);
        }
        Collections.reverse(recentViewed);
        return recentViewed;
    }
    public static void main(String args[]){
        Book b = getElementByID("1");
        System.out.print(b.getBookName());
    }
}

