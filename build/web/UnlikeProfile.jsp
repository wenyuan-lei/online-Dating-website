<%-- 
    Document   : LikeProfile
    Created on : Nov 24, 2014, 1:13:33 PM
    Author     : Bruce
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DBWorks.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String likee = request.getParameter("likee");
            String liker = request.getParameter("liker");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String datetime=date+" "+time;
            String query;
            query = "DELETE FROM Likes WHERE Liker='"+liker+"' AND likee='"+likee+"' AND Date_Time = '" + datetime+ "'";
            int rd=DBConnection.ExecUpdateQuery(query);
            if (rd!=0){
                session.setAttribute("ProfileID", liker);
                session.setAttribute("state","unlike");
                response.sendRedirect("User.jsp");
            }%>
            <p><%=rd%></p><%
            %>
    </body>
</html>
