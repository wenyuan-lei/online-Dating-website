<%-- 
    Document   : LikeProfile
    Created on : Nov 24, 2014, 1:13:33 PM
    Author     : Bruce
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String query;
            ResultSet rs;
            query = "SELECT * FROM Likes WHERE Liker='"+liker+"' AND likee='"+likee+"'";
            rs=DBConnection.ExecQuery(query);
            if (!rs.next()){
                query = "INSERT INTO Likes VALUES('"+liker+"','"+likee+"','"+dateFormat.format(cal.getTime())+"')";
                int rp = DBConnection.ExecUpdateQuery(query);
                if (rp != 0) {
                    session.setAttribute("ProfileID", liker);
                    session.setAttribute("state", "like");
                    response.sendRedirect("User.jsp");
                }
            }
            else{ 
                session.setAttribute("ProfileID", liker);
                session.setAttribute("state","failedlike");
                response.sendRedirect("User.jsp");
            }
            %>
    </body>
</html>
