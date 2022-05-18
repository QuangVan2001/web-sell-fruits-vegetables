/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author QUANG VAN
 */
public class CategoryDTO {
    private String categoryID;
    private String categoryName;
    private String status;

    public CategoryDTO() {
    }

    public CategoryDTO(String categoryID, String categoryName, String status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.status = status;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
    
}
