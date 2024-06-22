
package com.entity;

public class ProductDetails {
    private int product_id;
    private String product_name;
    private String description;
    private String category;
    private String price;
    private String status;
    private String quantity;
    private String imageName;

    public ProductDetails() {
        super();
    }

    public ProductDetails(String product_name, String description, String category, String price, String status, String quantity, String imageName) {
        this.product_name = product_name;
        this.description = description;
        this.category = category;
        this.price = price;
        this.status = status;
        this.quantity = quantity;
        this.imageName = imageName;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    @Override
    public String toString() {
        return "ProductDetails{" + "product_id=" + product_id + ", product_name=" + product_name + ", description=" + description + ", category=" + category + ", price=" + price + ", status=" + status + ", quantity=" + quantity + ", imageName=" + imageName + '}';
    }
    
    

   
}
