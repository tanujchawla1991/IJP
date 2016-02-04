<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
    </head>
        <%!Connection con;
           PreparedStatement ps,ps1;
           ResultSet rs;
        %>
          <jsp:include page="index.html"></jsp:include>
      <%
        String u1=request.getParameter("un");
        String f1=request.getParameter("fn");
        String l1=request.getParameter("ln");
        String e1=request.getParameter("em");
        String p1=request.getParameter("pw");
         try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
   ps=con.prepareStatement("select * from ijpusers where firstname=? AND lastname=? AND username=? AND emailID=?");
   ps.setString(1,f1);
   ps.setString(2,l1);
   ps.setString(3,u1);
   ps.setString(4,e1);
   rs=ps.executeQuery();
    if(rs.next()){
    String query="update ijpusers set password=? where username=?";
  ps1=con.prepareStatement(query);
  ps1.setString(1,p1);
  ps1.setString(2,u1);
  ps1.execute(); %>
  <center><h1>Password reset successfully<br><br><br>Login with a new password
      </h1></center>
  <%  response.setHeader("Refresh","2;login.jsp");}
     else{%>
     <center><h1> Invalid credentials </h1></center>
     <% response.setHeader("Refresh","2;forgot.jsp");
     }
    }
    catch(Exception e){
        System.out.println(e);
    }
    %>
   
</html>
