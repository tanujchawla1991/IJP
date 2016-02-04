
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;



public class uploadservlet extends HttpServlet {
Connection con;
PreparedStatement ps,ps1;
ResultSet rs,rs1;
String u,un,nm;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
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
      int x=is.read();
      while(x>=0){
      fos.write((byte)x);
      x=is.read();
      }
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
 out.println("File uploaded");
response.setHeader("Refresh","2;Apply.jsp");
}
catch(ClassNotFoundException e) {System.out.print(e);
}
catch(SQLException e){System.out.print(e);}
    }
        }
      catch(Exception e){
System.out.println(e);
}  
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}