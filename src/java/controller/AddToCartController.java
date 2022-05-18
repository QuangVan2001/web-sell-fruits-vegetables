/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.ProductDTO;
import shopping.Cart;

/**
 *
 * @author QUANG VAN
 */
public class AddToCartController extends HttpServlet {

    public static final String ERROR = "HomeController";
    public static final String SUCCESS = "user.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            float productPrice = Float.parseFloat(request.getParameter("price"));
            String productImage = request.getParameter("image");
            int productQuantityAvailable = Integer.parseInt(request.getParameter("quantityAvailable"));
            int productQuantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            ProductDTO product = new ProductDTO(productID, productName, productQuantity, importDate, usingDate, url,  categoryID, productPrice);
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            } else {
                if (cart.getCart().containsKey(productID)) {
                    String message = "The product is added to your cart before!!!Check your cart, please!";
                    request.setAttribute("SHOPPING_MESSAGE", message);
                    return;
                }
            }
            if (productQuantity > productQuantityAvailable) {
                String message = "The number of available products is not enough!!!";
                request.setAttribute("SHOPPING_MESSAGE", message);
            } else {
                product.setQuantityAvaiable(productQuantityAvailable);
                cart.add(product);
                session.setAttribute("CART", cart);
                String message = "Add to cart " + productQuantity + " '" + productName + "' successfully!!!";
                request.setAttribute("SHOPPING_MESSAGE", message);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AddToCartController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
