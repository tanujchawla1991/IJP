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
     String n3;
    %>
    <body>
        <%
         n3=request.getParameter("n2");
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps=con.prepareStatement("insert into ijpusers(resume) VALUE (?)");
        ps.setString(1,n3);
        ps.execute();
        }
        catch (ClassNotFoundException e){System.out.println(e);}
        catch(SQLException e){System.out.println(e);}
        %>
    </body>
</html>
