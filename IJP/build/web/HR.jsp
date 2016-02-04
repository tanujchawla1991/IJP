<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <jsp:include page="index.html"></jsp:include>
    </head>
    <% HttpSession hs=request.getSession(true);
     String un=(String)hs.getAttribute("ijpusers2");%>
   <div id="templatemo_menu_wrapper">
    <div id="templatemo_menu_panel">
       
        <ul>
            <li><a href="HRjobsposted.jsp" target="_parent">Jobs to hire employees for</a></li>
             <li><a href="select.jsp" target="_parent">Select candidates</a></li>
            <li><a href="del1.jsp" target="_parent">Delegations</a></li>
              <li><a href="HRchangepwd.jsp" target="_parent">Change Password</a></li>
              <li><a href="logout.jsp" target="_parent">Logout</a></li> 
        </ul> 
    </div>
    </div> 
    <body>
         <br><br><br><br>
         <h1><b><center><font color="lightblue"><font size="30">WELCOME <%=un%> </font></center></b><br></h1>
    </body>
</html>
