<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
<%-- 
    Document   : processAddEmp
    Created on : Nov 25, 2014, 7:45:55 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <div id="success" >
        <h1></h1>
        <button type="button" class="btn btn-default" onclick="window.location.replace('AddEmp.jsp');">Return</button>
        </div> 
        
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function(){
             <% 
            
             String insertPersonQuery = "INSERT INTO Person(SSN,Password,FirstName,LastName,Street,City,State,Zipcode,Email,Telephone)"
                    + " VALUES ('"+request.getParameter("SSN")+"','"
                    + request.getParameter("Password") + "','"
                    + request.getParameter("FirstName") + "','"
                    + request.getParameter("LastName") + "','"
                    + request.getParameter("Street") + "','"
                    + request.getParameter("City") + "','"
                    + request.getParameter("State") + "',"
                    + request.getParameter("Zipcode") + ",'"
                    + request.getParameter("Email") + "','"
                    + request.getParameter("Telephone") + "')";
            
            String insertEmpQuery = "INSERT INTO Employee(SSN,Role,StartDate,HourlyRate)"
                    + "VALUES('" + request.getParameter("SSN") + "','"
                    + request.getParameter("Role") + "','"
                    + request.getParameter("StartDate") + "',"
                    + request.getParameter("HourlyRate") + ")";//hourly rate is int
            
            int myResultSet1 = DBConnection.ExecUpdateQuery(insertPersonQuery);
            int myResultSet2 = DBConnection.ExecUpdateQuery(insertEmpQuery);
           
         
          
        %>
                if(<%= myResultSet1 %> > 0 && <%= myResultSet2 %> > 0 ){
                    $("h1").html("Successfully added Employee");
                }else{
                    $("h1").html("Failed to add Employee");
                }
            
        });
    </script>
    </body>
</html>
