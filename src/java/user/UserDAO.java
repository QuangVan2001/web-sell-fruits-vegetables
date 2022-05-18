/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBUtils;

/**
 *
 * @author Quang Van
 */
public class UserDAO {

    private static final String LOGIN = "SELECT userID, fullname, roleID, address, birthday, phone, email, status FROM tblUsers WHERE userID=? AND password =?";
    private static final String CHECK_DUPLICATE = "SELECT fullname FROM tblUsers WHERE userID=?";

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    Date birthday = rs.getDate("birthday");
                    int phone = Integer.parseInt(rs.getString("phone"));
                    String email = rs.getString("email");
                    String status = rs.getString("status");
                    user = new UserDTO(userID, fullname, roleID, "", address, birthday, phone, email, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return user;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

   

    public boolean checkDuplicate(UserDTO userGG) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select userID from tblUsers where userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userGG.getUserID());
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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

    public boolean insertUserGG(UserDTO userGG) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblUsers(userID,fullName,roleID,status,password,address, birthday, phone, email) values(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userGG.getUserID());
                stm.setString(2, userGG.getFullName());
                stm.setString(3, userGG.getRoleID());
                stm.setString(4, userGG.getStatus());
                stm.setString(5, userGG.getPassword());
                stm.setString(6, userGG.getAddress());
                stm.setDate(7, userGG.getBirthday());
                stm.setInt(8, userGG.getPhone());
                stm.setString(9, userGG.getEmail());

                check = stm.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
