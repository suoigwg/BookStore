package blog.yisheng.bookstore.dao;

import blog.yisheng.bookstore.entity.Book;
import blog.yisheng.bookstore.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ysyang on 12/12/2016.
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cartservlet"})
public class CartServlet extends HttpServlet {
    private boolean addItem(String bookid, String amt,HttpServletRequest request, HttpServletResponse response){
        Cart c =null;
        if (request.getSession().getAttribute("cart") == null){
            c = new Cart();
        }
        else{
            c =(Cart) request.getSession().getAttribute("cart");
        }
        BookDAO bd = new BookDAO();
        Book b =  bd.getElementByID(bookid);
        if (b != null){
            Integer amount = new Integer(amt);
            c.addItem(b, amount);
        }
        request.getSession().setAttribute("cart",c);
        return true;
    }

    private boolean removeItem(String bookid, String amt,HttpServletRequest request, HttpServletResponse response){
        Cart c =null;
        if (request.getSession().getAttribute("cart") == null){
            return false;
        }
        else{
            c =(Cart) request.getSession().getAttribute("cart");
        }
        BookDAO bd = new BookDAO();
        Book b =  bd.getElementByID(bookid);
        if (b != null){
            Integer amount = new Integer(amt);
            c.removeItem(b,amount);
        }
        request.getSession().setAttribute("cart",c);
        return true;
    }

    private boolean emptyCart(HttpServletRequest request, HttpServletResponse response){
        request.getSession().setAttribute("cart",null);
        return true;
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print(request.getParameter("bookid"));
        System.out.print(request.getParameter("buyamount"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        String amt = request.getParameter("buyamount");
        String action = request.getParameter("action");
        if (action != null){
            if (action.equals("add")){
                if(addItem(bookid, amt, request, response)){
                    request.getRequestDispatcher(request.getContextPath()+"cart.jsp").forward(request,response);
                }
            }

            if (action.equals("remove")){
                if(removeItem(bookid, amt, request, response)){
                    request.getRequestDispatcher(request.getContextPath()+"cart.jsp").forward(request,response);
                }
            }

            if (action.equals("removeone")){
                if (removeItem(bookid, "1", request, response)){
                    request.getRequestDispatcher(request.getContextPath()+"cart.jsp").forward(request,response);
                }
            }

            if (action.equals("addone")){
                if (addItem(bookid, "1", request, response)){
                    request.getRequestDispatcher(request.getContextPath()+"cart.jsp").forward(request,response);
                }
            }

            if (action.equals("empty")){
                if (emptyCart(request, response)){
                    request.getRequestDispatcher(request.getContextPath()+"cart.jsp").forward(request,response);
                }
            }
            if (action.equals("pay")){
                request.getRequestDispatcher(request.getContextPath()+"order.jsp").forward(request,response);
            }
        }
    }
}
