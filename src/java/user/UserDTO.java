/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Date;

/**
 *
 * @author Quang Van
 */
public class UserDTO {

    private String userID;
    private String fullName;
    private String roleID;
    private String password;
    private String address;
    public  Date birthday;
    private int phone;
    private String email;
    private String status;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullName, String roleID, String password, String address, Date birthday, int phone, String email) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        
    }

    public UserDTO(String userID, String fullName, String roleID, String password, String address, Date birthday, int phone, String email, String status) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public UserDTO(String userID, String fullName, String roleID, String password, String address, String birthday, int phone, String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    

}
