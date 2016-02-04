<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <%! Connection con;
    PreparedStatement ps,ps1;
     ResultSet rs,rs1;
    %>
      <jsp:include page="index.html"></jsp:include>
    <body><%
    try{
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      con=DriverManager.getConnection("jdbc:odbc:IJP");
    ps=con.prepareStatement("update ijpapplications set status='Interview scheduled'");
    }
      catch(ClassNotFoundException e){System.out.println(e);
      }
    catch(SQLException e){System.out.println(e);}
      %>
    <center><h1>Interview scheduled</h1></center>
    <% response.setHeader("Refresh","2;schedule1.jsp");%>
    </body>
</html>
