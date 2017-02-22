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
        <p>
              <%
                
                out.println(request.getParameter("Profile1")
                    + request.getParameter("Profile2") + "','"
                    + request.getParameter("CustRep") + "','"
                    + request.getParameter("DateTime") + "','"
                    + request.getParameter("Location") + "','"
                    + request.getParameter("BookingFee") + "','"
                    + request.getParameter("Comments") + "','"
                    + request.getParameter("User1Rating") + "','"
                    + request.getParameter("User2Rating"));
                %>
                
        </p>
        <% 
            String insertPersonQuery = "INSERT INTO date(Profile1,Profile2,CustRep,Date_Time,Location,BookingFee,Comments,User1Rating,User2Rating)"
                    + " VALUES ('"+request.getParameter("Profile1")+"','"
                    + request.getParameter("Profile2") + "','"
                    + request.getParameter("CustRep") + "','"
                    + request.getParameter("DateTime") + "','"
                    + request.getParameter("Location") + "','"
                    + request.getParameter("BookingFee") + "','"
                    + request.getParameter("Comments") + "','"
                    + request.getParameter("User1Rating") + "','"
                    + request.getParameter("User2Rating")+ "')";
            DBConnection.ExecUpdateQuery(insertPersonQuery);
           
            
        %>
        <h1>Added Record!</h1>
        <button type="button" class="btn btn-default" onclick="window.location.replace('CustRep.jsp');">Return</button>
        
        
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">
        
    </script>
    </body>
</html>
