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
        <%!Connection con;
           PreparedStatement ps,ps1;
           ResultSet rs;
        %>
      <%
        String u=request.getParameter("u1");
        String o=request.getParameter("o1");
        String n=request.getParameter("n1");
         try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
   ps=con.prepareStatement("select * from ijpusers where username=? AND password=?");
   ps.setString(1,u);
   ps.setString(2,o);
   rs=ps.executeQuery();
    if(rs.next()){
    String query="update ijpusers set password=? where username=?";
  ps1=con.prepareStatement(query);
  ps1.setString(1,n);
  ps1.setString(2,u);
  ps1.executeUpdate();%>
    <center> <h1>Password changed successfully.<br><br>
   Login with a new password.
   </h1></center>
  <%  response.setHeader("Refresh","3;login.jsp");}
     else{%>
     <h1> Invalid username or password.</h1>
     <% response.setHeader("Refresh","3;Change Password.jsp");
     }
    }
    catch(Exception e){System.out.println(e);}
    %>
   
    </body>
</html>
