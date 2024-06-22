package com.dao;

import com.entity.ProductDetails;
import java.util.List;

public interface ProductDao {

    public boolean addProducts(ProductDetails p);

    public List<ProductDetails> getAllProducts();

    public ProductDetails getProductById(int product_id);

    public boolean updateProductDetails(ProductDetails p);

    public boolean deleteProducts(int product_id);

    public List<ProductDetails> getWomenClothing();

    public List<ProductDetails> getMenClothing();

    public List<ProductDetails> getKidsClothing();

    public List<ProductDetails> getAllWomenClothing();

    public List<ProductDetails> getAllMenClothing();

    public List<ProductDetails> getAllKidsClothing();
    
    public List<ProductDetails> getProductBySearch(String search);

}
