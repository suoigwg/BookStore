package blog.yisheng.bookstore.servlet;

import blog.yisheng.bookstore.dao.impl.UserDAOImpl;
import blog.yisheng.bookstore.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAOImpl userDAO = new UserDAOImpl();
        PrintWriter out = resp.getWriter();
        User newUser = new User(req.getParameter("username"), req.getParameter("password"),
                req.getParameter("email"));
        if (userDAO.isUserExist(newUser)) {
            out.println("username/email already exists");
        } else {
            userDAO.add(newUser);
            out.println("success");
        }
    }
}
