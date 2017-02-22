<%@page import="java.sql.ResultSetMetaData"%>
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

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Manager</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" id="emp" onclick="showEmp();" >Employee</a></li>
            <li><a href="#" onclick="showUser();" >User</a></li>
            <li><a  href="Date.jsp" >Date</a></li>
            <li><a href="index.html">Logout</a></li>
          </ul>
          
        </div>
      </div>
    </nav>
      
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="Manager.jsp">Home <span class="sr-only">(current)</span></a></li>
            <li><a onclick="showAEDEmp();" href="#" >Add, Edit, Delete Employee </a></li>
            <li onclick="showSalesReport();"><a href="#">Sales Reports</a></li>
            <li onclick="showCustRevByDate();"><a href="#">Revenue from Dates by Customer</a></li>
            <li onclick="showCustTotalRev();"><a href="#">Most revenue customer</a></li>
            <li onclick="showActiveCust();"><a href="#">Most active customers</a></li>
            <li onclick="showCustRepTotalRev();"><a href="#">Most Revenue Customer Representative</a></li>
            <li onclick="showHighRateCust();"><a href="#">Highest-rated customers</a></li>
            <li onclick="showBestDays();"><a href="#">Best days to have a date</a></li>
            
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header" id="title">Your Dashboard</h1>
          
          <div class="playArea">
              <div id="activeUser" class="hidden">
                  <button type="button" onclick="showActiveCustLikes();" class="btn btn-default" >Based on # of Likes</button>
                  <button type="button" onclick="showActiveCustDates();" class="btn btn-default" >Based on # of Dates</button>
              </div>
              
                    
       <div id="salesReport" class="hidden">
        <div id="salesReportA">
         <form action="salesReport.jsp">
          <select name="month" class="dropdown">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            </select>
              <select name="year" class="dropdown">
                  <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
              </select>
              <button type="submit" class="btn btn-default">Obtain Report</button>
              </form>
              </div>
              <div id="salesReportB">
                  
              </div>
            </div>  <!-- End of get sales report-->
            <div id="aedEmp" class="hidden">
                <a  class="btn btn-default" href="AddEmp.jsp">Add Employee</a>
                <a  class="btn btn-default" href="EditEmp.jsp">Edit Employee</a>
                <a  class="btn btn-default" href="DeleteEmp.jsp">Delete Employee</a>
            </div>
          </div>
          
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
        $(document).ready(function(){
            $('.nav.nav-sidebar li').click(function(){
                $('.nav.nav-sidebar li').removeClass('active');
                $(this).toggleClass('active');
                
            });
            $('.nav.nav-sidebar li a').click(function(){
                hideTable();
            });
        });
        function showBestDays(){
              $(".sub-header").html("Best days to have a date");
            showTable();
            hideActiveCust();
            hideAEDEmp();
            hideSalesReport();
            
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
                String bestDaysQuery = "SELECT DATE(D.Date_Time) AS Date, AVG(D.User1Rating+D.User2Rating) AS AvgRating"
                        + " FROM Date D"
                        + " WHERE YEAR(D.Date_Time)='2014'"
                        + " GROUP BY DATE(D.Date_Time)";
                ResultSet bestDaysRs = DBConnection.ExecQuery(bestDaysQuery);
                ResultSetMetaData bestDaysMd = bestDaysRs.getMetaData();
            %>
            $("#mainTable thead").append("<tr>");
            <% for(int k=1;k<bestDaysMd.getColumnCount()+1;k++){ %>
            $("#mainTable thead").append("<th>" + "<%= bestDaysMd.getColumnLabel(k) %>" + "</th>");
            <% }%>
            $("#mainTable thead").append("</tr>");
            <% while(bestDaysRs.next()){ %>
            $("#mainTable tbody").append("<tr><td>" + "<%= bestDaysRs.getString("Date") %>" 
            + "</td><td>" + "<%= bestDaysRs.getString("AvgRating") %>" 
            + "</td></tr>");
            <% } %>
        }
        function showHighRateCust(){
            showTable();
            $(".sub-header").html("Highest Rated Customers");
            hideActiveCust();
            hideAEDEmp();
            hideSalesReport();
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
            String highRateCustQuery = "SELECT * FROM User"
                    + " WHERE Rating > 2"
                    + " ORDER BY Rating DESC";
            ResultSet highRateCustRs = DBConnection.ExecQuery(highRateCustQuery);
             ResultSetMetaData highRateCustMd = highRateCustRs.getMetaData();
            %>
            $("#mainTable thead").append("<tr>");
            <% for(int k=1;k<highRateCustMd.getColumnCount()+1;k++){ %>
            $("#mainTable thead").append("<th>" + "<%= highRateCustMd.getColumnLabel(k) %>" + "</th>");
            <% }%>
            $("#mainTable thead").append("</tr>");
            <% while(highRateCustRs.next()){ %>
            $("#mainTable tbody").append("<tr><td>" + "<%= highRateCustRs.getString("SSN") %>" 
            + "</td><td>" + "<%= highRateCustRs.getString("PPP") %>" 
            + "</td><td>"+ "<%= highRateCustRs.getInt("Rating") %>"
            + "</td><td>"+"<%= highRateCustRs.getDate("DateOfLastAct").toString() %>" + "</td></tr>");
            <% } %>
        }
        function showCustRepTotalRev(){
            $(".sub-header").html("Total Revenue of Customer Representatives");
            showTable();
            hideActiveCust();
            hideAEDEmp();
            hideSalesReport();
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
             String activeCustRepQuery = "SELECT D.CustRep, SUM(D.BookingFee) AS TotalRevenue,COUNT(D.CustRep) AS NumDateTransactions"
                     + " FROM Date D"
                     + " GROUP BY D.CustRep"
                     + " ORDER BY TotalRevenue DESC"
                     ;
             ResultSet activeCustRepRs = DBConnection.ExecQuery(activeCustRepQuery);
             ResultSetMetaData activeCustRepMd = activeCustRepRs.getMetaData();
             
            %>
            $("#mainTable thead").append("<tr>");
            <% for(int k=1;k<activeCustRepMd.getColumnCount()+1;k++){ %>
            $("#mainTable thead").append("<th>" + "<%= activeCustRepMd.getColumnLabel(k) %>" + "</th>");
            <% }%>
            $("#mainTable thead").append("</tr>");
            <% while(activeCustRepRs.next()){ %>
            $("#mainTable tbody").append("<tr><td>" + "<%= activeCustRepRs.getString("CustRep") %>" 
            + "</td><td>" + "<%= activeCustRepRs.getFloat("TotalRevenue") %>" 
            + "</td><td>"+ "<%= activeCustRepRs.getInt("NumDateTransactions") %>" +"</td></tr>");
            <% } %>
        }
        function showActiveCustLikes(){
            showTable();
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
                String activeCustLikeQuery = "SELECT P.OwnerSSN,COUNT(P.OwnerSSN) AS NumOfLikes "
                        + " FROM Profile P,Likes L"
                        + " WHERE P.ProfileID=L.Liker"
                        + " GROUP BY P.OwnerSSN"
                        + " HAVING COUNT(P.OwnerSSN) >= 2"
                        + " ORDER BY NumOfLikes DESC";
                ResultSet activeCustLikeRs = DBConnection.ExecQuery(activeCustLikeQuery);
                ResultSetMetaData activeCustLikeMd = activeCustLikeRs.getMetaData();
                
            %>
                    
                    $("#mainTable thead").append("<tr>");
                    <% for(int k=1;k<activeCustLikeMd.getColumnCount()+1;k++){ %>
                        $("#mainTable thead").append("<th>" + "<%= activeCustLikeMd.getColumnLabel(k) %>" + "</th>");
                        <% }%>
                    $("#mainTable thead").append("</tr>");
                    <% while(activeCustLikeRs.next()){ %>
                        $("#mainTable tbody").append("<tr><td>" + "<%= activeCustLikeRs.getString("OwnerSSN") %>" 
                              + "</td><td>" + "<%= activeCustLikeRs.getInt("NumOfLikes") %>" + "</td></tr>");
                    <% } %>
                    
                    
        }
        function showActiveCustDates(){
            showTable();
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
             String activeCustDateQuery = "SELECT U.SSN,COUNT(U.SSN) AS NumOfDates"
                     + " FROM User U,Profile P,Date D"
                     + " WHERE P.OwnerSSN=U.SSN AND (P.ProfileID=D.Profile1 OR P.ProfileID=D.Profile2)"
                     + " GROUP BY U.SSN"
                     + " HAVING COUNT(NumOfDates) >= 2"
                     + " ORDER BY NumOfDates DESC"
                     ;
             ResultSet activeCustDateRs = DBConnection.ExecQuery(activeCustDateQuery);
             ResultSetMetaData activeCustDateMd = activeCustDateRs.getMetaData();
             
            %>
            $("#mainTable thead").append("<tr>");
            <% for(int k=1;k<activeCustDateMd.getColumnCount()+1;k++){ %>
            $("#mainTable thead").append("<th>" + "<%= activeCustDateMd.getColumnLabel(k) %>" + "</th>");
            <% }%>
            $("#mainTable thead").append("</tr>");
            <% while(activeCustDateRs.next()){ %>
            $("#mainTable tbody").append("<tr><td>" + "<%= activeCustDateRs.getString("SSN") %>" 
            + "</td><td>" + "<%= activeCustDateRs.getInt("NumOfDates") %>" + "</td></tr>");
            <% } %>
            
        }
        function showActiveCust(){
            hideTable();
            hideSalesReport();
            hideAEDEmp();
            $("#activeUser").removeClass("hidden");
            $("#title").html("Most Active Customers");
        }
        function hideActiveCust(){
            $("#title").html("");
            $("#activeUser").addClass("hidden");
        }
        
        function showAEDEmp(){
            hideTable();
            hideActiveCust();
            hideSalesReport();
            $("#title").html("Add Edit Delete Employee");
            $("#aedEmp").removeClass('hidden');
        }
        function hideAEDEmp(){
            $("#title").html("");
            $("#aedEmp").addClass('hidden');
        }
        function showSalesReport(){
            hideTable();
            hideActiveCust();
            hideAEDEmp();
            $("#title").html("Monthly Sales Report");
            $("#salesReport").removeClass('hidden');
        }
        function hideSalesReport(){
            $("#title").html("");
            $("#salesReport").addClass('hidden');
        }
        
        function showCustTotalRev(){
            showTable();
            hideActiveCust();
            hideAEDEmp();
            hideSalesReport();
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
            String getCustTotalRevQuery = "SELECT U.SSN, U.PPP, CASE U.PPP"
                    + " WHEN 'Super-User' THEN SUM(D.BookingFee)+100"
                    + " WHEN 'Good-User' THEN SUM(D.BookingFee)+50"
                    + " WHEN 'User-User' THEN SUM(D.BookingFee)"
                    + " END AS TotalRevenue"
                    + " FROM User U, Profile P, Date D"
                    + " WHERE U.SSN = P.OwnerSSN"
                    + " AND (P.ProfileID = D.Profile1 OR P.ProfileID = D.Profile2)"
                    + " GROUP BY U.SSN,U.PPP"
                    + " ORDER BY TotalRevenue DESC";
            java.sql.ResultSet custTotalRevRs = DBConnection.ExecQuery(getCustTotalRevQuery);
            String[] custTotalRevCol = {"SSN", "PPP","TotalRevenue"};
            %>
             $(".sub-header").html("Total Revenue from Customers");
            $("#mainTable thead").append("<tr>");
            
            <% for(String tmp: custTotalRevCol){ %>
               $("#mainTable thead").append("<th>" + "<%= tmp %>" + "</th>");
            <% } %>
                $("#mainTable thead").append("</tr>");
            <% while(custTotalRevRs.next()){ %>    
                $("#mainTable tbody").append("<tr><td>" + "<%= custTotalRevRs.getString("SSN") %>" + "</td><td>"
                    +"<%= custTotalRevRs.getString("PPP") %>" + "</td><td>"    
                    +"<%= custTotalRevRs.getFloat("TotalRevenue") %>"+"</td></tr>");
            <% }%>   
    
        }
        function showCustRevByDate(){
            showTable();
            hideAEDEmp();
            hideActiveCust();
            hideSalesReport();
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            <%
            String getCustRevDateQuery = "SELECT U.SSN, SUM(D.BookingFee)"
                    + " FROM User U, Profile P, Date D"
                    + " WHERE U.SSN = P.OwnerSSN"
                    + " AND (P.ProfileID = D.Profile1 OR P.ProfileID = D.Profile2)"
                    + " GROUP BY U.SSN"
                    + " ORDER BY SUM(D.BookingFee) DESC";
                java.sql.ResultSet custRevDateRs = DBConnection.ExecQuery(getCustRevDateQuery);
                String [] custRevDateColName = {"SSN","Date Revenue"};
            %>
            $(".sub-header").html("Revenue from Customer Dates Table");
            $("#mainTable thead").append("<tr>");
            <% for(String tmp: custRevDateColName){ %>
               $("#mainTable thead").append("<th>" + "<%= tmp %>" + "</th>");
            <% } %>
                $("#mainTable thead").append("</tr>");
            <% while(custRevDateRs.next()){ %>    
                $("#mainTable tbody").append("<tr><td>" + "<%= custRevDateRs.getString("SSN") %>" + "</td><td>"
                        +"<%= custRevDateRs.getFloat("SUM(D.BookingFee)") %>"+"</td></tr>");
            <% }%>   
        }
        
        function showEmp(){ 
            showTable();
            hideAEDEmp();
            hideActiveCust();
            hideSalesReport();
            <%
            String getEmpQuery = "SELECT * FROM Employee";
                java.sql.ResultSet empRs = DBConnection.ExecQuery(getEmpQuery);
                
                String getEmpColQuery = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` "
                        + "WHERE `TABLE_SCHEMA`='The_Expendables' AND `TABLE_NAME`='Employee';";
                java.sql.ResultSet empColRs = DBConnection.ExecQuery(getEmpColQuery);
            %>
            $("#mainTable thead").html("");
            $("#mainTable tbody").html("");
            $(".sub-header").html("Employee Table");
            $("#mainTable thead").append("<tr>");
            <% while(empColRs.next()){ %>
               $("#mainTable thead").append("<th>" + "<%= empColRs.getString("COLUMN_NAME") %>" + "</th>");
            <% } %>
                $("#mainTable thead").append("</tr>");
            <% while(empRs.next()){ %>    
                $("#mainTable tbody").append("<tr><td>" + "<%= empRs.getString("SSN") %>" + "</td><td>"+"<%= empRs.getString("Role") %>"
            +"</td><td>" + "<%= empRs.getDate("StartDate") %>"+"</td><td>" + "<%= empRs.getInt("HourlyRate") %>" + "</td></tr>");
            <% }%>   
        }
        function showUser(){
            showTable();
            hideAEDEmp();
            hideActiveCust();
            hideSalesReport();
            $("thead").html("");
            $("tbody").html("");
            <%
             String getUserQuery = "SELECT * FROM User";
                java.sql.ResultSet userRs = DBConnection.ExecQuery(getUserQuery);
                
                String getUserColQuery = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` "
                        + "WHERE `TABLE_SCHEMA`='The_Expendables' AND `TABLE_NAME`='User';";
                java.sql.ResultSet userColRs = DBConnection.ExecQuery(getUserColQuery);
            %>
            $(".sub-header").html("User Table");
            $("thead").append("<tr>");
            <% while(userColRs.next()){ %>
                $("thead").append("<th>" + "<%= userColRs.getString("COLUMN_NAME") %>" + "</th>");
            <% } %>
                $("thead").append("</tr>");
            <% while(userRs.next()){ %>    
                $("tbody").append("<tr><td>" + "<%= userRs.getString("SSN") %>" + "</td><td>"+"<%= userRs.getString("PPP") %>"
            +"</td><td>" + "<%= userRs.getInt("Rating") %>"+"</td><td>" + "<%= userRs.getDate("DateOfLastAct") %>" + "</td></tr>");
            <% }%>   
        }
        function showDate(){
            showTable();
            hideAEDEmp();
            hideActiveCust();
            hideSalesReport();
            $("thead").html("");
            $("tbody").html("");
            <%
            String getDateQuery = "SELECT * FROM Date";
                java.sql.ResultSet dateRs = DBConnection.ExecQuery(getDateQuery);
                
                String getDateColQuery = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` "
                        + "WHERE `TABLE_SCHEMA`='The_Expendables' AND `TABLE_NAME`='Date';";
                java.sql.ResultSet dateColRs = DBConnection.ExecQuery(getDateColQuery);
            %>
            $(".sub-header").html("Dates Table");
            $("thead").append("<tr>");
            <% while(dateColRs.next()){ %>
                $("thead").append("<th>" + "<%= dateColRs.getString("COLUMN_NAME") %>" + "</th>");
            <% } %>
                $("thead").append("</tr>");
            <% while(dateRs.next()){ %>    
                $("tbody").append("<tr><td>" + "<%= dateRs.getString("Profile1") %>" + "</td><td>"+"<%= dateRs.getString("Profile2") %>"
            +"</td><td>" + "<%= dateRs.getString("CustRep") %>"+"</td><td>" + "<%= dateRs.getDate("Date_Time") %>" + "</td><td>" 
            + "<%= dateRs.getString("Location") %>" + "</td><td>" + "<%= dateRs.getFloat("BookingFee") %>" + "</td><td>" +
            "<%= dateRs.getString("Comments") %>" + "</td><td>" + "<%= dateRs.getInt("User1Rating") %>" + 
            "</td><td>" + "<%= dateRs.getInt("User2Rating") %>" + "</td></tr>");
            <% }%>   
        }
        function hideTable(){
        $("#mainTable").hide();
        }
        function showTable(){
        $("#mainTable").show();
        }
        
        </script>
    
<!--    <script src="../../dist/js/bootstrap.min.js"></script>
    
    <script src="../../assets/js/docs.min.js"></script>-->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    
  </body>
</html>
