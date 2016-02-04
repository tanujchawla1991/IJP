<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <jsp:include page="index.html"></jsp:include>
    </head>
      <% HttpSession hs=request.getSession(true);
     String un=(String)hs.getAttribute("ijpusers1");%>
     <div id="templatemo_menu_wrapper">
    <div id="templatemo_menu_panel">
       
        <ul>
            <li><a href="Useractivejob.jsp" target="_parent">View all active jobs</a></li> 
             <li><a href="Appliedjob.jsp" target="_parent">View jobs applied</a></li>
              <li><a href="Userchangepwd.jsp" target="_parent">Change Password</a></li>
              <li><a href="logout.jsp" target="_parent">Logout</a></li> 
        </ul> 
    </div>
    </div> 
    <body>
      <br><br><br><br>
    
         <h1><b><center><font color="lightblue"><font size="30">WELCOME <%=un%> </font></center></b><br></h1>
    </body>
</html>
