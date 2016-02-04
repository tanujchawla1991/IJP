<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <jsp:include page="index.html"></jsp:include>
    </head>
    <body>
      <%! Connection con;
    PreparedStatement ps,ps1,ps2;
     ResultSet rs,rs1,rs2;
     String un,j,i;
    %>
         <%
         un= request.getParameter("s2");
         j= request.getParameter("s1");
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps=con.prepareStatement("update ijpjobs set Hiring_manager=? where JobTitle=?");
         ps.setString(1,j);
        ps.setString(2,un);
        ps.execute();
        ps2=con.prepareStatement("select JobID from ijpjobs where JobTitle=?");
        ps2.setString(1,un);
        rs2=ps2.executeQuery();
        rs2.next();
        i=rs2.getString("JobID");
        ps1=con.prepareStatement("update ijpapplications set Hiring_manager=? where JobID=?");
        ps1.setString(1,j);
        ps1.setString(2, i);
       ps1.execute();
      }
catch (ClassNotFoundException e){System.out.println(e);}
        catch(SQLException e){System.out.println(e);}
%>
<h1><center>Job successfully delegated</center></h1>
<%response.setHeader("Refresh","2;del1.jsp");%>
    </body>
</html>
