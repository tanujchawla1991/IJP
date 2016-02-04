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
     String i,id,un;
    %>
         <h1><b><center><font color="lightblue">ACTIVE JOBS</center></b></h1><br><br><br>
    <center> <table border="4" width="50%" height="50%"><tr><th>Job ID</th><th>Job Title</th><th>Job Grade</th><th>No of Positions</th>
                <th>Apply</th></tr>
              <%
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps= con.prepareStatement("select * from ijpjobs where Status='Active'");
        HttpSession hs=request.getSession(true);
        un=(String)hs.getAttribute("ijpusers1");
      ps1=con.prepareStatement("select UserID from ijpusers where username=?");
      ps1.setString(1, un);
        }
        catch (ClassNotFoundException e){System.out.println(e);}
        catch(SQLException e){System.out.println(e);}

try{
    rs=ps.executeQuery();
    rs1=ps1.executeQuery();
        while(rs1.next()){
           i=rs1.getString("UserID"); } 
            while(rs.next()){
           id=  rs.getString("JobID"); 
                     
%>
            <tr>
                    <td><%=id%></td>
                    <td><%=rs.getString("JobTitle")%></td>
                    <td><%=rs.getString("Grade")%></td><td><%=rs.getInt("No_of_positions")%></td>
                    <td><a href="Applied.jsp?i1=<%=id%>&i2=<%=i%>">Apply</a></td>
                </tr><p>
                <%
            }
                } catch(SQLException e){System.out.println(e);}
        %>     
                </center></table><br><br><br>
                
                <form action="User.jsp">
         <input type="submit" value="Back">
         </form>
    </body>
</html>
