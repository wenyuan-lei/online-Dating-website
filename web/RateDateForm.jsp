<%-- 
    Document   : DateForm
    Created on : Nov 23, 2014, 9:48:21 AM
    Author     : Bruce
--%>

<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="A sample input webpage">
        <meta name="author" content="Adrian">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">



        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <title>User Input Form</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/styles.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .container {
                text-align: center;
                width: 500px
            }

            .borders {

                border: 1px solid black;
            }

        </style>
    </head>
    <body>
        
        <%String profile1 = request.getParameter("profile1");
            String profile2 = request.getParameter("profile2");
            String id=request.getParameter("id");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String datetime = date + " " + time;
            String query = "SELECT * from Date WHERE Profile1='" + profile1 + "' AND Profile2='" + profile2 + "' AND Date_Time = '" + datetime+ "'";
            ResultSet rs = DBConnection.ExecQuery(query);
            String commentbefore="Enter comments here";
            if (rs.next()){
                commentbefore = rs.getString("Comments");
            }
            else{
                query = "SELECT * from Date WHERE Profile1='" + profile2 + "' AND Profile2='" + profile1 + "' AND Date_Time = '" + datetime+ "'";
                rs = DBConnection.ExecQuery(query);
                commentbefore=rs.getString("Comments");
            }
        %>
        <div class="container">
            <h2>Date Rate Form</h2>
            
            <form method="post" action="Rate.jsp?profile1=<%=profile1%>&profile2=<%=profile2%>&date=<%=date%>&time=<%=time%>&id=<%=id%>" class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputcomment" class="col-sm-2 control-label">Comment:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="5" cols="30" name="comment"><%=commentbefore%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputRating" class="col-sm-2 control-label">Rating</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputrating"  name="rating" min="1" max="5">
                    </div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="secret" value="888" />
                    <button type="submit" class="btn btn-success">SUBMIT</button>
                    <button type="reset" class="btn btn-warning">CLEAR</button>
                </div>

            </form>

        </div>

        <!-- jQuery Version 1.11.0 -->
        <script src="js/jquery-1.11.0.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
