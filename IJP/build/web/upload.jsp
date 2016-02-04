<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="index.html"></jsp:include>
    </head>
    <%!Connection con;
PreparedStatement ps,ps1;
ResultSet rs,rs1;
String u,un,nm;%>
    <body>
       <%  
        try {
      
                  DiskFileItemFactory factory = new DiskFileItemFactory();

           // factory.setRepository(new File("d:\\chirag"));
            ServletFileUpload upload = new ServletFileUpload(factory);
            List files=upload.parseRequest(request);
            Iterator it=    files.iterator();
      while(it.hasNext()){
          FileItem fi=(FileItem)it.next();
       InputStream is= fi.getInputStream();
       nm=fi.getName();
      FileOutputStream fos=new FileOutputStream("C:\\Users\\Tanuj\\Documents\\NetBeansProjects\\IJP\\web\\resumes\\"+nm);
      try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:IJP");
HttpSession hs=request.getSession(true);
 un=(String)hs.getAttribute("ijpusers1");
 ps1=con.prepareStatement("select UserID from ijpusers where username=?");
 ps1.setString(1, un);
 rs1=ps1.executeQuery();
 rs1.next();
 u= rs1.getString("UserID");
 ps=con.prepareStatement("update ijpusers set resume=? where UserID=?");
 out.println(nm);
 ps.setString(1,nm);
ps.setString(2,u);
 ps.execute();
}
catch(ClassNotFoundException e) {System.out.print(e);}
catch(SQLException e){System.out.print(e);}
             
      int x=is.read();
      while(x>=0){
      fos.write((byte)x);
      x=is.read();
      }
           }                    }
          catch(Exception e){
System.out.println(e);
}%>
<h1><center>File successfully uploaded</center></h1>
<% response.setHeader("Refresh","3;Apply.jsp"); %>
    </body>
</html>
