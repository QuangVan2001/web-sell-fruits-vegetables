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

/**
 *
 * @author QUANG VAN
 */
public class MainController extends HttpServlet {

    private static final String HOME = "home";
    private static final String HOME_CONTROLLER = "HomeController";
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";

    public static final String ADD = "AddProduct";
    public static final String ADDPRODUCT_CONTROLLER = "AddProductController";
    public static final String CONFRIM_ADD = "ConfirmAdd";
    public static final String CONFRIM_ADD_CONTROLLER = "ConfirmAddController";
  

    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
    private static final String CONFIRM_EDIT = "ConfirmEdit";
    private static final String CONFIRM_EDIT_CONTROLLER = "ConfirmEditController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";

    private static final String ADD_TO_CART = "Add to cart";
    private static final String ADD_TO_CART_CONTRLLER = "AddToCartController";
    private static final String UPDATE_TO_CART = "Update";
    private static final String UPDATE_TO_CART_CONTROLLER = "UpdateCartcontroller";
    private static final String REMOVE_TO_CART = "Remove";
    private static final String REMOVE_TO_CART_CONTROLLER = "RemoveCartController";
    private static final String CHECK_OUT = "Check Out";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutController";
    private static final String GO_CHECK_OUT = "Go To Check Out";
    private static final String GO_CHECK_OUT_JSP = "checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADDPRODUCT_CONTROLLER;
            }  else if (CONFRIM_ADD.equals(action)) {
                url = CONFRIM_ADD_CONTROLLER;
            }
            else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (CONFIRM_EDIT.equals(action)) {
                url = CONFIRM_EDIT_CONTROLLER;
            } else if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTRLLER;
            } else if (UPDATE_TO_CART.equals(action)) {
                url = UPDATE_TO_CART_CONTROLLER;
            } else if (REMOVE_TO_CART.equals(action)) {
                url = REMOVE_TO_CART_CONTROLLER;
            } else if (CHECK_OUT.equals(action)) {
                url = CHECK_OUT_CONTROLLER;
            } else if (GO_CHECK_OUT.equals(action)) {
                url = GO_CHECK_OUT_JSP;
            } else if (HOME.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "This function is not supported!!!");
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
