<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script language="javascript">
            function a(){
               location.href="Admin.jsp";
            }
             
        </script>
    </head>
    <body>
        <%!
        Connection con;
PreparedStatement ps;   
ResultSet rs;
String i;
%>
       
      <%  int id=Integer.parseInt(request.getParameter("q"));
 try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
  ps=con.prepareStatement("select role from ijpusers where UserID=?");
  ps.setInt(1, id);
  rs=ps.executeQuery();
  
 while(rs.next()){
  i=rs.getString("role");
  }
   }
 catch(SQLException e){
    System.out.println(e);
    }            
%>              <form name="f1" action="urole.jsp">
                   <table align="center" width="50%" height="50%">
                       <input type="hidden" name="s" value="<%=id%>">
              <tr><td><h2>   Current role:</h2></td><td><input type="text" id="c1" disabled="true"value="<%=i%>" ></td></tr>          
             <tr><td><h2> Change role:</h2></td><td><select name="cr">
                <option>User</option>
                <option>Hiring manager</option>
            </select></td></tr>
               </table><br><br>
               <center><input type="submit" name="b1" value="Change Role" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                   <input type="button" value="Back" onclick="a()" hidden="true"></font></center>

        </form>
    </body>
</html>
