<%-- 
    Document   : salesReport
    Created on : Nov 19, 2014, 3:23:34 PM
    Author     : Kevin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DBWorks.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% 
            int month = Integer.parseInt(request.getParameter("month"));
            int year = Integer.parseInt(request.getParameter("year"));
            String getSalesReportQuery = "SELECT Sum(D.BookingFee) AS SalesReport FROM Date D WHERE "
                 + "YEAR(D.Date_Time)="+year+" AND MONTH(D.Date_Time)="+month;
             ResultSet salesRs = DBConnection.ExecQuery(getSalesReportQuery);
             
        %>
    
    </head>
    <body>
        <h1>Sales report for <% out.print(month); %>, <% out.print(year); %>
        <%
                while(salesRs.next()){
                out.println(salesRs.getDouble("SalesReport"));
                }
        %>
        </h1>
        <h1>Hello World!</h1>
    </body>
</html>
