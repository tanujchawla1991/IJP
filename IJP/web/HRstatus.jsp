<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="index.html"></jsp:include>
    </head>
    <body>
        <%! Connection con;
       PreparedStatement ps,ps1,ps2,ps3,ps4,ps5;
       ResultSet rs,rs1,rs2,rs3,rs4,rs5;
     String i,id,un,u1,u;
     Date d;
    %>
      <% 
    i= request.getParameter("i1");
       u= request.getParameter("i2");
      try
        {
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      }
       catch (ClassNotFoundException e)
       {System.out.println(e);}
     
       try{ con= DriverManager.getConnection("jdbc:odbc:IJP");
        HttpSession hs=request.getSession(true);
        un=(String)hs.getAttribute("ijpusers2");
      ps2=con.prepareStatement("select * from ijpapplications a where a.JobID=? AND a.Hiring_manager=? AND a.status=? AND a.appliedbyUserID=?");
      ps2.setString(1, i);         
      ps2.setString(3,"Applied");
      ps2.setString(2, un);
      ps2.setString(4, u);
      rs2=ps2.executeQuery();
        if(rs2.next()){%>
  <center>  <h1>CV YET TO BE REVIEWED</h1></center><br><br><br>
   <center>  <h1><a href="Reviewresume.jsp?i1=<%=i%>&i2=<%=u%>">Review Resume</a></h1></center>
<%  }
         ps3=con.prepareStatement("select * from ijpapplications a where a.JobID=?  AND a.Hiring_manager=? AND a.status=? AND a.appliedbyUserID=?");
         ps3.setString(1, i); 
         ps3.setString(3,"Accepted");
         ps3.setString(2, un);
         ps3.setString(4, u);
         rs3=ps3.executeQuery();
                   if(rs3.next()){%>
 <center>  <h1>ACCEPTED</h1></center><br><br>
  <center>  <h1><a href="schedule1.jsp?i1=<%=i%>&i2=<%=u%>">Schedule Interview</a></h1></center>
<%   }          
        ps=con.prepareStatement("select * from ijpapplications a where a.JobID=?  AND a.Hiring_manager=? AND a.status=? AND a.appliedbyUserID=?");
      ps.setString(1, i);       
      ps.setString(3,"CV Reviewed");
      ps.setString(2, un);
      ps.setString(4, u);
      rs=ps.executeQuery();
         if(rs. next()){
           response.sendRedirect("Interview.jsp?i1="+i+"&i2="+u);
    }  
      ps1=con.prepareStatement("select * from ijpapplications a where a.JobID=?  AND a.Hiring_manager=? AND a.status=? AND a.appliedbyUserID=?");
      ps1.setString(1, i);       
      ps1.setString(3,"Rejected");
      ps1.setString(2, un);
      ps1.setString(4, u);
      rs1=ps1.executeQuery();
         if(rs1. next()){
           response.sendRedirect("reject1.jsp");
    }  
      ps4=con.prepareStatement("select * from ijpapplications a where a.JobID=?  AND a.Hiring_manager=? AND a.status=? AND a.appliedbyUserID=?");
      ps4.setString(1, i);       
      ps4.setString(3,"Interview scheduled");
      ps4.setString(2, un);
      ps4.setString(4, u);
      rs4=ps4.executeQuery();
         if(rs4. next()){
           response.sendRedirect("schedule3.jsp");
    }  
       ps5=con.prepareStatement("select * from ijpapplications a where a.JobID=?  AND a.Hiring_manager=? AND a.status=? AND a.appliedbyUserID=?");
      ps5.setString(1, i);       
      ps5.setString(3,"Selected");
      ps5.setString(2, un);
      ps5.setString(4, u);
      rs5=ps5.executeQuery();
         if(rs5. next()){
           response.sendRedirect("select2.jsp");
    }  
      
       }         
     catch(SQLException e){System.out.println(e);}
       %>
    </body>
</html>
