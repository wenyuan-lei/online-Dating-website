<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Dashboard Template for Bootstrap</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/dashboard.css" rel="stylesheet">

    </head>

    <body>
         <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <%
                String id = (String) request.getParameter("ProfileID");
                String myid = (String)session.getAttribute("ProfileID");
                String LikeQuery = "SELECT * FROM Likes WHERE Liker='"+myid+"'";
                java.sql.ResultSet LikeRs=DBConnection.ExecQuery(LikeQuery);
            %>
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><%=id%></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="User.jsp?ProfileID=<%=id%>" id="emp"  >My Profile</a></li>
                        <li><a href="SelectProfile.jsp" >Change Profile</a></li>
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <input type="text" class="form-control" placeholder="Search...">
                    </form>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active" id="past"><a href="#" onclick="getPastDate();">Past Dates</a></li>
                        <li id="pending"><a href="#" onclick="getPendingDate();">Pending Dates</a></li>
                        <li id="mylike"><a href="#" onclick="myLike();">Like List</a></li>
                    </ul> 
            	</div>
            	
            	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header"><%=id%></h1>
                    
                    <form method="post" action="Refer.jsp?a=<%=myid%>&b=<%=id%>">
                        <button type=submit>Refer</button>
                        <label>To Your Friend</label>
                        <select name="c">
                        <%while (LikeRs.next()){
                            if (!LikeRs.getString("Likee").equals(id)){%>
                            <option class="option"><%=LikeRs.getString("Likee")%></option>
                        <%}}%>
                        </select>
                    </form>
                         <div id="mainTable">
                  <h2 class="sub-header"></h2>
                  <div class="table-responsive" >
                    <table class="table table-striped">
                        <thead>
                        </thead>
                        <tbody id="bodyemp">
                        </tbody>
                    </table>
                  </div>
                </div>
                </div>
            </div>
                       
        </div>          
                                    
                
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script href="js/bootstrap.min.js" ></script>
        <script type="text/javascript" language="javascript">
                            $(document).ready(function (){
                                 
                                $('.nav.nav-sidebar li').click(function(){
                                $('.nav.nav-sidebar li').removeClass('active');
                                $(this).toggleClass('active');
                                });
                                <%
                                 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                 Calendar cal = Calendar.getInstance();
                                %>
                            });
                            function getPastDate(){
                                <%
                                 String getPastDateQuery = "SELECT * FROM Date D WHERE (D.Profile1= '" + id 
                                         + "' OR D.Profile2= '" + id +"') AND D.Date_Time < '"+dateFormat.format(cal.getTime())+"'";
                                 java.sql.ResultSet getPastDateRs = DBConnection.ExecQuery(getPastDateQuery);
                                %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");;
                                $(".sub-header").html("Past Date Table");
                                $("thead").append("<tr><th>Profile1</th><th>Profile2</th><th>Date</th>"
                                        +"<th>Location</th><th>User1Rating</th><th>User2Rating</th></tr>");
                                <% while (getPastDateRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td><a href=\"ProfileInfo.jsp?ProfileID=<%=getPastDateRs.getString(1)%>\" >"+"<%=getPastDateRs.getString(1)%>"+"</td>"+
                                                      "<td><a href=\"ProfileInfo.jsp?ProfileID=<%=getPastDateRs.getString(2)%>\" >"+"<%=getPastDateRs.getString(2)%>"+"</td>"+
                                                      "<td>"+"<%=getPastDateRs.getDate(4)%> <%=getPastDateRs.getTime(4)%>"+"</td>"+
                                                      "<td>"+"<%=getPastDateRs.getString(5)%>"+"</td>"+
                                                      "<td>"+<%=(getPastDateRs.getInt(8)==-1)?"N/A":getPastDateRs.getInt(8)%>+"</td>"+
                                                      "<td>"+<%=(getPastDateRs.getInt(9)==-1)?"N/A":getPastDateRs.getInt(9)%>+"</td>");
                                    $("tbody").append("</tr");
                                <%}%>
                            }
                            function getPendingDate(){
                                
                            }
                            function myLike(){
                                
                            }
                            function showTable(){
                                
                            }
        </script>
        


        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="../../assets/js/docs.min.js"></script>
        <!-- jQuery Version 1.11.0 -->
        <script src="js/jquery-1.11.0.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
