<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <jsp:include page="index.html"></jsp:include>
     <%!
Connection con;
   ResultSet rs;
   PreparedStatement ps;
%>
    <body>
        <% 
         
        int i1=Integer.parseInt(request.getParameter("s"));
        String rl=request.getParameter("cr");
                 try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
        
       con=DriverManager.getConnection("jdbc:odbc:IJP"); 
       ps=con.prepareStatement("update ijpusers set role=? where UserID=?");
       ps.setString(1, rl);
       ps.setInt(2, i1);
       ps.executeUpdate();
        }
        catch(Exception e){System.out.println(e);}
        %>
    <center>  <h1>Role Changed successfully</h1></center>
        <% response.setHeader("Refresh","2;urolemgt.jsp"); %>
    </body>
</html>
