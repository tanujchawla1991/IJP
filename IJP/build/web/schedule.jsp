<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript">
            function a(){
                location.href="reject.jsp"; 
            }
        </script>
    </head>
     <%! Connection con;
     PreparedStatement ps,ps1;
      ResultSet rs,rs1;
String nm,un,u2,j;
%>
    <body>
        <% try
        { 
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      }
       catch (ClassNotFoundException e)
       {System.out.println(e);}
     
       try{
       con= DriverManager.getConnection("jdbc:odbc:IJP");
       HttpSession hs=request.getSession(true);
        un=(String)hs.getAttribute("ijpusers2");
         u2=(String)hs.getAttribute("ijp");
          j=(String)hs.getAttribute("ijp1");
       }
        catch(SQLException e){
   System.out.println(e);
   }
        nm=request.getParameter("q");     
   if(nm.equals("Yes")){%>
   <form action="schedule1.jsp"> 
       <input type="submit" value="Schedule Interview">
     <%   ps1=con.prepareStatement("update ijpapplications set status='Interview scheduled' where Hiring_manager=? AND appliedbyUserID=? AND JobID=?");
                  ps1.setString(1,un);
                 ps1.setString(2, u2);
                 ps1.setString(3, j);
                 ps1.execute();  
     }
               else{%>
               <input type="button" value="Reject Application" onclick="a()">
               <%ps=con.prepareStatement("update ijpapplications set status='Rejected' where Hiring_manager=? AND appliedbyUserID=? AND JobID=?");
                  ps.setString(1,un);
                 ps.setString(2, u2);
                  ps.setString(3, j);
                 ps.execute();              
               }
      %>
   </form>
    </body>
</html>
