
package DAO;
import java.util.*;
public class Daofactory {
    static HashMap<String,MainDao> map;
    static{
    map=new HashMap<String, MainDao>();
    }
    public static MainDao getDao(String name){
    MainDao d1;
    d1=map.get(name);
    if(d1!=null)
        return d1;
    try{
        Class c1=Class.forName("DAO."+name);
    d1=(MainDao)c1.newInstance();
    }
    catch(Exception e){
    d1=null;
    }
    return d1;
    }
}
