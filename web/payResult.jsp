<%-- 
    Document   : payResult
    Created on : Jul 11, 2021, 11:02:48 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <title>Payment Result Page</title>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <a href="home" id="active">Home</a>
                <a href="MainController?action=Logout">Logout</a>
            </div>
            <div class="banner">              
                <p><%=request.getAttribute("MESSAGE")%></p>
            </div>
            
        </div>
    </body>
</html>
