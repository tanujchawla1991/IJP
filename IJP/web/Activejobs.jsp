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
         <h1><b><center><font color="lightblue">ACTIVE JOBS</center></b></h1><br><br><br>
    <center> <table border="4" width="50%" height="50%"><tr><th>Job ID</th><th>Job Title</th><th>Job Grade</th><th>No of Positions</th><th>Post date</th><th>Hiring manager</th>
                <th>Edit jobs</th><th>Delete jobs</th></tr>
              <%
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps= con.prepareStatement("select * from ijpjobs where Status='Active'");
        }
        catch (ClassNotFoundException e){}
        catch(SQLException e){System.out.println(e);}

try{
    rs=ps.executeQuery();
            while(rs.next()){
i=rs.getString("JobID"); 
j=rs.getString("JobTitle");
k=rs.getString("Grade");
l=rs.getString("No_of_positions");
n=rs.getDate("Post_date");
m=rs.getString("Hiring_manager");
%>
            <tr><td><%=i%></td>
                    <td><%=j%></td>
                    <td><%=k%></td><td><%=l%></td>
                    <td><%=n%></td><td><%=m%></td>
                    <td><a href="Edit.jsp?d2=<%=i%>&d1=<%=j%>&d3=<%=k%>&d4=<%=l%>&d5=<%=m%>&d6=<%=n%>">Edit</a></td><td><a href="Delete.jsp?d1=<%=i%>">Delete</a></td>
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
