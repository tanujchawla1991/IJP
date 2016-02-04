<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script lang="javascript">
            function a(){
             location.href="User.jsp";}
        </script>
    </head>
        <jsp:include page="index.html"></jsp:include>
    <body>
       <%! Connection con;
       String n;
    %>
    <%  
      n=request.getParameter("n1");
    try
        {Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
      catch (ClassNotFoundException e){System.out.print(e);
     }
      try   {  con= DriverManager.getConnection("jdbc:odbc:IJP");
              }             
         catch(SQLException e){System.out.println(e);}
    java.util.Date date=new java.util.Date();
java.sql.Date pd = new java.sql.Date(date.getTime());
 
 %>
         <h1><b><center><font color="lightblue">APPLY FOR JOB</center></b></h1><br><br><br>
        <form action= "upload.jsp" id= "form1" name= "form1" enctype= "multipart/form-data" method= "post">
         <table align="center" width="50%" height="50%">
             <tr><td><h2>Apply Date:</h2></td><td><input type="text" name="d1" disabled="true" value="<%=pd%>"></td></tr>
              <tr><td><h2>Upload resume:</h2></td>
                  <td> <input type="file" name="file" id="file" /></td></tr>
         </table><br><br>
         <center><input type="submit" value="Upload" name="upload" id="upload" />&nbsp&nbsp&nbsp&nbsp;  
               <input type="button" value="Back" onclick="a()"></center>
         </form>
    </body>
</html>
