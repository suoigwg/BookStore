package ch.ysyang.ecommerce;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by ysyang on 12/12/2016.
 */
@WebServlet(name = "DeleteBook", urlPatterns = {"/delete"})
public class DeleteBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object obj = request.getSession().getAttribute("username");
        PrintWriter out = response.getWriter();
        if(obj==null){
            out.print("You haven't logged in yet");
            response.sendRedirect(request.getContextPath()+"index.jsp");
        }else{
            String id = request.getParameter("id");
            String update = "delete  from book where id = "+id;
            JDBConnection con = new JDBConnection();
            int row = con.executeUpdate(update);
            if (row > 0){
                out.print("Delete Succeed!");
                response.sendRedirect(request.getContextPath()+"manage.jsp");
            }
            else {
                out.print("Delete Fail!");
            }
        }

    }
}
