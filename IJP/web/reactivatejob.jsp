<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <jsp:include page="index.html"></jsp:include>
     <%!
Connection con;
   ResultSet rs;
   PreparedStatement ps;
   String query;
%>
    <body>
         <% 
                 try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
      int select=Integer.parseInt(request.getParameter("r1"));
 con=DriverManager.getConnection("jdbc:odbc:IJP"); 
  query="update ijpjobs set Status ='Active' where JobID=?";
       ps=con.prepareStatement(query);
       ps.setInt(1, select);
       ps.execute(); 
        }
        catch(Exception e){System.out.println(e);}%>
       ,<center> <h1>Selected job reactivated</h1></center><BR>
    <center>   <h1>  <a href="reactivate.jsp">REACTIVATE MORE JOBS??</a></h1>
    <form action="Admin.jsp">
        <input type="submit" value="Back"></center>
    </form>     
    </body>
</html>
