<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <script language="javascript">  function a(){
            var x,x1;
            x=document.f2.n1.value;
            x1=document.f2.c1.value;
            if(x!==x1){
                alert("Passwords do not match");
                 document.f2.c1.focus();
                 return false;
            }
            else{
                document.f2.action="change.jsp";
                document.f2.submit();
                return true;
            }
           
        }
         function b(){
                document.f2.action="Admin.jsp";
            }
        </script>
    </head>
      <jsp:include page="index.html"></jsp:include>
    <body>
        <h1> <b><center><font color="lightblue">CHANGE PASSWORD</center></h1></b><br><br><br>
        <form name="f2" method="post">
            <font color="lightblue">   
            <table align="center" width="50%" height="50%">
                <tr><td><h2>  Username:</h2></td><td>  <input type="text" name="u1"></td></tr>
          <tr><td><h2> Old Password:</h2></td><td> <input type="password" name="o1"></td></tr>
          <tr><td><h2> New Password:</h2></td><td> <input type="password" name="n1"></td></tr>
          <tr><td><h2> Confirm Password:</h2></td><td> <input type="password" name="c1"></font></td></tr></table><br><br><br>
          <center>     <input type="submit" value="Submit" onclick="return a()">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                <input type="submit" value="Cancel" onclick="b()"></center>
        </form>
    </body>
</html>
