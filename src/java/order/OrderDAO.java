/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author QUANG VAN
 */
public class OrderDAO {

    private  static final String INSERT_ORDER = "INSERT INTO tblOrder(orderID, orderDate, total, userID, status) VALUES(?,?,?,?,?)";
    private  static final String INSERT_ORDER_DETAIL = "INSERT INTO tblOrderDetail(detailID, orderID, quantity, price,producID, status) VALUES(?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE_ORDERID="SELECT orderID FROM tblOrder WHERE orderID = ?";
    public boolean checkOut(Order order) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                stm = conn.prepareStatement(INSERT_ORDER);
                stm.setString(1, order.getOrderID());
                stm.setString(2, order.getUserID());
                stm.setString(3, order.getOrderDare());
                stm.setString(4, order.getStatus());
                stm.setString(5, Float.toString(order.getTotal()));

                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                
                stm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                stm.setString(1, orderDetail.getDetaiID());
                stm.setString(2, orderDetail.getOrderID());
                stm.setString(3, orderDetail.getProductID());
                stm.setString(4, Integer.toString(orderDetail.getQuantity()));
                stm.setString(5, Float.toString(orderDetail.getPrice()));
                stm.setString(6, orderDetail.getStatus());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String orderID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_DUPLICATE_ORDERID);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
