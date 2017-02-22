<%@page import="DBWorks.DBConnection"%>
<<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Student Registration System</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/styles.css" rel="stylesheet">
    </head>
    <body background="images/two.jpg">
        <!--login modal-->
        <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h1 class="text-center">Login</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form col-md-12 center-block" action="CheckIfProfileSelected.jsp" method="post">
                            <div class="form-group">
                                <label class="control-label"> </label>
                                <% String username = (String) session.getAttribute("login");
                                    
                                    String query = "SELECT * FROM Profile P WHERE P.OwnerSSN='" + username+"'";
                                    java.sql.ResultSet rs = DBConnection.ExecQuery(query);
                                                               
                                %>
                                <div class="form-group">
                                    <label class="control-label">Profile: </label>
                                    <div>
                                        <% while (rs.next()){%>
                                        <label class="radio">
                                            <input type="radio" name="Profile" id="profileid" value="<%=rs.getString("ProfileID")%>"><%=rs.getString("ProfileID")%>
                                        </label>
                                        <%}%>
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
                                        
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            <form action="index.jsp">
                                <button class="btn" data-dismiss="modal" onclick="" aria-hidden="true">Cancel</button>
                            </form>
                        </div>	
                    </div>
                </div>
            </div>
        </div>
        <!-- script references -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>




        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
