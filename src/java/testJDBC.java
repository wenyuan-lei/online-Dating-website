/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Kevin
 */

    
import java.sql.*;

public class testJDBC {
 // JDBC driver name and database URL
 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
 static final String DB_URL = "jdbc:mysql://localhost/studentreg";
 // Database credentials
 static final String USER = "root";
 static final String PASS = "";
 
 public static void main(String[] args) {
 Connection conn = null;
 Statement stmt = null;
 try{
 //STEP 2: Register JDBC driver
 Class.forName("com.mysql.jdbc.Driver");
 //STEP 3: Open a connection
 System.out.println("Connecting to a selected database...");
 conn = DriverManager.getConnection(DB_URL, USER, PASS);
 System.out.println("Connected database successfully...");
 
 //STEP 4: Execute a query
 System.out.println("SELECTING FROM DATABASE...");
 stmt = conn.createStatement();
 
 String sql = "SELECT * FROM Course";
 ResultSet rs = stmt.executeQuery(sql);
 System.out.println("CrsCode\tDeptID\tCrsName\tInsNo");
 while(rs.next()){
     System.out.println(rs.getString("CrsCode")+'\t'+rs.getString("DeptID")+'\t'+rs.getString("CrsName")+'\t'+rs.getString("InsNo"));
 }
 System.out.println("Data selected successfully...");
 }catch(SQLException se){
 //Handle errors for JDBC
 se.printStackTrace();
 }catch(Exception e){
 //Handle errors for Class.forName
 e.printStackTrace();
 }finally{
 //finally block used to close resources

try{
 if(stmt!=null)
 conn.close();
 }catch(SQLException se){
 }// do nothing
 try{
 if(conn!=null)
 conn.close();
 }catch(SQLException se){
 se.printStackTrace();
 }//end finally try
 }//end try
 System.out.println("Goodbye!");
}//end main
}//end JDBCExample
