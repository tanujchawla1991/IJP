<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <script language="javascript" type="text/javascript">
function showDate() {
    document.getElementById("txt").value = Date();
}
function a(){
                document.f1.action="Admin.jsp";
            }
            function b(){
                document.f1.action="post.jsp";
                
            }    
            </script>
    </head>
    <jsp:include page="index.html"></jsp:include>
     <body onload="showDate()">
         <%!Connection con;
           PreparedStatement ps;
           ResultSet rs;
        %>
      
         <h1><b><center><font color="lightblue">POST JOBS</center></b></h1><br><br><br>
               <%  
               try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
  ps=con.prepareStatement("select max(JobID) from ijpjobs");
    rs=ps.executeQuery();
    rs.next();
    int n1=rs.getInt(1);
%>  <form name="f1" method="post">
             <table align="center" width="60%"><tr><td>      
                         <h2>Job ID:</h2></td><td><input type="text" name="i1" disabled="true" value="<%=n1+1%>"></td> </tr>
                 <tr><td><h2>   Post Date:</h2></td><td><input type="text" id="txt" name="p1" disabled="true"/> </td></tr>
                 <tr><td> <h2>    Job Title:</h2></td><td><input type="text" id="txt1" name="t1"></td></tr>
                 <tr><td> <h2> No.of posts:</h2></td><td><input type="text" id="txt2" name="n1"></td></tr>
              <tr><td> <h2> Job grade:</h2></td><td><input type="text" id="txt3" name="g1"></td></tr>
              <tr><td> <h2> Hire Manager:</h2></td><td><select name="h1" id="txt4">
              <%ps=con.prepareStatement("select firstname from ijpusers where role='Hiring Manager'");
 rs=ps.executeQuery();%>
 <option>Select</option>
 <%while(rs.next()){ %>
 
                <option><%=rs.getString("firstname")%></option>
                <%}
 }
catch(Exception e)
{System.out.println(e);} 
%>
            </select></td></tr>
             </table><br><br>
            
            <center><input type="submit" value="Submit" onclick="b()">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
              <input type="submit" value="Back" onclick="a()"></font></center>
        </form>
    </body>
</html>