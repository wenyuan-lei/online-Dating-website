<%-- 
    Document   : CheckIfProfileSelected
    Created on : Nov 22, 2014, 10:25:09 AM
    Author     : Bruce
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String id=request.getParameter("Profile");
            if (id==null){
                response.sendRedirect("SelectProfile.jsp");
            }
            else{
                session.setAttribute("ProfileID", id);
                session.setAttribute("state", null);
                response.sendRedirect("User.jsp");
            }
        %>
    </body>
</html>
