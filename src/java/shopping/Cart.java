/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.util.HashMap;
import java.util.Map;
import product.ProductDTO;

/**
 *
 * @author QUANG VAN
 */
public class Cart {
    
    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(product.getProductID())) {
                int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getProductID(), product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String productID) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(productID)) {
                    this.cart.remove(productID);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public void update(ProductDTO product) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(product.getProductID())) {
            this.cart.replace(product.getProductID(), product);
        }
    }
}
