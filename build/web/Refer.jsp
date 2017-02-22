<%-- 
    Document   : Refer
    Created on : Nov 30, 2014, 3:05:27 PM
    Author     : Bruce
--%>

<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p><%=request.getParameter("c")%></p>
        <%
            String profileA = request.getParameter("a");
            String profileB = request.getParameter("b");
            String profileC = request.getParameter("c");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String query = "INSERT INTO BlindDate values('" + profileA + "','" + profileB + "','" + profileC + "','" + dateFormat.format(cal.getTime()) + "')";
            int rd = DBConnection.ExecUpdateQuery(query);
            if (rd!=0) {
                session.setAttribute("ProfileID", profileA);
                session.setAttribute("state", "refer");
                response.sendRedirect("User.jsp");
            }
        %>
    </body>
</html>
