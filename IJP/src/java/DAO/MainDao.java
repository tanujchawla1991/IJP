
package DAO;

import java.sql.*;
abstract class MainDao {
    Connection con;
    public Connection getConnection(){
    try{Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");}
    catch(ClassNotFoundException e){
        System.out.println(e);
    }
    try{
    con=DriverManager.getConnection("jdbc:odbc:IJP");
    }
    catch(SQLException e){
    System.out.println(e);
    con=null;}
    return con;
    }
}
