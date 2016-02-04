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
    String un,i,j;
    %>
     <%  i= request.getParameter("i1");
       j= request.getParameter("i2");
     try
        {
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      }
       catch (ClassNotFoundException e)
       {System.out.println(e);}
     
        try{
       con= DriverManager.getConnection("jdbc:odbc:IJP");
       HttpSession hs=request.getSession(true);
       un=(String)hs.getAttribute("ijpusers2");
       ps=con.prepareStatement("update ijpapplications set status='Selected' where Hiring_manager=? AND appliedbyUserID=? AND JobID=?");
       ps.setString(1,un);
       ps.setString(2,i);
       ps.setString(3,j);
       ps.execute(); 
        }
   catch(SQLException e){
   System.out.println(e);
   }
  %>
  <h1><center>Candidate selected</center></h1>
  <%response.setHeader("Refresh","2;HR.jsp");%>
    </body>
</html>
