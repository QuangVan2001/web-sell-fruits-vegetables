/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

/**
 *
 * @author QUANG VAN
 */
public class OrderDetail {
    private String detaiID;
    private String orderID;
    private int quantity;
    private float price;
    private String productID;
    private String status;

    public OrderDetail() {
    }

    public OrderDetail(String detaiID, String orderID, int quantity, float price, String productID, String status) {
        this.detaiID = detaiID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.price = price;
        this.productID = productID;
        this.status = status;
    }

    public String getDetaiID() {
        return detaiID;
    }

    public void setDetaiID(String detaiID) {
        this.detaiID = detaiID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
