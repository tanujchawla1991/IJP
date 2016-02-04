<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="index.html"></jsp:include>
    <body>
       <%   String i= request.getParameter("i1");
     String s=request.getParameter("i2");       
%>
        <form name="f1" method="post" action="Interview.jsp?i1=<%=i%>&i2=<%=s%>">
            <center><h1><a href="resumes/application.docx">Open Candidate's resume</a></h1><br><br>
    <input type="submit" value="Review resume"></center>
    </form>
    
    </body>
</html>
