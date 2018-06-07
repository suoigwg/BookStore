package blog.yisheng.bookstore.dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ysyang on 12/12/2016.
 */
@WebServlet(name = "AddBook", urlPatterns = {"/addbook"})
public class AddBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String bookname = request.getParameter("title");
//        String isbn = request.getParameter("isbn");
//        String price = request.getParameter("price");
//        String amount = request.getParameter("amount");
//        String press = request.getParameter("press");
//        String author = request.getParameter("author");
//
//        JDBConnection con = new JDBConnection();
//        String query1 = "SELECT max(ID) as mxid FROM Book";
//        ResultSet resultSet = con.executeQuery(query1);
//        Integer maxid = 1;
//        try {
//            if (resultSet.next()){
//                maxid += resultSet.getInt("mxid");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        String update = "insert into book value (" + maxid +",'"+bookname+"','"+isbn+"',"+price+","+amount+",'"+press+"','"+author+"')";
//        System.out.print(update);
//        int ar = con.executeUpdate(update);
//        if (ar>0){
//            System.out.print("Insert succeed!");
//            response.sendRedirect(request.getContextPath()+"manage.jsp");
//        }
//        else {
//            System.out.print("Insert fail!");
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
