package blog.yisheng.bookstore.servlet;

import blog.yisheng.bookstore.dao.impl.BookDAOImpl;
import blog.yisheng.bookstore.dao.impl.CartDAOImpl;
import blog.yisheng.bookstore.entity.Book;
import blog.yisheng.bookstore.entity.Cart;
import blog.yisheng.bookstore.exception.EntityNotFoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.servlet.cartcontroller");

    private boolean isParaComplete(HttpServletRequest req) {
        if (req.getParameter("id") == null) {
            logger.warning("missing id in cart request");
            return false;
        }
        if (req.getParameter("amount") == null) {
            logger.warning("missing amount in cart request");
            return false;
        }
        if (req.getParameter("action") == null) {
            logger.warning("missing action in cart request");
            return false;
        }
        if (req.getParameter("username") == null) {
            logger.warning("missing username in cart request");
            return false;
        }
        return true;

    }

    private void addItem(HttpServletRequest req, Cart cart, String id, int amount) {
        BookDAOImpl bookDAO = new BookDAOImpl();
        try {
            Book book = (Book) bookDAO.retrieve(id);
            cart.addItem(book, amount);
        } catch (EntityNotFoundException e) {
            logger.info(e.getMessage());
        }
        CartDAOImpl cartDAO = new CartDAOImpl();
        cartDAO.update(cart);
    }

    private void deleteItem(HttpServletRequest req, Cart cart, String id, int amount) {
        BookDAOImpl bookDAO = new BookDAOImpl();
        try {
            Book book = (Book) bookDAO.retrieve(id);
            cart.removeItem(book, amount);
        } catch (EntityNotFoundException e) {
            logger.info(e.getMessage());
        }
        CartDAOImpl cartDAO = new CartDAOImpl();
        cartDAO.update(cart);
    }

    private void clear(HttpServletRequest req, Cart cart) {
        CartDAOImpl cartDAO = new CartDAOImpl();
        cartDAO.delete(cart);
    }

    private void printCart(HttpServletResponse resp, Cart cart) {
        try {
            PrintWriter printWriter = resp.getWriter();
            HashMap<Book, Integer> items = cart.getCartItems();
            for (Map.Entry<Book, Integer> item : items.entrySet()) {
                printWriter.print(item.getKey() + ":" + item.getValue());
            }
        } catch (IOException e) {
            logger.warning(e.getMessage());
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isParaComplete(req)) {
            Object c = req.getSession().getAttribute("cart");
            Cart cart = null;
            if (c != null) {
                cart = (Cart) c;
            } else {
                cart = new Cart();
                cart.setUsername(req.getParameter("username"));
            }
            String action = req.getParameter("action");
            int amount = Integer.parseInt(req.getParameter("amount"));
            String id = req.getParameter("id");
            switch (action) {
                case "add":
                    addItem(req, cart, id, amount);
                    break;
                case "delete":
                    deleteItem(req, cart, id, amount);
                    break;
                case "clear":
                    clear(req, cart);
                    break;
            }
            req.getSession().setAttribute("cart", cart);
        } else {
            logger.warning("insufficient argument for cart operation");
        }
    }
}
