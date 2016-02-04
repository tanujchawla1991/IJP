<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="index.html"></jsp:include>
    <body>
         <%! Connection con;
       PreparedStatement ps,ps1,ps2,ps3,ps4,ps5,ps6;
       ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6;
     String i,id,un,u1;
     Date d;
    %>
      <% 
    i= request.getParameter("i1");
      try
        {
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      }
       catch (ClassNotFoundException e)
       {System.out.println(e);}
     
       try{ con= DriverManager.getConnection("jdbc:odbc:IJP");
        HttpSession hs=request.getSession(true);
        un=(String)hs.getAttribute("ijpusers1");
        ps1=con.prepareStatement("select * from ijpusers where username=?");
        ps1.setString(1, un);
        rs1=ps1.executeQuery();
        rs1.next();
        u1= rs1.getString("UserID");
      ps2=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID =? AND status=?");
       ps2.setString(1, i);         
        ps2.setString(2, u1);
        ps2.setString(3,"Applied");
        rs2=ps2.executeQuery();
        if(rs2.next()){%>
  <center>  <h1>Your CV is yet to be reviewed</h1></center>
<%  }
          ps3=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID =? AND status=?");
        ps3.setString(1, i); 
          ps3.setString(2, u1);
         ps3.setString(3,"Accepted");
          rs3=ps3.executeQuery();
                   if(rs3.next()){%>
 <center>  <h1>Your application has been accepted </h1></center>
<%   }          
        ps=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID =? AND status=?");
      ps.setString(1, i);       
        ps.setString(2, u1);
        ps.setString(3,"CV Reviewed");
        rs=ps.executeQuery();
         if(rs. next()){%>
    <center>  <h1>Your CV has been reviewed </h1></center>
    <% }   
         ps4=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID =? AND status=?");
      ps4.setString(1, i);       
        ps4.setString(2, u1);
        ps4.setString(3,"Interview scheduled");
        rs4=ps4.executeQuery();
         if(rs4. next()){%>
    <center>  <h1>Interview is scheduled </h1></center>
    <% }   
         ps5=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID =? AND status=?");
      ps5.setString(1, i);       
        ps5.setString(2, u1);
        ps5.setString(3,"Rejected");
        rs5=ps5.executeQuery();
         if(rs5. next()){%>
    <center>  <h1>Your application has been rejected </h1></center>
    <% }   
            ps6=con.prepareStatement("select * from ijpapplications where JobID=? AND appliedbyUserID =? AND status=?");
      ps6.setString(1, i);       
        ps6.setString(2, u1);
        ps6.setString(3,"Selected");
        rs6=ps6.executeQuery();
         if(rs6. next()){%>
    <center>  <h1>You are selected </h1></center>
    <% }   
            response.setHeader("Refresh","3;Appliedjob.jsp");   
       }         
     catch(SQLException e){System.out.println(e);}
       %>
    </body>
</html>
