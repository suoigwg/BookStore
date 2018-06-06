package blog.yisheng.bookstore.core;

import blog.yisheng.bookstore.db.JDBConnection;
import blog.yisheng.bookstore.entity.Book;
import blog.yisheng.bookstore.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;


/**
 * Created by ysyang on 12/12/2016.
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    private void showOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher(request.getContextPath()+"orderdetail.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receiver = request.getParameter("receiver");
        String address  = request.getParameter("address");
        String mobile   = request.getParameter("mobile");
        String email = (String) request.getSession().getAttribute("email");
        if (email == null){
            response.sendRedirect(request.getContextPath()+"login.jsp");
            return;
        }
        Date date = new Date();
        Cart c = null;
        if (request.getSession().getAttribute("cart")!= null){
            c =(Cart) request.getSession().getAttribute("cart");
        }
        else {
            System.out.print("Cart empty");
            return;
        }
        Order o = new Order();
        o.setAddress(address);
        o.setReceiver(receiver);
        o.setMobile(Integer.parseInt(mobile));
        o.setOrderDate(date);
        o.setEmail(email);
        o.setItemList(c.getCartItems());
        Integer orderid = new Integer("1");

        JDBConnection con = new JDBConnection();
        String sql1 = "select max(orderid) as oid from `Order`";
        try {
            ResultSet resultSet = con.executeQuery(sql1);
            if (!resultSet.next()){

            }
            else{
                orderid = resultSet.getInt("oid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Connection pcon = con.getConnection();
        String sql2 = "insert into `Order` value (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = pcon.prepareStatement(sql2);
            ps.setInt(1, ++orderid);
            ps.setString(2, email);
            ps.setTimestamp(3, new Timestamp(date.getTime()));
            ps.setString(4, address);
            ps.setInt(5, new Integer(mobile));
            ps.setString(6, receiver);
            System.out.print(ps.toString());
            int al = ps.executeUpdate();
            if (al > 0){
                System.out.println("Insert succeed!");
                System.out.println("Inserting order detail");
                HashMap<Book, Integer> itemList = c.getCartItems();
                Set<Book> booklist = itemList.keySet();
                Iterator<Book> bookListIterator = booklist.iterator();
                Collection<Integer> amountList = itemList.values();
                Iterator<Integer> amountIterator = amountList.iterator();
                while (bookListIterator.hasNext()){
                    String sql = "insert into orderdetail value(?,?,?)";
                    Book b = (Book) bookListIterator.next();
                    try {
                        PreparedStatement prestmt = pcon.prepareStatement(sql);
                        prestmt.setInt(1,orderid);
                        prestmt.setInt(2,b.getID());
                        prestmt.setInt(3,amountIterator.next());
                        prestmt.executeUpdate();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }
                request.getRequestDispatcher(request.getContextPath()+"orderdetail.jsp").forward(request,response);

            }else {
                System.out.print("Insert failed!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
