package com.admin.servlet;

import com.dao.ProductDaoImpl;
import com.db.DBConnection;
import com.entity.ProductDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_products")
@MultipartConfig
public class ProductAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String product_name = req.getParameter("pname");
            String description = req.getParameter("pdescription");
            String category = req.getParameter("pCategory");
            String price = req.getParameter("pPrice");
            String status = req.getParameter("pStatus");
            String quantity = req.getParameter("pQuantity");
            Part part = req.getPart("pimg");
            String filename = part.getSubmittedFileName();

            ProductDetails p = new ProductDetails(product_name, description, category, price, status, quantity, filename);

            ProductDaoImpl dao = new ProductDaoImpl(DBConnection.getConnection());

            //System.out.println(path);
            boolean f = dao.addProducts(p);

            HttpSession session = req.getSession();

            if (f) {
                String path = getServletContext().getRealPath("") + "product";
                File file = new File(path);

                part.write(path + File.separator + filename);

                session.setAttribute("successMsg", "Product Added Successfully!");
                resp.sendRedirect("admin/add_product.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on the server");
                resp.sendRedirect("admin/add_product.jsp");

            }

            //System.out.println(p);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
