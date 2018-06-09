package blog.yisheng.bookstore.servlet;

import blog.yisheng.bookstore.dao.impl.CartDAOImpl;
import blog.yisheng.bookstore.dao.impl.OrderDAOImpl;
import blog.yisheng.bookstore.dao.impl.OrderRecordDAOImpl;
import blog.yisheng.bookstore.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;


@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {
    private Logger logger = Logger.getLogger("blog.yisheng.bookstore.servlet.orderController");

    public boolean isParaComplete(HttpServletRequest req) {
        if (req.getParameter("address") == null) {
            logger.warning("missing amount in address request");
            return false;
        }
        if (req.getParameter("mobile") == null) {
            logger.warning("missing action in mobile request");
            return false;
        }
        if (req.getParameter("receiver") == null) {
            logger.warning("missing receiver in receiver request");
            return false;
        }
        return true;

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isParaComplete(req)) {
            Cart cart = null;
            Object c = req.getSession().getAttribute("cart");
            if (c != null) {
                cart = (Cart) req.getSession().getAttribute("cart");
                int mobile = Integer.parseInt(req.getParameter("mobile"));
                User user = (User) req.getSession().getAttribute("user");
                String username = user.getUsername();
                String address = req.getParameter("address");
                String receiver = req.getParameter("receiver");
                Date orderDate = new Date();
                Order order = new Order(mobile, username, address, receiver, orderDate);
                OrderDAOImpl orderDAO = new OrderDAOImpl();
                orderDAO.add(order);
                HashMap<Book, Integer> items = cart.getCartItems();
                int orderID = orderDAO.getRecentOrderID(username, orderDate);
                OrderRecordDAOImpl orderRecordDAO = new OrderRecordDAOImpl();
                assert (orderID != -1);
                for (Map.Entry<Book, Integer> item : items.entrySet()) {
                    OrderRecord orderRecord = new OrderRecord(orderID, item.getKey().getID(), item.getValue());
                    orderRecordDAO.add(orderRecord);
                    logger.info("inserting " + item.getKey() + ":" + item.getValue());
                }
                req.getRequestDispatcher("orderlist.jsp").forward(req, resp);
                cart.clear();
                CartDAOImpl cartDAO = new CartDAOImpl();
                cartDAO.delete(cart);
                req.getSession().setAttribute("cart", cart);
            } else {
                logger.severe("Placing order with no cart");
            }
        }

    }
}
