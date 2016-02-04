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
         <%!Connection con;PreparedStatement ps,ps1;
  ResultSet rs,rs1;         
%>
           <h1><b><center><font color="lightblue">APPLICATIONS FOR THE JOBS</center></b></h1><br><br><br>
    <center><table border="4" width="50%" height="50%"><th>First name</th><th>Last name</th>
                 </tr>
          <%
 try{
     String id1=request.getParameter("i1");
     int id=Integer.parseInt(id1);
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      con=DriverManager.getConnection("jdbc:odbc:IJP");
        String query = "SELECT firstname, lastname FROM ijpusers u INNER JOIN ijpapplications a ON u.UserID = a.appliedByUserID WHERE JobID = ?";
     ps=con.prepareStatement(query);
     ps.setInt(1,id );
     rs=ps.executeQuery();
     while(rs.next()){
     %>
     <tr><td><%=rs.getString("firstname")%></td><td><%=rs.getString("lastname")%></td></tr>
     <%}
        }catch(Exception e){System.out.println(e);}
%>
    </center></table><br><br><br>
  <form action="jobposted.jsp">
         <input type="submit" value="Back">
         </form>
    </body>
</html>
