<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <jsp:include page="index.html"></jsp:include>
          <script lang="javascript">
              function a(){
                  location.href="HR.jsp";
                  
              }
          </script>
    </head>
      <%if(request.isRequestedSessionIdValid()){%>
    <body>
        <h1><b><center><font color="lightblue">MANAGE DELEGATIONS</center></b></h1><br><br><br>
          <%! Connection con;
    PreparedStatement ps,ps1,ps2;
     ResultSet rs,rs1,rs2;
     String un,j;
    %>
         <%
        try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con= DriverManager.getConnection("jdbc:odbc:IJP");
        ps= con.prepareStatement("select distinct Hiring_manager from ijpjobs ");
          HttpSession hs=request.getSession(true);
         un=(String)hs.getAttribute("ijpusers2");
        ps1= con.prepareStatement("select * from ijpjobs where Status='Active' AND Hiring_manager=?");
        ps1.setString(1,un);
        rs=ps.executeQuery();
        rs1=ps1.executeQuery();%>
      <form name="f1" action="del2.jsp">
         <center><h2>Jobs to be delegated:&nbsp&nbsp&nbsp;<select name="s2">
                 <option>Select</option>
     <%while( rs1.next()){%>
     <option><%= rs1.getString("JobTitle")%></option>         
<%}%>
                 </select></h2><br><br>
    <center><h2>Delegated to Hiring manager:&nbsp&nbsp&nbsp;<select name="s1">
                 <option>Select</option>
      <%  while(rs.next()){%>
           
            <option><%=rs.getString("Hiring_manager")%></option></h2>
            <%}%>
    </select></h2><br><br><br>
    
    <center><input type="submit" value="Delegate">&nbsp&nbsp&nbsp&nbsp;<input type="button" value="Back" onclick="a()"></center>
        </form>
       <% 
        }
        catch (ClassNotFoundException e){System.out.println(e);}
        catch(SQLException e){System.out.println(e);}%>
    </body> <%}%>
</html>
