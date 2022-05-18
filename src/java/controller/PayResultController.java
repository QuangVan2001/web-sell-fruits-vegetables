/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.vnpay.common.Config;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.Order;
import order.OrderDAO;
import order.OrderDetail;
import product.ProductDAO;
import product.ProductDTO;
import shopping.Cart;

/**
 *
 * @author QUANG VAN
 */
@WebServlet(name = "PayResultController", urlPatterns = {"/PayResultController"})
public class PayResultController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String FAIL = "payResult.jsp";
    public static final String SUCCESS = "payResult.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = (String) params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

            if (signValue.equals(vnp_SecureHash)) {
                if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
//                    out.print("GD Thanh cong");
                    HttpSession session = request.getSession();
                    Order order = (Order) session.getAttribute("ORDER");
                    order.setPaymentStatus("Y");
                    OrderDAO dao = new OrderDAO();
                    boolean check = dao.checkOut(order);
                    if (check) {
                        Cart cart = (Cart) session.getAttribute("CART");
                        int count = 1;
                        boolean checkInsert = true;
                        for (ProductDTO dto : cart.getCart().values()) {
                            String orderDetailID = order.getOrderID() + count++;
                            String productID = dto.getProductID();
                            int productQuantity = dto.getQuantity();
                            float productPrice = dto.getPrice();
                            String status = "A";
                            OrderDetail orderDetail = new OrderDetail(orderDetailID, order.getOrderID(), count, productPrice, productID, status);
                            checkInsert = dao.insertOrderDetail(orderDetail);//create orderdetail
                            ProductDAO productDAO = new ProductDAO();
                            //Update quantity available in tblProduct
                            boolean checkUpdate = productDAO.updateQuantity(productID, (dto.getQuantityAvaiable() - productQuantity));
                            if (!checkInsert || !checkUpdate) {
                                break;
                            }
                        }
                        if (checkInsert) {
                            url = SUCCESS;
                            request.setAttribute("MESSAGE", "GD Thanh cong");
                            session.removeAttribute("CART");
                        }
                    }
                } else {
//                    out.print("GD Khong thanh cong");
                    url = FAIL;
                    request.setAttribute("MESSAGE", "GD Khong thanh cong");
                }

            } else {
//                out.print("Chu ky khong hop le");
                request.setAttribute("ERROR_MESSAGE", "Chu ky khong hop le");
            }
        } catch (Exception e) {
            log("Error at PayResultController: " + e.toString());
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
