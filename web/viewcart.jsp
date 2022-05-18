<%-- 
    Document   : viewcart
    Created on : Mar 10, 2022, 7:18:57 PM
    Author     : QUANG VAN
--%>

<%@page import="user.UserDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>View Cart Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="MainController?action=Logout">Logout</a>
            </div>
            <div class="banner">
                <p>Welcome User !!!</p>
            </div>

            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                    response.sendRedirect("login.jsp");
                }


            %>
            <%            Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
            %>
            <h1 class="message">Not have any products!!!</h1>
            <%
            } else {
            %>
            <%
                String message = (String) request.getAttribute("SHOPPING_MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <h1 class="message"><%=message%></h1></br>
            <div class="content">               
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                            <th>Update</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int count = 1;
                            float total = 0;
                            for (ProductDTO product : cart.getCart().values()) {
                                total += product.getPrice() * product.getQuantity();
                        %>                             
                    <form action="MainController">
                        <tr>
                            <td><%=count++%></td>
                            <td><%=product.getProductID()%></td>
                            <td><%=product.getProductName()%></td>
                            <td>                               
                                <input type="number" name="quantity" value="<%=product.getQuantity()%>" required="" min="1"/>
                            </td>
                            <td><%=product.getPrice()%></td>
                            <td><%=product.getPrice() * product.getQuantity()%></td>
                            <td>
                                <input type="hidden" name="productQuantityAvailable" value="<%=product.getQuantityAvaiable()%>"/>
                                <input type="submit" name="action" value="Update"/>
                            </td>
                            <td>
                                <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                        </tr>
                    </form>                               
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <h1>Total: <%=total%></h1>
            <div>
                <form action="MainController">
                    <input type="hidden" name="totalMoney" value="<%=total%>" min="1"/>
                    <input class="button" type="submit" name="action" value="Go To Check Out"/>
                </form>
            </div>       
            <%
                }
            %>
            <div class="shopping">
                <a  href="user.jsp">Shopping more</a>
            </div>
        </div>  
    </div>  
</body>
</html>
