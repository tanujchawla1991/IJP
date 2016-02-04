<%@page import="beans.ijpjobs"%>
<%@page import="DAO.ijpjobDAO"%>
<%@page import="DAO.Daofactory"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!ijpjobDAO d1;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <jsp:include page="index.html"></jsp:include>
    <body>
        <jsp:useBean  class="beans.ijpjobs" id="j1"/>
         
        <%    
java.util.Date date=new java.util.Date();
java.sql.Date pd = new java.sql.Date(date.getTime());   
    
 
j1.setJobtitle(request.getParameter("t1"));
j1.setNo_of_positions(Integer.parseInt(request.getParameter("n1")));
j1.setGrade(request.getParameter("g1"));
j1.setStatus("Active");
j1.setPostdate(pd);
j1.setHiring_manager(request.getParameter("h1"));
d1=(ijpjobDAO)Daofactory.getDao("ijpjobDAO");
       boolean b= d1.insertJob(j1);
d1.updateJob(j1);
%>
    <center><h1>Job successfully posted</h1></center><BR>
    <center><h1><a href="postjobs.jsp">Post more jobs???</a></h1></center><BR><BR>
    <form name="f1" action="Admin.jsp">
        <CENTER><input type="submit" value="Back"></center>
    </form>
    </body>
</html>
