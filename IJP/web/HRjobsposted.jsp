<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script lang="javascript">
            function a(){
                location.href="HR.jsp";
                
            }
        </script>
    </head>
     <jsp:include page="index.html"></jsp:include>
    <body>
         <%! Connection con;
    PreparedStatement ps,ps1,ps2;
    ResultSet rs,rs1,rs2;
    String s,un,u,id;
    HttpSession hs;
    %>
        
       <h1><b><center><font color="lightblue">JOBS YOU HAVE TO HIRE EMPLOYEES FOR</center></b></h1><br><br><br>
    <center>  <table border="4" width="50%" height="50%"><tr><th>Job ID</th><th>Job Title</th><th>Job Grade</th><th>No of Positions</th><th>Applications received</th>
                 </tr>
                 <%  
           
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
          hs=request.getSession(true);
         un=(String)hs.getAttribute("ijpusers2");
          ps= con.prepareStatement("select * from ijpjobs where Hiring_manager=?");
        ps.setString(1,un);
        }
        catch (ClassNotFoundException e){}
        catch(SQLException e){System.out.println(e);}

try{
    
      rs=ps.executeQuery();
     while(rs.next()) {         
       id=rs.getString("JobID");
  %>
  <tr><td><%=id%></td>       
                   <td><%=rs.getString("JobTitle")%></td>
                    <td><%=rs.getString("Grade")%></td><td><%=rs.getInt("No_of_positions")%></td>
                   <td><a href="HRapps.jsp?i1=<%=id%>">View</a></td>
                </tr><p>
                <%
            }
              }
               catch(SQLException e){System.out.println(e);}
        %>
             
             
                </center></table><br><br><br>
         <form>
             <input type="button" value="Back" onclick="a()">
         </form>
    </body>
</html>
