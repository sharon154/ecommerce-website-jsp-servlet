package com.user.servlet;

import com.dao.CartDaoImpl;
import com.dao.ProductDaoImpl;
import com.db.DBConnection;
import com.entity.Cart;
import com.entity.ProductDetails;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int product_id = Integer.parseInt(req.getParameter("product_id"));
            int id = Integer.parseInt(req.getParameter("id"));

            int quantity = Integer.parseInt(req.getParameter("productQuantity"));

            ProductDaoImpl dao = new ProductDaoImpl(DBConnection.getConnection());
            ProductDetails p = dao.getProductById(product_id);

            Cart c = new Cart();
            ProductDetails productDetails = new ProductDetails(); // Assuming you have a way to create this object
            productDetails.setProduct_id(product_id); // Set the id in ProductDetails

            User user = new User(); // Assuming you have a way to create this object
            user.setId(id); // Set the id in User

            c.setProduct_id(productDetails);
            c.setId(user);
            c.setProduct_name(p.getProduct_name());
            c.setDescription(p.getDescription());
            c.setPrice(Double.parseDouble(p.getPrice()));
            c.setQuantity(quantity); // Set the quantity
            c.setTotal_amount(quantity * Double.parseDouble(p.getPrice())); // Calculate total amount based on quantity and price

            CartDaoImpl dao2 = new CartDaoImpl(DBConnection.getConnection());
            boolean f = dao2.addtoCart(c);

            HttpSession session = req.getSession();
            if (f) {
                //resp.sendRedirect("cartcheckout.jsp");
                //System.out.println("Added to Cart");
                session.setAttribute("successMsg", "Product Added to Cart Successfully");
                resp.sendRedirect("view_detail.jsp?product_id=" + product_id);
            } else {
                //System.out.println("Not Added to Cart");
                //resp.sendRedirect("view_detail.jsp");
                session.setAttribute("failedMsg", "Something wrong on the server");
                resp.sendRedirect("view_detail.jsp?product_id=" + product_id);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

    }

}
