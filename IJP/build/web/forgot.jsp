<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script language="javascript">  function a(){
            var x,x1;
            x=document.f1.pw.value;
            x1=document.f1.pw1.value;
            if(x!==x1){
                alert("Passwords do not match");
                 document.f1.pw1.focus();
                 return false;
            }
            else{
                document.f1.action="forgot1.jsp";
                document.f1.submit();
                return true;
            }
        }
         function b(){
                document.f1.action="login.jsp";
            }
        </script>
        <title>JSP Page</title>
        <script language="javascript"></script>
        <jsp:include page="index.html"></jsp:include>
    </head>
   <body>
         <h1><center><b><font color="lightblue">FORGOT PASSWORD</b></center></h1><br><br>
        <form name="f1" method="post">
            <table align="center" width="50%" height="50%">
                <tr><td><h2> Username:</h2></td><td><input type="text" name="un"></td></tr>
        <tr><td><h2>First name:</h2></td><td><input type="text" name="fn"></td></tr>
        <tr><td><h2>Last name:</h2></td><td><input type="text" name="ln"></td></tr>
        <tr><td><h2>Email ID:</h2></td><td><input type="email" name="em" ></td></tr>
        <tr><td><h2>New Password:</h2></td><td><input type="password" name="pw"></td></tr>
        <tr><td><h2>Confirm password:</h2></td><td><input type="password" name="pw1"></td></tr>
       </table><br>
       <center>  <input type="submit" value="Submit" onclick=" return a()">&nbsp&nbsp&nbsp&nbsp&nbsp;
            <input type="submit" value="Back" onclick="b()"></center></font>
      </script>
        </form>

    </body>
</html>
