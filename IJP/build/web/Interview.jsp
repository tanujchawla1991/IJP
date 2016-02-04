<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script language="javascript">
            function a(){
                location.href="reject1.jsp"; 
            }
        </script>
    </head>
      <script type="text/javascript"  src="int.js"></script>
     <jsp:include page="index.html"></jsp:include>
    <body>
          <%! Connection con;
    PreparedStatement ps,ps1,ps2;
    ResultSet rs,rs1,rs2;
     String i,s;
    %>
       <%
     try
        {
           i= request.getParameter("i1");
    s=request.getParameter("i2"); 
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      }
       catch (ClassNotFoundException e)
       {System.out.println(e);}
     
       try{
       con= DriverManager.getConnection("jdbc:odbc:IJP");
        HttpSession hs = request.getSession(true);
          hs.setAttribute("ijp",s);
          hs.setAttribute("ijp1",i);
       ps=con.prepareStatement("update ijpapplications set status='CV Reviewed' where JobID=?");
       ps.setString(1,i);
      ps.executeUpdate();
       }
        catch(SQLException e){
   System.out.println(e);
   }
%>
 <center>  <h1>CV REVIEWED</h1></center><br><br><br>
 <center>  <h1>Candidate's profile matches job requirements???</h1></center>
 <form name="f1" action="schedule1.jsp?i1=<%=s%>">
      <center><select name="s1" onchange="show(this.value)"><br><br><br>
             <option>Select</option>
             <option>Yes</option>
              <option>No</option>
         </select>
         <input type="submit" value="Schedule Interview" hidden="true">
         <input type="button" value="Reject Application" onclick="a()" hidden="true">
 </form>
   <div id="s1"></div>
    </body>
</html>
