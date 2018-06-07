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

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAOImpl userDAO = new UserDAOImpl();
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        User newUser = new User("", req.getParameter("password"),
                req.getParameter("email"));
        if (userDAO.checkCredentials(newUser)) {
            req.getSession().setAttribute("username", newUser.getUsername());
            req.getSession().setAttribute("email", newUser.getEmail());
            req.getRequestDispatcher("login_success.jsp").forward(req, resp);
            out.println("login success");
        } else {
            out.println("bad credentials");
        }
    }
}
