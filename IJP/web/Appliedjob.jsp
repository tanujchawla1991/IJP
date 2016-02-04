<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <jsp:include page="index.html"></jsp:include>
       <%if(request.isRequestedSessionIdValid()){%>
    <body>
          <%! Connection con;
      PreparedStatement ps,ps1,ps2;
       ResultSet rs,rs1,rs2;
     String i,id,un;
     Date d;
    %>
         <h1><b><center><font color="lightblue">YOU HAVE APPLIED TO THE FOLLOWING JOBS </center></b></h1><br><br><br>
           <center> <table border="4" width="50%" height="50%"><tr><th>Job ID</th><th>Job Title</th><th>Job Grade</th><th>Date of application</th>
                       <th>Status</th></tr>
              <%
         try
        { Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        HttpSession hs=request.getSession(true);
        un=(String)hs.getAttribute("ijpusers1");
        ps1=con.prepareStatement("select * from ijpusers where username=?");
        ps1.setString(1, un);
        rs1=ps1.executeQuery();
        rs1.next();
       String u1= rs1.getString("UserID");
        ps=con.prepareStatement("select * from ijpapplications a , ijpjobs j where a.JobID = j.JobID and a.appliedbyUserID =?");
        ps.setString(1, u1);
        
        rs=ps.executeQuery();
         while(rs.next()){
           id=rs.getString("JobID"); 
         d= rs.getDate("Post_date");
         %> 
                      <tr>
                    <td><%=id%></td>
                    <td><%=rs.getString("JobTitle")%></td>
                    <td><%=rs.getString("Grade")%></td><td><%=d%></td>
                    <td><a href="status.jsp?i1=<%=id%>">View</a></td>
                </tr>
        <%}
               }
         catch (ClassNotFoundException e){System.out.println(e);}
        catch(SQLException e){System.out.println(e);}
       %>
               </table><br><br><br>
       <form method="post" action="User.jsp">
           <input type="submit" value="Back">
       </form>     
    </body><%}%>
</html>
