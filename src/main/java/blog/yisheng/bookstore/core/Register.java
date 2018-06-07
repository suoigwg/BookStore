package blog.yisheng.bookstore.core;

import blog.yisheng.bookstore.db.JDBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by ysyang on 11/12/2016.
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    boolean hasEmailExist(String email){
        String sql = "select * from User where email = '"+email+"'";
        JDBConnection con = new JDBConnection();
        return con.isContained(sql);
    }

    private boolean insertUserdata(String email, String password, String username){
        String sql = "insert into User (username, password, email) values ('" + username + "','" + password + "','" + email + "')";
        JDBConnection con = new JDBConnection();
        return con.executeUpdate(sql) > 0;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pw    = request.getParameter("password");
        String username = request.getParameter("username");
        PrintWriter out = response.getWriter();
        if (hasEmailExist(email)){
            out.print("The email has been registered !");
        }
        else {
            if(insertUserdata(email,pw,username)){
                out.println("Register success!");
                out.print("An Email has been send to your mailbox at "+ email);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            else{
                out.print("Register fail!");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("works");
    }
}
