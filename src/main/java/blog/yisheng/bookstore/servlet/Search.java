package blog.yisheng.bookstore.servlet;


import blog.yisheng.bookstore.dao.impl.BookDAOImpl;
import blog.yisheng.bookstore.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Search", urlPatterns = {"/search"})

public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        BookDAOImpl bookDAO = new BookDAOImpl();
        ArrayList<Book> searchResult = (ArrayList<Book>) bookDAO.searchBooks(keyword);
        req.setAttribute("result", searchResult);
        req.getRequestDispatcher("search.jsp").forward(req, resp);

    }
}
