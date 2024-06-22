package com.user.servlet;

import com.dao.CartDaoImpl;
import com.db.DBConnection;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove_cart")
public class CartRemove extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cartId = Integer.parseInt(req.getParameter("cartId"));
        int userId = ((User) req.getSession().getAttribute("userobj")).getId();

        CartDaoImpl dao = new CartDaoImpl(DBConnection.getConnection());
        boolean f = dao.deleteProduct(cartId, userId);

        HttpSession session = req.getSession();
        if (f) {
            //System.out.println("Removed from Cart");
            session.setAttribute("successMsg", "Product Removed from Cart Successfully");
            resp.sendRedirect("cart.jsp");
        } else {
            //System.out.println("Not Added to Cart");
            session.setAttribute("failedMsg", "Something wrong on the server");
            resp.sendRedirect("cart.jsp");
        }

    }

}
