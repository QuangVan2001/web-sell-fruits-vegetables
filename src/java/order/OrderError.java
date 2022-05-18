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
public class OrderError {
    private String orderIDError;
    private String userIDError;
    private String orderDateError;
    
    public OrderError() {
        this.orderIDError = "";
        this.userIDError = "";
        this.orderDateError = "";
    }
    public OrderError(String orderIDError, String userIDError, String orderDateError) {
        this.orderIDError = orderIDError;
        this.userIDError = userIDError;
        this.orderDateError = orderDateError;
    }

    public String getOrderIDError() {
        return orderIDError;
    }

    public void setOrderIDError(String orderIDError) {
        this.orderIDError = orderIDError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getOrderDateError() {
        return orderDateError;
    }

    public void setOrderDateError(String orderDateError) {
        this.orderDateError = orderDateError;
    }
     
}
