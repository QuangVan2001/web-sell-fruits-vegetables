<%-- 
    Document   : Login
    Created on : 11-02-2022, 12:45:56
    Author     : Quang Van
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Input your information</h1>

        <div class="container">
            <h1>Login</h1>
            <form action="MainController" method="POST" id="form">
                <input type="text" size="30" name="userID" placeholder="User ID" required=""/><br/>
                <input type="password" size="30" name="password" placeholder="password" required=""/><br/>
             
                <div class="g-recaptcha" data-sitekey="6LcXh9QeAAAAAO2ABFQcsLj6DWrraWmmSM54dRmK"></div>
                <div id="error"></div>                
                <input type="hidden" name="action" value="Login" />
                <input type="submit" name="Submit"/>
                <input type="reset" name="Reset" />
            </form>

            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>

        </div>
        <div class="bottom">
            <h1><%= error%></h1>
        </div>

        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please check";
                    }
                });
            }
        </script>
    </body>
</html>
