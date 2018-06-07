package blog.yisheng.bookstore.core;

import blog.yisheng.bookstore.db.JDBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by ysyang on 10/12/2016.
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    private String username = "";

    boolean check(String email, String password) throws SQLException {
        String sql = "select password from user where email = '" + email + "'";
        ResultSet resultSet = JDBConnection.executeQuery(sql);
        if (resultSet.getString("password") == null)
            return false;
        return resultSet.getString("password").equals(password);
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            if (check(email, password)) {
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("email",email);

                response.sendRedirect(request.getContextPath()+"/login_success.jsp");
//                response.sendRedirect(request.getContextPath()+"/login_success.jsp");
            }
            else{
                PrintWriter out = response.getWriter();
                out.print("Authentification Error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

}
