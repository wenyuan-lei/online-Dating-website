<%-- 
    Document   : DateForm
    Created on : Nov 23, 2014, 9:48:21 AM
    Author     : Bruce
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
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
        <%String dater=request.getParameter("dater");
        String datee=request.getParameter("datee");
        String query="SELECT * FROM Employee WHERE role='CustRep'";
        ResultSet rs=DBConnection.ExecQuery(query);
        Calendar cal=Calendar.getInstance();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = dateFormat.format(cal.getTime());
        %>
        <div class="container">
            <h2>Date Input Form</h2>
            <form method="post" action="MakeDate.jsp?dater=<%=dater%>&datee=<%=datee%>" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputDate" class="col-sm-4 control-label">Date Time:</label>
                        <div class="col-sm-8">
                            <input type="datetime" min="<%=date%>" class="form-control" id="inputdate"  name="datetime" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputLocation" class="col-sm-4 control-label">Location</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputLocation" placeholder="Location" name="location">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Customer Rep: </label>
                        <select class="col-sm-8 input-group-sm" name="custrep">
                            <% while (rs.next()){ %>
                            <option class="option"><%=rs.getString("SSN")%></option>
                            <%}%>
                        </select>
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
