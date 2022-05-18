/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;

import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;
import product.ProductError;

/**
 *
 * @author QUANG VAN
 */
@WebServlet(name = "ConfirmAddController", urlPatterns = "/ConfirmAddController")

public class ConfirmAddController extends HttpServlet {

    public static final String ERROR = "addnewProduct.jsp";
    public static final String SUCCESS = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));
            LocalDate date = java.time.LocalDate.now();
            String importDate = date.toString();
            String usingDate = date.toString();
            String image = request.getParameter("image");
            String status = request.getParameter("status");
            String productCategoryID = request.getParameter("categoryID");

            boolean checkValidator = true;
            if (productID.length() < 3 || productID.length() > 10) {
                productError.setProductIDError("Product ID must be in [3,10]!");
                checkValidator = false;
            } else if (!productID.matches("^B\\d{0,9}$")) {// cái này còn chưa xong
                productError.setProductIDError("Product ID format: [BXXX...] !!");
                checkValidator = false;
            }
            if (productName.length() < 4 || productName.length() > 50) {
                productError.setProductNameError("Product Name must be in [4,50]!");
                checkValidator = false;
            }

            if (quantity <= 0) {
                productError.setProductQuantityError("Product Quantity must be more than zero!! ");
                checkValidator = false;
            }
            if (price <= 0) {
                productError.setProductQuantityError("Product Price must be more than zero!! ");
                checkValidator = false;
            }
            
            if (checkValidator) {
                ProductDTO product = new ProductDTO(productID, productName, quantity, importDate, usingDate, image, status, productCategoryID, price);
                ProductDAO dao = new ProductDAO();
                boolean check = dao.addNewProduct(product);
                if (check) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at ConfirmAddController" + e.toString());
            if (e.toString().contains("duplicate")) {
                productError.setProductIDError("Duplidate ProductID !!!");
                request.setAttribute("PRODUCT_ERROR", productError);
            }
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
