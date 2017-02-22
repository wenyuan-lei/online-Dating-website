package DBWorks;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import static org.apache.tomcat.jni.User.username;

public class DBConnection {
    static String mysJDBCDriver = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://localhost:3306/The_Expendables";
    static String username = "root";
    static String password = "";
    
    public static java.sql.Connection myConnection = null;
                   
    static PreparedStatement myPreparedStatement = null;
   
    public static void autoCommit(boolean b){
        try {
            if(myConnection == null || (myConnection !=null && !myConnection.isValid(0)))
            {
                Class.forName(mysJDBCDriver).newInstance();
                myConnection = DriverManager.getConnection(url,username,password);
                if(b){
                    myConnection.commit();
                    myConnection.setAutoCommit(true);
                    System.out.println("true");
                }else{
                    
                    myConnection.setAutoCommit(false);
                    System.out.println("false");
                }
            }
        } catch (ClassNotFoundException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }catch (SQLException e){
            
        } catch (InstantiationException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
    
    public static ResultSet ExecQuery(String query){
        ResultSet myResultSet = null;
        try{
            if(myConnection == null || (myConnection !=null && !myConnection.isValid(0)))
            {
                Class.forName(mysJDBCDriver).newInstance();
                myConnection = DriverManager.getConnection(url,username,password);
            }
            myPreparedStatement = myConnection.prepareStatement(query);
            myResultSet = myPreparedStatement.executeQuery();
            
        } catch(ClassNotFoundException e)
        {
        }
        catch (SQLException e){
        } catch (InstantiationException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  myResultSet;
    }
    
    public static int ExecUpdateQuery(String query){
       int retValue = 0;
        try{
            if(myConnection == null || (myConnection !=null && !myConnection.isValid(0)))
            {
                Class.forName(mysJDBCDriver).newInstance();
                myConnection = DriverManager.getConnection(url,username,password);
                System.out.println(1);
            }
            myPreparedStatement = myConnection.prepareStatement(query);
            retValue = myPreparedStatement.executeUpdate();
            
        } catch(ClassNotFoundException e)
        {
        }
        catch (SQLException e){
        } catch (InstantiationException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  retValue;
    }
}
