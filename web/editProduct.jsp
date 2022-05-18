<%-- 
    Document   : editProduct
    Created on : Mar 11, 2022, 6:37:06 PM
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
        <link href="css/input.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Edit Product Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">

                <a href="MainController?action=Logout">Logout</a>             
            </div>
            <div class="banner">
                <p>Edit Product Here!!!</p>
            </div>
            <div class="content">
                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                        response.sendRedirect("login.jsp");
                    }
                    ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
                    if (productError == null) {
                        productError = new ProductError();
                    }
                    List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("LIST_CATE");
                %>
                <form action="MainController">
                    Product ID:  <input type="text" name="productID"  required="" value="<%=request.getParameter("productID")%>" readonly=""></br></br>
                    Product Name: <input type="text" name="productName"  required="" value="<%=request.getParameter("productName")%>"></br>
                    <%=productError.getProductNameError()%></br>
                    Product Price:<input type="number" name="price" required="" value="<%=request.getParameter("price")%>"></br>
                    <%=productError.getProductPriceError()%></br>
                    Product Quantity: <input type="number" name="quantity"  value="<%=request.getParameter("quantity")%>"></br></br>
                    Product Image:  <input type="text" name="image"  required="" value="<%=request.getParameter("image")%>"></br></br>
                    Product CategoryID:
                    <select class="status" name="categoryID">
                        <option value="<%=request.getParameter("categoryID")%>" selected=""><%=request.getParameter("categoryID")%></option>
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

                    <input type="hidden" name="importDate" value="<%=request.getParameter("importDate")%>"> </br>  

                    <input type="hidden" name="usingDate" value="<%=request.getParameter("usingDate")%>">   </br>
                    Status:
                    <select class="status" name="status" >  

                        <% if ("A".equals(request.getParameter("status"))) {
                        %>
                        <option value="available" selected="">Available</option>
                        <option value="notAvailable">Non-Available</option>  
                        <%
                        } else if ("NA".equals(request.getParameter("status"))) {
                        %>
                        <option value="available">Available</option>
                        <option value="notAvailable" selected="">Non-Available</option>  
                        <%
                        } else {
                        %>
                        <option value="available">Available</option>
                        <option value="notAvailable">Non-Available</option> 
                        <%
                            }
                        %>
                    </select></br>


                    <input class="button_checkOut" type="submit" name="action" value="ConfirmEdit">
                </form>
            </div>
        </div>
    </body>
</html>
