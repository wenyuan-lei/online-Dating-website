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
            String updatePersonQuery = "UPDATE Person SET FirstName = '"
                    + request.getParameter("FirstName")+"'"
                     + ", Password = '"
                     + request.getParameter("Password")+"'"
                    + ", LastName = '"
                     + request.getParameter("LastName")+"'"
                     + ", Street = '"
                     + request.getParameter("Street")+"'"
                          + ", City = '"
                     + request.getParameter("City")+"'"
                          + ", State = '"
                     + request.getParameter("State")+"'"
                      + ", Zipcode = '"
                     + request.getParameter("Zipcode")+"'"
                     + ", Email = '"
                     + request.getParameter("Email")+"'"
                     + ", Telephone = '"
                     + request.getParameter("Telephone")+"'"
                    + " WHERE SSN = '"
                    + request.getParameter("SSN")+"'";

            DBConnection.ExecUpdateQuery(updatePersonQuery);
           String updateUserQuery = "UPDATE User SET PPP = '"
                   + request.getParameter("PPP")+"'" 
                       + ", Rating = '"
                     + request.getParameter("Rating")+"'"
                   + " WHERE SSN = '"
                    + request.getParameter("SSN")+"'";
           DBConnection.ExecUpdateQuery(updateUserQuery);
        %>
        <h1>Edited Customer!</h1>
        <button type="button" class="btn btn-default" onclick="window.location.replace('CustRep.jsp');">Return</button>
        
        
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">
        
    </script>
    </body>
</html>
