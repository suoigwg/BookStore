package blog.yisheng.bookstore.servlet;

import blog.yisheng.bookstore.dao.impl.CartDAOImpl;
import blog.yisheng.bookstore.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "Logout", urlPatterns = {"/logout"})
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CartDAOImpl cartDAO = new CartDAOImpl();
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        cartDAO.add(cart);
        req.getSession().setAttribute("user", null);
        resp.sendRedirect("index.jsp");
    }

}
