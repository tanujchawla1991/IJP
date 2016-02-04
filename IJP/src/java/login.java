import DAO.ijpuserDAO;
import beans.ijpuser;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet { 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     try{
        ijpuser bean = new ijpuser();
     String uname= request.getParameter("u1");
     bean.setUsername(uname);
     bean.setPassword(request.getParameter("p1"));
String r=request.getParameter("r1");
 bean.setRole(r);
     bean =ijpuserDAO.login(bean);

     if (bean.isValid()&&r.equals("Admin"))
     {
          HttpSession hs = request.getSession(true);
          hs.setAttribute("ijpusers",uname);
          response.sendRedirect("Admin.jsp"); 
     }
     else  if (bean.isValid()&&r.equals("User"))
     {
          HttpSession hs = request.getSession(true);
          hs.setAttribute("ijpusers1",uname);
          response.sendRedirect("User.jsp"); 
     }
     else  if (bean.isValid()&&r.equals("Hiring Manager"))
     {
          HttpSession hs = request.getSession(true);
          hs.setAttribute("ijpusers2",uname);
          response.sendRedirect("HR.jsp"); 
     }
     else
          response.sendRedirect("invalidlogin.jsp"); 
    }
     catch (Exception e)
{
     System.out.println(e);
}
}
}

