<%-- 
    Document   : CancelDate
    Created on : Nov 23, 2014, 7:49:23 PM
    Author     : Bruce
--%>

<%@page import="DBWorks.DBConnection"%>
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
        
        <%
            String datee = request.getParameter("datee");
            String dater = request.getParameter("dater");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String datetime=date+" "+time;
            String query = "DELETE FROM Date WHERE Profile1='" + datee + "' AND Profile2='" + dater + "' AND Date_Time = '" + datetime+ "'";
            int rp = DBConnection.ExecUpdateQuery(query);
            if (rp != 0) {
                session.setAttribute("ProfileID", dater);
                session.setAttribute("state", "cancel");
                response.sendRedirect("User.jsp");
            }
            else {
                query="DELETE FROM Date  WHERE Profile1='" + dater + "' AND Profile2='" + datee + "' AND Date_Time = '" + datetime+ "'";
                rp = DBConnection.ExecUpdateQuery(query);
                if (rp != 0) {
                    session.setAttribute("ProfileID", dater);
                    session.setAttribute("state", "cancel");
                    response.sendRedirect("User.jsp");
                }
            }
            %>
            
    </body>
</html>
