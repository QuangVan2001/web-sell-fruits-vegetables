<%-- 
    Document   : admin
    Created on : 11-02-2022, 13:15:21
    Author     : Quang Van
--%>

<%@page import="product.ProductDTO"%>
<%@page import="product.CategoryDTO"%>

<%@page import="product.ProductError"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Admin Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">

                <a href="MainController?action=Logout">Logout</a>             
            </div>
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                    response.sendRedirect("login.jsp");
                }

            %>
            
            <div class="banner">
                <p>Welcome Admin : <%=((UserDTO) session.getAttribute("LOGIN_USER")).getFullName()%>  !!!</p>
            </div>
            
            <div class="addNew">
                <a href="MainController?action=AddProduct">Add a new Product</a>
            </div>

            <div class="content">
                <%  List<ProductDTO> list = (List<ProductDTO>) session.getAttribute("LIST_ALL_PRODUCT");
                    if (list != null) {
                        if (!list.isEmpty()) {
                %>

                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ProductID</th>
                            <th>ProductName</th>
                            <th>Image</th>
                            <th>Quantity</th>
                            <th>Price</th>                        
                            <th>ImportDate</th>
                            <th>UsingDate</th>
                            <th>CategoryID</th>                    
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Delete</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (ProductDTO product : list) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%=count++%></td>
                            <td><%=product.getProductID()%></td>
                            <td><%=product.getProductName()%></td>
                            <td><img src="<%=product.getImage()%>" alt="Image" width="250" height="250"></td>
                            <td><%=product.getQuantity()%></td>
                            <td><%=product.getPrice()%></td>
                            <td><%=product.getImportDate()%></td>
                            <td><%=product.getUsingDate()%></td>
                            <td><%=product.getCategoryID()%></td>
                            <td><%=product.getStatus()%></td>

                            <td>
                                <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                <input type="hidden" name="productName" value="<%=product.getProductName()%>"/>
                                <input type="hidden" name="image" value="<%=product.getImage()%>"/>
                                <input type="hidden" name="quantity value="<%=product.getQuantity()%>"/>
                                <input type="hidden" name="price" value="<%=product.getPrice()%>"/>
                                <input type="hidden" name="categoryID" value="<%=product.getCategoryID()%>"/>
                                <input type="hidden" name="importDate" value="<%=product.getImportDate()%>"/>
                                <input type="hidden" name="usingDate" value="<%=product.getUsingDate()%>"/>
                                <input type="hidden" name="status" value="<%=product.getStatus()%>"/>
                                <input type="submit"  name="action" value="Edit"/>
                            </td>
                            <td>
                                <form action="MainController">
                                    <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                    <input type="submit"  name="action" value="Delete"/>
                                </form>

                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>   
                <%
                        }
                    }
                %>         
            </div>




            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%=error%>


        </div>
    </body>
</html>
