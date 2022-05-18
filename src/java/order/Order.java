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
public class Order {
    private String orderID;
    private String orderDare;
    private float total;
    private String userID;
    private String status;
    public String paymentStatus;
    
    public Order() {
    }

    public Order(String orderID, String orderDare, float total, String userID, String status) {
        this.orderID = orderID;
        this.orderDare = orderDare;
        this.total = total;
        this.userID = userID;
        this.status = status;
    }

    public Order(String orderID, String orderDare, float total, String userID, String status, String paymentStatus) {
        this.orderID = orderID;
        this.orderDare = orderDare;
        this.total = total;
        this.userID = userID;
        this.status = status;
        this.paymentStatus = paymentStatus;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getOrderDare() {
        return orderDare;
    }

    public void setOrderDare(String orderDare) {
        this.orderDare = orderDare;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    
    
}
