<%-- 
    Document   : addnewProduct
    Created on : Mar 11, 2022, 4:43:24 PM
    Author     : QUANG VAN
--%>

<%@page import="user.UserDTO"%>
<%@page import="product.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <link href="css/input.css" rel="stylesheet" type="text/css"/>
        <title>Add new product Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="admin.jsp" >Home</a>

                <a href="MainController?action=Logout">Logout</a>             
            </div>
            <div class="banner">
                <p>Add new a product!!!</p>
            </div>
            <div class="content">
                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                        response.sendRedirect("login.jsp");
                    }

                %>
                <%            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                    if (productError == null) {
                        productError = new ProductError();
                    }
                    List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("LIST_CATE");
                %>
                <form action="MainController">
                    <p>Product ID:</p>
                    <input  type="text" name="productID" placeholder="Product ID" required=""></br>
                    <%=productError.getProductIDError()%></br>
                    <p>Product Name:</p>
                    <input type="text" name="productName" placeholder="Product Name" required=""></br>
                    <%=productError.getProductNameError()%></br>
                    <p>Product Price:</p>
                    <input  type="number" name="price" placeholder="Product Price" required=""></br>
                    <%=productError.getProductPriceError()%></br>
                    <p>Product Quantity:</p>
                    <input type="number" name="quantity"  min="1" value="1" placeholder="Product Quantity"></br></br>
                    <%=productError.getProductQuantityError()%></br>
                    <p>Product Image:</p>
                    <input type="text" name="image" placeholder="Product Image"></br></br>
                    <p>Product CategoryID:</p>
                    <select class="status" name="categoryID">
                        <%
                            if (list != null) {
                                if (!list.isEmpty()) {
                                    for (CategoryDTO category : list) {

                        %>
                        <option value="<%=category.getCategoryID()%>"><%=category.getCategoryID()%></option>

                        <%                                    }
                                }
                            }
                        %>
                    </select></br></br>
                    <p>Import Date:</p>
                    <input type="date" name="importDate" placeholder="Import Date"></br></br>
                    <p>Using Date:</p>
                    <input type="date" name="usingDate" placeholder="Using Date"></br></br>
                    <p>Status:</p>
                    <select class="status" name="status">
                        <option value="available">Available</option>
                        <option value="non-available">Non-Available</option>
                    </select></br>
                    <input class="button_checkOut" type="submit" name="action" value="ConfirmAdd">
                </form>
            </div>
        </div>
    </body>
</html>
