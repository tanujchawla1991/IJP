<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <jsp:include page="index.html"></jsp:include>
    </head>
    <body>
        <center><h1>Interview scheduled</h1></center>
    <% response.setHeader("Refresh","2;HRjobsposted.jsp");%>
    </body>
</html>
