<%-- 
    Document   : jobposted
    Created on : Jul 14, 2013, 2:47:31 PM
    Author     : Pragya
--%>

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
    PreparedStatement ps;
    ResultSet rs;
    %>
        
       <h1><b><center><font color="lightblue">JOBS POSTED</center></b></h1><br><br><br>
    <center>  <table border="4" width="50%" height="50%"><tr><th>Job ID</th><th>Job Title</th><th>Job Grade</th><th>No of Positions</th><th>Status</th><th>Applications received</th>
                 </tr>
              <%
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps= con.prepareStatement("select * from ijpjobs ");
        }
        catch (ClassNotFoundException e){}
        catch(SQLException e){System.out.println(e);}

try{
    rs=ps.executeQuery();

            while(rs.next()){
 int id=rs.getInt("JobID"); %>
                    <tr><td><%=id %></td>
                    <td><%=rs.getString("JobTitle")%></td>
                    <td><%=rs.getString("Grade")%></td><td><%=rs.getInt("No_of_positions")%></td>
                    <td><%=rs.getString("Status")%></td><td><a href="applications.jsp?i1=<%=id%>">View</a></td>
                </tr><p>
                <%
            }
                }catch(SQLException e){System.out.println(e);}
        %>
             
             
                </center></table><br><br><br>
         <form action="Admin.jsp">
         <input type="submit" value="Back">
         </form>
    </body>
</html>
