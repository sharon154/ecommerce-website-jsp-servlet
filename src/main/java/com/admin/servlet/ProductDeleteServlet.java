package com.admin.servlet;

import com.dao.ProductDaoImpl;
import com.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete")
public class ProductDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int product_id = Integer.parseInt(req.getParameter("product_id"));

            ProductDaoImpl dao = new ProductDaoImpl(DBConnection.getConnection());

            boolean f = dao.deleteProducts(product_id);

            HttpSession session = req.getSession();

            if (f) {

                session.setAttribute("successMsg", "Product Deleted Successfully!");
                resp.sendRedirect("admin/viewall_product.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on the server");
                resp.sendRedirect("admin/viewall_product.jsp");

            }
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }
    }

}
