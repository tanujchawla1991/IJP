
package DAO;

import beans.ijpjobs;
import java.sql.*;


public class ijpjobDAO extends MainDao{
   Connection con;
    ResultSet rs;
     PreparedStatement ps,ps1;
     public boolean insertJob(ijpjobs j1){
     try{
     con=getConnection();
     ps=con.prepareStatement("insert into ijpjobs(JobTitle,Grade,No_of_positions,Status,Post_date,Hiring_manager) VALUES(?,?,?,?,?,?)");
ps.setString(1,j1.getJobtitle());
ps.setString(2, j1.getGrade());
ps.setInt(3, j1.getNo_of_positions());
ps.setString(4, "Active");
ps.setDate(5, j1.getPostdate());
ps.setString(6,j1.getHiring_manager());
    ps.execute();
    return true;
    }
 catch(SQLException e){System.out.println(e);
 return false;}
 }
     
       
  public void updateJob(ijpjobs j1){
 try{
     con=getConnection();
ps1=con.prepareStatement("update ijpjobs set Status='Inactive' where DateDiff('d',Post_date,Now)>=15 ");
    ps1.executeUpdate();
    }
 catch(SQLException e){System.out.println(e); }
 }
}
