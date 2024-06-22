
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

@MultipartConfig
@WebServlet("/edit_products")
public class ProductEditServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int product_id=Integer.parseInt(req.getParameter("product_id"));
            String product_name = req.getParameter("pname");
            String description = req.getParameter("pdescription");
            String category = req.getParameter("pCategory");
            String price = req.getParameter("pPrice");
            String status = req.getParameter("pStatus");
            String quantity = req.getParameter("pQuantity");
            //Part part = req.getPart("pimg");
            //String filename = part.getSubmittedFileName();

            ProductDetails p = new ProductDetails();
            
            p.setProduct_id(product_id);
            p.setProduct_name(product_name);
            p.setDescription(description);
            p.setPrice(price);
            p.setCategory(category);
            p.setStatus(status);
            p.setQuantity(quantity);
            //p.setImageName(filename);
            
            ProductDaoImpl dao= new ProductDaoImpl(DBConnection.getConnection());
            
            boolean f = dao.updateProductDetails(p);

            HttpSession session = req.getSession();

            if (f) {
                //String path = getServletContext().getRealPath("") + "product";
                //File file = new File(path);

                //part.write(path + File.separator + filename);

                session.setAttribute("successMsg", "Product Updated Successfully!");
                resp.sendRedirect("admin/viewall_product.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on the server");
                resp.sendRedirect("admin/viewall_product.jsp");

            }

        }catch(Exception e) {
            e.printStackTrace();
        }
    
    }
    
    
}
