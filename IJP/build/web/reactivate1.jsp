<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%! Connection con; 
 PreparedStatement ps,ps1; 
 ResultSet rs,rs1; 
String name;
 int i1;%>
<script language="javascript">
       
            function b(){
             location.href="Admin.jsp";
            }    
     </script>
<%  name=request.getParameter("q");

try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
try{
     con=DriverManager.getConnection("jdbc:odbc:IJP");
    String query="select * from ijpjobs where Status=? AND Hiring_manager=?";
ps=con.prepareStatement(query);
 ps.setString(1,"Inactive");
 ps.setString(2,name);
 ps1=con.prepareStatement("select * from ijpjobs where Status='Inactive'");
 rs1=ps1.executeQuery();
rs=ps.executeQuery();
}catch(Exception e){ System.out.println(e); }
%>
<table align="center" border="4" width="50%" height="50%">
                <tr><th>Job ID</th><th>Job Title</th><th>Grade</th><th>No of positions</th><th>Reactivate jobs</th></tr>
              <%
              while(rs1.next() && name.equals("All")){%>
              <tr><td><%=rs1.getInt("JobID")%></td><td><%=rs1.getString("JobTitle")%></td><td><%=rs1.getString("Grade")%></td>
                  <td><%=rs1.getInt("No_of_positions")%></td><td><center><a href="reactivatejob.jsp?r1=<%=i1%>">Activate</a></center></td></tr>
            <%  }
             while(rs.next()){
   i1=rs.getInt("JobID");%>
<tr><td><%=i1%></td><td><%=rs.getString("JobTitle")%></td><td><%=rs.getString("Grade")%></td><td><%=rs.getInt("No_of_positions")%></td>
    <td><center><a href="reactivatejob.jsp?r1=<%=i1%>">Activate</a></center></td></tr>
      
     <%}%>         </table><br><br><br>
     <form name="f1" action="reactivatejob.jsp">
         <center>
             <input type="button" value="Back" onclick="b()" hidden="true"></center>
     </form>
    </body>
</html>
