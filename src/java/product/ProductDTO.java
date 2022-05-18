/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.sql.Date;

/**
 *
 * @author QUANG VAN
 */
public class ProductDTO {
    private String productID;
    private String productName;
    private int quantity;
    private String importDate;
    private String usingDate;
    private String image;
    private String status;
    private String categoryID;
    private float price;
    private int quantityAvaiable;
    
    public ProductDTO() {
    }
    
    public ProductDTO(String productID, String productName, int quantity, String importDate, String usingDate, String image, String categoryID, float price) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.image = image;        
        this.categoryID = categoryID;
        this.price = price;
    }

    
    public ProductDTO(String productID, String productName, int quantity, String importDate, String usingDate, String image, String status, String categoryID, float price) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.image = image;
        this.status = status;
        this.categoryID = categoryID;
        this.price = price;
    }

    public int getQuantityAvaiable() {
        return quantityAvaiable;
    }

    public void setQuantityAvaiable(int quantityAvaiable) {
        this.quantityAvaiable = quantityAvaiable;
    }

    

    

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
     
    
}
