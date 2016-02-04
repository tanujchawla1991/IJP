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
    PreparedStatement ps,ps1;
     ResultSet rs,rs1;
      String i,id;
    %>
     <%
        i=request.getParameter("i1");
       id=request.getParameter("i2");
        try { Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
        catch (ClassNotFoundException e){System.out.println(e);}
        try{
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps1=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID=?");
    ps1.setString(1, i);
    ps1.setString(2, id);
     ps=con.prepareStatement("select DateDiff('m',Post_date,Now)>=6 from ijpjobs where JobID=?");
         ps.setString(1, i);
       rs=ps.executeQuery();
      rs1=ps1.executeQuery();
   if(rs1.next()){%>
    <center>  <h1>You have already applied for this job and your request is in process.</h1></center>
   <%response.setHeader("Refresh","3;Useractivejob.jsp"); }
                    else if(rs.next()){
         response.sendRedirect("Apply.jsp");}
        if(!rs.next()){%>
        <center><h1>Sorry you can't apply for this job since you have not completed 6 months in the company.</h1></center>
     <%response.setHeader("Refresh","3;Useractivejob.jsp"); }
                 }
        catch(SQLException e){System.out.println(e);}
   %>
    </body>
</html>
