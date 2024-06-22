package com.dao;

import com.entity.ProductDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

    private final Connection con;
    PreparedStatement ps = null;

    public ProductDaoImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public boolean addProducts(ProductDetails p) {
        boolean f = false;
        try {
            String query = "insert into product_details(product_name,description,category,price,status,quantity,image) values(?,?,?,?,?,?,?)";

            ps = con.prepareStatement(query);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getCategory());
            ps.setString(4, p.getPrice());
            ps.setString(5, p.getStatus());
            ps.setString(6, p.getQuantity());
            ps.setString(7, p.getImageName());

            int inserted = ps.executeUpdate();
            if (inserted > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    @Override
    public List<ProductDetails> getAllProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;
        try {
            String query = "select * from product_details";
            ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductDetails();
                p.setProduct_id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setCategory(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setQuantity(rs.getString(7));
                p.setImageName(rs.getString(8));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ProductDetails getProductById(int product_id) {
        ProductDetails p = null;

        try {
            String query = "select * from product_details where product_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, product_id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductDetails();
                p.setProduct_id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setCategory(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setQuantity(rs.getString(7));
                p.setImageName(rs.getString(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public boolean updateProductDetails(ProductDetails p) {
        boolean f = false;
        try {
            String query = "update product_details set product_name=?, description=?, price=?, category=?, status=?, quantity=? where product_id=?";
            ps = con.prepareStatement(query);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getCategory());
            ps.setString(5, p.getStatus());
            ps.setString(6, p.getQuantity());
            //ps.setString(7,p.getImageName());
            ps.setInt(7, p.getProduct_id());

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
    public boolean deleteProducts(int product_id) {
        boolean f = false;
        try {
            String query = "delete from product_details where product_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, product_id);
            int inserted = ps.executeUpdate();
            if (inserted > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<ProductDetails> getWomenClothing() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;
        try {
            String query = "select * from product_details where category=? and status=?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Women's Clothing");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                p = new ProductDetails();
                p.setProduct_id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setCategory(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setQuantity(rs.getString(7));
                p.setImageName(rs.getString(8));
                list.add(p);
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getMenClothing() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p2 = null;
        try {
            String query = "select * from product_details where category=? and status=?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Men's Clothing");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                p2 = new ProductDetails();
                p2.setProduct_id(rs.getInt(1));
                p2.setProduct_name(rs.getString(2));
                p2.setDescription(rs.getString(3));
                p2.setCategory(rs.getString(4));
                p2.setPrice(rs.getString(5));
                p2.setStatus(rs.getString(6));
                p2.setQuantity(rs.getString(7));
                p2.setImageName(rs.getString(8));
                list.add(p2);
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getKidsClothing() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p3 = null;
        try {
            String query = "select * from product_details where category=? and status=?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Kid's Clothing");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                p3 = new ProductDetails();
                p3.setProduct_id(rs.getInt(1));
                p3.setProduct_name(rs.getString(2));
                p3.setDescription(rs.getString(3));
                p3.setCategory(rs.getString(4));
                p3.setPrice(rs.getString(5));
                p3.setStatus(rs.getString(6));
                p3.setQuantity(rs.getString(7));
                p3.setImageName(rs.getString(8));
                list.add(p3);
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getAllWomenClothing() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p4 = null;
        try {
            String query = "select * from product_details where category=? and status=?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Women's Clothing");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p4 = new ProductDetails();
                p4.setProduct_id(rs.getInt(1));
                p4.setProduct_name(rs.getString(2));
                p4.setDescription(rs.getString(3));
                p4.setCategory(rs.getString(4));
                p4.setPrice(rs.getString(5));
                p4.setStatus(rs.getString(6));
                p4.setQuantity(rs.getString(7));
                p4.setImageName(rs.getString(8));
                list.add(p4);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getAllMenClothing() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p5 = null;
        try {
            String query = "select * from product_details where category=? and status=?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Men's Clothing");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p5 = new ProductDetails();
                p5.setProduct_id(rs.getInt(1));
                p5.setProduct_name(rs.getString(2));
                p5.setDescription(rs.getString(3));
                p5.setCategory(rs.getString(4));
                p5.setPrice(rs.getString(5));
                p5.setStatus(rs.getString(6));
                p5.setQuantity(rs.getString(7));
                p5.setImageName(rs.getString(8));
                list.add(p5);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getAllKidsClothing() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p6 = null;
        try {
            String query = "select * from product_details where category=? and status=?";
            ps = con.prepareStatement(query);
            ps.setString(1, "Kid's Clothing");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p6 = new ProductDetails();
                p6.setProduct_id(rs.getInt(1));
                p6.setProduct_name(rs.getString(2));
                p6.setDescription(rs.getString(3));
                p6.setCategory(rs.getString(4));
                p6.setPrice(rs.getString(5));
                p6.setStatus(rs.getString(6));
                p6.setQuantity(rs.getString(7));
                p6.setImageName(rs.getString(8));
                list.add(p6);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getProductBySearch(String search) {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p7 = null;
        try {
            String query = "select * from product_details where product_name like ? or category like ? or description like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setString(3, "%" + search + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p7 = new ProductDetails();
                p7.setProduct_id(rs.getInt(1));
                p7.setProduct_name(rs.getString(2));
                p7.setDescription(rs.getString(3));
                p7.setCategory(rs.getString(4));
                p7.setPrice(rs.getString(5));
                p7.setStatus(rs.getString(6));
                p7.setQuantity(rs.getString(7));
                p7.setImageName(rs.getString(8));
                list.add(p7);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
