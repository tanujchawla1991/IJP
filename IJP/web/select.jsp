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
      <h1><b><center><font color="lightblue">SELECT CANDIDATES AFTER THE INTERVIEW</center></b></h1><br><br><br>
     <%
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
       ps=con.prepareStatement("select * from ijpapplications where status='Interview scheduled' AND Hiring_manager=?");
       ps.setString(1,un);
       rs=ps.executeQuery();
       }
        catch(SQLException e){
   System.out.println(e);
   }
%>
<table align="center" border="5" width="50%">
    <tr><th>Application ID</th><th>Applied by User ID</th><th>Job ID</th><th>Date of application</th><th>Select</th><th>Reject</th></tr>
    <%while(rs.next()){
     i=rs.getString("appliedbyUserID");
     j=rs.getString("JobID");              
    %>
    <tr><td><%=rs.getString("applicationID")%></td><td><%=i%></td><td><%=j%></td><td><%=rs.getString("date_of_application")%></td><td><a href="select1.jsp?i1=<%=i%>&i2=<%=j%>">Select</a></td><td><a href="reject.jsp?i1=<%=i%>&i2=<%=j%>">Reject</a></td></tr>
<%}%>
</table><br><br><br><br>
      <form name="f1" action="HR.jsp">
          <center>  <input type="submit" value="Back"></center>
      </form>
    </body>
</html>
