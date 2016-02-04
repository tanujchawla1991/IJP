package DAO;

import beans.ijpuser;
import java.sql.*;


public class ijpuserDAO extends MainDao{
static Connection con;
static ResultSet rs;
public static ijpuser login(ijpuser bean)
{
Statement st;
String un = bean.getUsername();
String pd = bean.getPassword();
String rl = bean.getRole();
String query = "select * from ijpusers where username='" + un + "' AND password='" + pd + "' AND role='"+rl+"'";
try
{
con =DriverManager.getConnection("jdbc:odbc:IJP");
st=con.createStatement();
rs = st.executeQuery(query); 
if(rs.next())
{
String firstName = rs.getString("firstname");
String lastName = rs.getString("lastname");
System.out.println("Welcome"+""+firstName);
bean.setFirstname(firstName);
bean.setLastname(lastName);
bean.setValid(true);
}
else 
{
System.out.println("Username/Password entered is Incorrect");
bean.setValid(false);
}
 
}
catch (Exception e)
{
System.out.println("Log In failed: An Exception has occurred! " + e);
}
return bean;
}
}
