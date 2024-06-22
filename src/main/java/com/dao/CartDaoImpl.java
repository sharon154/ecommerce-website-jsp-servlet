package com.dao;

import com.entity.ProductDetails;
import com.entity.Cart;
import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {

    private final Connection con;
    PreparedStatement ps = null;

    public CartDaoImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public boolean addtoCart(Cart c) {
        boolean f = false;
        try {
            String query = "insert into cart(product_id,id,product_name,description,price,quantity,total_amount) values(?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, c.getProduct_id().getProduct_id());
            ps.setInt(2, c.getId().getId());
            ps.setString(3, c.getProduct_name());
            ps.setString(4, c.getDescription());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getQuantity());
            ps.setDouble(7, c.getTotal_amount());

            int inserted = ps.executeUpdate();
            if (inserted > 0) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cart> getProductByUser(int id) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        double totalAmount = 0;
        try {
            String query = "select * from cart where id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new Cart();
                c.setCartId(rs.getInt(1));

                ProductDetails productDetails = new ProductDetails();
                productDetails.setProduct_id(rs.getInt("product_id"));

                // Set the ProductDetails object to c
                c.setProduct_id(productDetails); // Assuming there is a setter method named setProductDetails in your Cart class

                User u = new User();
                u.setId(rs.getInt("id"));

                c.setId(u);

                c.setProduct_name(rs.getString(4));
                c.setDescription(rs.getString(5));
                c.setPrice(rs.getDouble(6));
                c.setQuantity(rs.getInt(7));
                c.setTotal_amount(rs.getDouble(8));
                /*
                totalAmount = totalAmount + rs.getDouble(8);
                c.setTotal_amount(totalAmount);
                 */
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean deleteProduct(int cartId, int id) {
        boolean f = false;
        try {
            String query = "delete from cart where cartId=? and id=?";
            ps = con.prepareStatement(query);

            ps.setInt(1, cartId);
            ps.setInt(2, id);

            int deleted = ps.executeUpdate();

            if (deleted > 0) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public Cart getCartById(int cartId, int id) {
        Cart c = null;

        try {
            String query = "select * from cart where cartId=? and id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, cartId);
            ps.setInt(2, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Cart();
                c.setCartId(rs.getInt(1));
                
                ProductDetails productDetails = new ProductDetails();
                productDetails.setProduct_id(rs.getInt("product_id"));

                // Set the ProductDetails object to c
                c.setProduct_id(productDetails); // Assuming there is a setter method named setProductDetails in your Cart class

                User u = new User();
                u.setId(rs.getInt("id"));

                c.setId(u);

                c.setProduct_name(rs.getString(4));
                c.setDescription(rs.getString(5));
                c.setPrice(rs.getDouble(6));
                c.setQuantity(rs.getInt(7));
                c.setTotal_amount(rs.getDouble(8));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

}
