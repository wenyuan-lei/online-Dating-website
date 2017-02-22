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
            DBConnection.ExecUpdateQuery(insertPersonQuery);
            String insertEmpQuery = "INSERT INTO User(SSN,PPP,Rating,DateOfLastAct)"
                    + "VALUES('" + request.getParameter("SSN") + "','"
                    + request.getParameter("PPP") + "','"
                    + request.getParameter("Rating") + "','"
                    + request.getParameter("DateOfLastAct") + "')";
            DBConnection.ExecUpdateQuery(insertEmpQuery);
            
        %>
        <h1>Added Customer!</h1>
        <button type="button" class="btn btn-default" onclick="window.location.replace('CustRep.jsp');">Return</button>
        
        
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">
        
    </script>
    </body>
</html>
