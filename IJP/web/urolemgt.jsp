<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript"  src="st.js"></script>
       <script language="javascript">
            function a(){
               location.href="Admin.jsp";
            }
             
        </script>
    </head>
     <%!
Connection con;
   ResultSet rs;
   PreparedStatement ps;
%>
    <jsp:include page="index.html"></jsp:include>
    <body>
           <h1><b><center><font color="lightblue">USER ROLE MANAGEMENT</center></b></h1><br><br><br>
           <form name="f2" method="post">
               <table align="center" width="50%" height="50%">
                   <tr><td><h2>User ID:</h2></td><td><select name="s1"  onchange="showrole(this.value)">
                     <option>Select</option>
               <% try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
         
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
  ps=con.prepareStatement("select UserID from ijpusers where role='User'OR role='Hiring manager'");
 
    rs=ps.executeQuery();
  
     while(rs.next()){ %>
     
     <option><%=rs.getString("UserID")%></option>
                <%}%> </select></td></tr>
   <%
 }
    catch(Exception e){
System.out.println(e);
}
%>

                   <input type="submit" name="b1" value="Change Role" hidden="true" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                   <input type="button" value="Back" onclick="a()">    
               </table>  

           </form>
 <div id="s1"></div>          
    </body>
</html>
