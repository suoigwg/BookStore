package blog.yisheng.bookstore.servlet;

import blog.yisheng.bookstore.dao.impl.CartDAOImpl;
import blog.yisheng.bookstore.dao.impl.UserDAOImpl;
import blog.yisheng.bookstore.entity.Cart;
import blog.yisheng.bookstore.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAOImpl userDAO = new UserDAOImpl();
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        User newUser = new User(req.getParameter("username"), req.getParameter("password"), "");
        if (userDAO.checkCredentials(newUser)) {
            req.getSession().setAttribute("user", newUser);
            CartDAOImpl cartDAO = new CartDAOImpl();
            try {
                Cart cart = (Cart) cartDAO.retrieve(newUser.getUsername());
                req.getSession().setAttribute("cart", cart);
            } catch (Exception e) {
                out.print(e.getMessage());
            }
            req.getRequestDispatcher("login_success.jsp").forward(req, resp);
            out.println("login success");
        } else {
            out.println("bad credentials");
        }
    }
}
