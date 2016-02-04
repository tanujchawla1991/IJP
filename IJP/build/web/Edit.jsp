<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script lang="javascript">
              function b(){
                document.f1.action="Activejobs.jsp";
            }
            </script>
    </head>
     <jsp:include page="index.html"></jsp:include>
    <body>
        <%! Connection con;
    PreparedStatement ps,ps1,ps2;
     ResultSet rs,rs1,rs2;
     String i,j,k,l,m;
     String n;
    %>
     <h1><b><center><font color="lightblue">EDIT JOBS</center></b></h1><br><br><br>
      <%
       i= request.getParameter("d2");
       j= request.getParameter("d1");
       k= request.getParameter("d3");
       l= request.getParameter("d4");
       m= request.getParameter("d5");
       n= request.getParameter("d6");
       %>
       <form name="f1" method="post" action="update.jsp">
             <table align="center" width="60%">
                 <tr><td><h2>Job ID:</h2></td><td><input type="text" name="i1" value="<%=i%>"></td> </tr>
                 <tr><td> <h2>Job Title:</h2></td><td><input type="text"  name="t1" value="<%=j%>"></td></tr>
                 <tr><td> <h2>Job grade:</h2></td><td><input type="text" name="g1" value="<%=k%>"></td></tr>
                <tr><td> <h2>No.of posts:</h2></td><td><input type="text" name="n1" value="<%=l%>"></td></tr>
                <tr><td><h2>Post Date:</h2></td><td><input type="text" name="p1" value="<%=n%>" disabled="true" /> </td></tr>
                 <tr><td><h2>Hiring manager:</h2></td><td><input type="text" name="h1" value="<%=m%>"/> </td></tr>
             </table><br>
             <center><input type="submit" value="Update">&nbsp;&nbsp&nbsp&nbsp;
              <input type="submit" value="Back" onclick="b()"></center>
         </form>
    </body>
</html>
