<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="index.html"></jsp:include>
    </head>
    <body>
          <font size="6"><b><center><font color="lightblue">LOGIN</font></center></b></font><br><br><br>
        <form action="login" method="get">
            <font color="lightblue">   
            <table align="center" width="50%" height="50%">
                <tr><td><h2> Username:</h2></td><td><input type="text" name="u1"></td></tr>
        <tr><td><h2>Password:</h2></td><td><input type="password" name="p1"></td></tr>
        <tr><td><h2>Role:</h2></td><td><select name="r1">
            <option>Admin</option>
            <option>User</option>
            <option>Hiring Manager</option>
        </select></font></td></tr>
            </table><br><br>
            <center>  <input type="submit" name="b1" value="Login">
                <h2>  <font color="lightblue"><a href="forgot.jsp"> Forgot Password</a> </font></h2></center>
        </form>
    </body>
</html>
