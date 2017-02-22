
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
<%
    String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    //System.out.println(dateFormat.format(date));
    String ssn = request.getParameter("ssn");
    String password = request.getParameter("password");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipcode = request.getParameter("zipcode");
    String email = request.getParameter("email");
    String telephone = request.getParameter("telephone");
    String profileID = request.getParameter("profileID");
    String age = request.getParameter("age");
    String datingAgeRangeStart = request.getParameter("datingAgeRangeStart");
    String datingAgeRangeEnd = request.getParameter("datingAgeRangeEnd");
    String datingGeoRange = request.getParameter("datingGeoRange");
    String m_f = request.getParameter("m_f");
    String hobbies = request.getParameter("hobbies");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
    String hairColor = request.getParameter("hairColor");
    
    String createPersonQuery = "INSERT INTO Person VALUES('" + ssn + "','" 
            + password + "','"
            + firstname + "','"
            + lastname + "','"
            + street + "','"
            + city + "','"
            + state + "',"
            + zipcode + ",'"
            + email + "','"
            + telephone + "'"
            + ")";
    String createUserQuery = "INSERT INTO User VALUES('" + ssn + "','"
            + "User-User',"
            + "3,'"
            + date + "'"
            +")";
    String createProfileQuery = "INSERT INTO Profile VALUES('" + profileID + "','"
            + ssn + "',"
            + age + ","
            + datingAgeRangeStart + ","
            + datingAgeRangeEnd + ","
            + datingGeoRange + ",'"
            + m_f + "','"
            + hobbies + "',"
            + height + ","
            + weight + ",'"
            + hairColor + "','"
            + date + "','"
            + date + "'"
            + ")";
    
    int x = DBConnection.ExecUpdateQuery(createPersonQuery);
    int y = DBConnection.ExecUpdateQuery(createUserQuery);
    int z = DBConnection.ExecUpdateQuery(createProfileQuery);
    
    if(x > 0 && y > 0 && z > 0){
    response.sendRedirect("index.jsp");
    }else{
        %>
       <% out.println(x);out.println(createPersonQuery); %>
       <% out.println(y);out.println(createUserQuery); %>
       <% out.println(z);out.println(createProfileQuery); %>
       <a href="Register.jsp" class="btn btn-default" >Try again</a>
    <%
    }
%>
</body>
</html>

