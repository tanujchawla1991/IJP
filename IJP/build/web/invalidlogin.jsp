<%-- 
    Document   : invalidlogin
    Created on : Jul 8, 2013, 9:57:03 PM
    Author     : Divyanshu Goel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invalid Login Page</title>
        <jsp:include page="index.html"></jsp:include>
    </head>
    <body>
    <center>    <h1>Sorry you are not a registered user</h1></center>
        <% response.setHeader("Refresh","3;login.jsp");%>
    </body>
</html>
