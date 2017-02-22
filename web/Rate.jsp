<%-- 
    Document   : CancelDate
    Created on : Nov 23, 2014, 7:49:23 PM
    Author     : Bruce
--%>

<%@page import="java.sql.ResultSet"%>
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
            String profile1 = request.getParameter("profile1");
            String profile2 = request.getParameter("profile2");
            String id = request.getParameter("id");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String comment = request.getParameter("comment");
            if (comment == null) {
                comment = "Comments Here";
            }
            String ratingstr = request.getParameter("rating");
            String url = "RateDateForm.jsp?profile1=" + profile1 + "&profile2=" + profile2 + "&date=" + date + "&time=" + time+"&id="+id;
            int rating = 1;
            try {
                rating = Integer.parseInt(ratingstr);
            } catch (NumberFormatException e) {
                response.sendRedirect(url);
            }
            if (rating > 5 || rating < 1) {
                response.sendRedirect(url);
            } else {
                String datetime = date + " " + time;
                if (id.equals(profile1)) {%>
                <p>1</p>
                    <%String query = "UPDATE Date SET Comments='" + comment + "',User1Rating='" + rating+"' WHERE Profile1='"+id+"' and Profile2='"+profile2 +"' and Date_Time='"+datetime+"'";
                    int rp = DBConnection.ExecUpdateQuery(query);
                    if (rp != 0) {
                        session.setAttribute("ProfileID", id);
                        session.setAttribute("state", "comment");
                        response.sendRedirect("User.jsp");
                    }
                } else {%>
                <p>2</p>
                    <%String query = "UPDATE Date SET Comments='" + comment + "',User2Rating='" + rating+"' WHERE Profile2='"+id+"' and Profile1='"+profile1 +"' and Date_Time='"+datetime+"'";
                    int rp = DBConnection.ExecUpdateQuery(query);
                    if (rp != 0) {
                        session.setAttribute("ProfileID", id);
                        session.setAttribute("state", "comment");
                        response.sendRedirect("User.jsp");
                    }
                }

            }
        %>

    </body>
</html>
