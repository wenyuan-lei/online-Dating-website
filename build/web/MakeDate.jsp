<%-- 
    Document   : MakeDate
    Created on : Nov 23, 2014, 11:39:25 AM
    Author     : Bruce
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String datetime = (String) request.getParameter("datetime") + ":00";
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();

            String location = (String) request.getParameter("location");
            String dater = (String) request.getParameter("dater");
            String datee = (String) request.getParameter("datee");
            String custrep = (String) request.getParameter("custrep");
            String url = "DateForm.jsp?datee=" + datee + "&dater=" + dater;
            if (datetime == null || location == null) {
                response.sendRedirect(url);
            } else {
                String query = "INSERT INTO Date VALUES('" + dater + "','" + datee + "','" + custrep + "','" + datetime + "','" + location + "', '0' , 'Comments Here', '-1', '-1')";
                int rp = DBConnection.ExecUpdateQuery(query);
                if (rp != 0) {
                    session.setAttribute("ProfileID", dater);
                    session.setAttribute("state", "make");
                    response.sendRedirect("User.jsp");
                } else {
                    response.sendRedirect(url);
                }
            }
        %>


        <!-- jQuery Version 1.11.0 -->
        <script src="js/jquery-1.11.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="../../assets/js/docs.min.js"></script>
    </body>
</html>
