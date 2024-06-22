
package com.entity;

public class Cart {
    private int cartId;
    private ProductDetails product_id;
    private User id;
    private String product_name;
    private String description;
    private double price;
    private int quantity;
    private double total_amount;

    public Cart() {
        super();
    }

    public Cart(int cartId, ProductDetails product_id, User id, String product_name, String description, double price, int quantity, double total_amount) {
        this.cartId = cartId;
        this.product_id = product_id;
        this.id = id;
        this.product_name= product_name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.total_amount = total_amount;
    }

    
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public ProductDetails getProduct_id() {
        return product_id;
    }

    public void setProduct_id(ProductDetails product_id) {
        this.product_id = product_id;
    }

    public User getId() {
        return id;
    }

    public void setId(User id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartId=" + cartId + ", product_id=" + product_id + ", id=" + id + ", product_name=" + product_name + ", description=" + description + ", price=" + price + ", quantity=" + quantity + ", total_amount=" + total_amount + '}';
    }

    
    
    
}
