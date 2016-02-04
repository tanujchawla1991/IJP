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
        <%! Connection con;
    PreparedStatement ps,ps1,ps2;
     ResultSet rs,rs1,rs2;
    %>
      <%
     String d= request.getParameter("d1");
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps= con.prepareStatement("delete from ijpjobs where JobID=?");
        ps.setString(1, d);
        ps1=con.prepareStatement("delete from ijpapplications where JobID=?");
        ps1.setString(1, d);
        ps.execute();
        ps1.execute();
        }
        catch (ClassNotFoundException e){System.out.println(e);}
        catch(SQLException e){System.out.println(e);}%>
        <h1><center>Selected job deleted</center></h1>
        <%response.setHeader("Refresh","2;Activejobs.jsp");%>
    </body>
</html>
