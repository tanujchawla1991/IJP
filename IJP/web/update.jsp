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
     String i,l,m,k,j;
     Date n;
    %>
      <%
      i=request.getParameter("i1");
      j=request.getParameter("t1");
      k=request.getParameter("g1");
      l=request.getParameter("n1");
      m=request.getParameter("h1");
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps= con.prepareStatement("update ijpjobs set JobTitle=?,Grade=?,No_of_positions=?,Hiring_manager=? where JobID=?");
          ps.setString(1, j);
          ps.setString(2, k);
          ps.setString(3, l);
          ps.setString(4, m);
          ps.setString(5, i);
          ps.execute();
         
        }
        catch (ClassNotFoundException e){}
        catch(SQLException e){System.out.println(e);}
%>
           <h1><center>Job updated</center></h1>
        <%response.setHeader("Refresh","2;Activejobs.jsp");%>
    </body>
</html>
