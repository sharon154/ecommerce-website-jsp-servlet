package com.dao;

import java.util.List;
import com.entity.Cart;

public interface CartDao {

    public boolean addtoCart(Cart c);

    public List<Cart> getProductByUser(int id);

    public boolean deleteProduct(int cartId, int id);

    public Cart getCartById(int cartId, int id);

}
