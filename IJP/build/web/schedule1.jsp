<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <jsp:include page="index.html"></jsp:include>
            <script language="javascript">
            function a(){
                location.href="HRjobsposted.jsp"; 
            }
        </script>
    </head>
     <%! Connection con;
      PreparedStatement ps,ps1;
      ResultSet rs,rs1;
String nm,un,u2;
%>
    <body>   
       <h1><b><center><font color="lightblue">INTERVIEW DETAILS</center></b></h1><br><br><br>
       <form name="f1" action="schedule2.jsp">
<h1><center>  Date of interview:&nbsp&nbsp&nbsp&nbsp;<input type="text" name="t1" value="7/30/2013" disabled="true"></center></h1>
<h1><center>Time of interview:&nbsp&nbsp&nbsp&nbsp;<input type="text" name="t2" value="9:00 a.m." disabled="true"></center></h1>
<h1><center><input type="submit" value="Schedule"></center></h1>
<h1><center><input type="button" value="Back" onclick="a()"></center></h1>

</form>
    </body>
</html>
