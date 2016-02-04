<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <script type="text/javascript"  src="st2.js"></script>
    </head>
    <%!
Connection con;
   ResultSet rs;
   PreparedStatement ps;
%>
     <jsp:include page="index.html"></jsp:include>
    <body>
       <h1><b><center><font color="lightblue">REACTIVATE JOBS</center></b></h1><br><br><br>
       <form name="f1" method="post">
 <center><h2>  Hiring Managers &nbsp&nbsp&nbsp&nbsp<select name="h1" onchange="showuser(this.value)">
                    <option>All</option>
               <% try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
  ps=con.prepareStatement("select distinct Hiring_manager from ijpjobs");
    rs=ps.executeQuery();
     while(rs.next()){ %>
     <option><%=rs.getString("Hiring_manager")%></option>
                <%
     }
 }
    catch(Exception e){
System.out.println(e);
}
%>

            </select></center><br><br><br>
            <center><input type="submit" value="Reactivate" hidden="true"></center> 
            </form>
        <div id="s1"></div>
    </body>
</html>
