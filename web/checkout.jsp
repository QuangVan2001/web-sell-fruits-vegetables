<%-- 
    Document   : checkout
    Created on : Mar 10, 2022, 7:51:40 PM
    Author     : QUANG VAN
--%>

<%@page import="user.UserDTO"%>
<%@page import="order.OrderError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/input.css" rel="stylesheet" type="text/css"/>
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <title>Check Out Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">

                <a href="viewcart.jsp">View Cart</a>
                <a href="MainController?action=Logout">Logout</a>
            </div>
            <div class="banner">
                <p>Check Out !!!<p>
            </div>
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                    response.sendRedirect("login.jsp");
                }


            %>
            <div class="content">
                <%            OrderError error = (OrderError) request.getAttribute("CHECK_OUT_ERROR");
                    if (error == null) {
                        error = new OrderError();
                    }

                %>
                

                <form action="MainController">
                    Order ID<input type="text" name="orderID" required=""></br>
                    <%=error.getOrderIDError()%></br>
                    User ID<input type="text" name="userID" required=""></br>
                    Order Date <input type="date" name="orderDate" required="" ></br>


                    Total money <input type="number" name="totalMoney"  value="<%=request.getParameter("totalMoney")%>" readonly=""/><br>
                    <input  type="submit" name="action" value="Check Out"/>               
                </form>
            </div>
        </div>
    </body>
</html>
