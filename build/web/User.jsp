<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
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
                
                String id = (String) session.getAttribute("ProfileID");
                String state= (String)session.getAttribute("state");
                
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
                        <li><a href="index.html">Logout</a></li>
                    </ul>
<!--                    <form class="navbar-form navbar-right">
                        <input type="text" class="form-control" placeholder="Search...">
                    </form>-->
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li id="home" class="active" onclick="showOtherUser();hideActiveButtons();"><a href="#" >Other User<span class="sr-only">(current)</span></a></li>
                        <li id="past" onclick="getPastDate();hideActiveButtons();"><a href="#" >My Past Dates</a></li>
                        <li id="pending" onclick="getPendingDate();hideActiveButtons();"><a href="#" >My Pending Dates</a></li>
                        <li id="mylike" onclick="myLike();hideActiveButtons();"><a href="#" >My Like List</li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li><a href="FindByTrait.jsp" >Profile Filter</a></li>
                        <li onclick="showActiveButtons();"><a href="#">Most Active</a></li>
                        <li onclick="highRateProfile();hideActiveButtons();"><a href="#">Most Highly Rated</a></li>
                        <li onclick="popGeo();hideActiveButtons();"><a href="#">Popular Geo-Date Location</a></li>
                        <li onclick="personalizedList();hideActiveButtons();"><a href="#">Date Suggestion</a></li>
                        <li onclick="suggestGeoDates();"><a href="#">Geo Date</a></li>
                    </ul>
                    
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header"><%= id %></h1>
                    
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
                    <div id="activenessButtons" class="hidden" >
                        <button type="button" class="btn btn-default" onclick="showActiveProfLike();">By Likes</button>
                        <button type="button" class="btn btn-default" onclick="showActiveProfDate();" >By Dates</button>
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
                            <%
                            
                            String currentUserAddQuery = "SELECT P.Street,P.City,P.State,P.Zipcode"
                        + " FROM Person P,Profile Pr"
                        + " WHERE Pr.ProfileID='"+(String)session.getAttribute("ProfileID")+"' AND P.SSN=Pr.OwnerSSN";
                            java.sql.ResultSet currentUserAddRs = DBConnection.ExecQuery(currentUserAddQuery);
                            while(currentUserAddRs.next()){
                            %>
                                    
                               getIndividualCoordinate("<%= currentUserAddRs.getString("Street") %>" 
                                       + "<%= currentUserAddRs.getString("City") %>" + ", "
                                       + "<%= currentUserAddRs.getString("State") %>" + " " 
                                       + "<%= currentUserAddRs.getInt("Zipcode") %>");
                            <%    
                            }
                            
                            %>
                                    
                            <%if (state!=null){ 
                                    if (state.equals("make")){%>
                                    alert("You date request has been sent.");
                                    
                                <%}
                                    if (state.equals("cancel")){%>
                                    alert("You succesfully cancel a date .");
                                <%}
                                    if (state.equals("like")){%>
                                        alert("You succesfully like this profile .");
                                        
                                <%}
                                    if (state.equals("failedlike")){%>
                                        alert("You already like this profile");
                                <%} if (state.equals("comment")){%>
                                        alert("You successfully comment a past date");
                                <%} if (state.equals("refer")){%>
                                        alert("You successfully refer a profile to your friend");
                                <%} }state=null; 
                                    %>
                            $('.nav.nav-sidebar li').click(function(){
                                $('.nav.nav-sidebar li').removeClass('active');
                                $(this).toggleClass('active');
                                });
                            <%
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                Calendar cal = Calendar.getInstance();
                            %>
                             
                        });
                        function showDateSuggestions(){
                        <%
                                String getLikesQuery = "SELECT L.Likee AS ProfileID, P.Age, P.DatingAgeRangeStart, P.DatingAgeRangeEnd, P.M_F, P.Hobbies, P.Height, P.Weight, P.HairColor, P.CreationDate, P.LastModDate"
                                        + " FROM Likes L, Profile P"
                                        + " WHERE L.Liker='" + id + "' AND P.ProfileID=L.Likee";
                                
                                java.sql.ResultSet suggestedProfilesRs=DBConnection.ExecQuery(getLikesQuery);
                                
                        %>    
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Suggested dates based on your likes");
                                $("thead").append("<tr>");
                                $("thead").append("<th>Profile</th><th>Age</th><th>DatingAgeRangeStart</th><th>DatingAgeRangeEnd</th><th>M_F</th><th>Hobbies</th><th>Height</th><th>Weight</th><th>HairColor</th><th>CreationDate</th><th>LastModDate</th>");
                                $("thead").append("</tr>");
                                <% while (suggestedProfilesRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td>"+"<%=suggestedProfilesRs.getString("ProfileID")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getInt("Age")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getInt("DatingAgeRangeStart")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getInt("DatingAgeRangeEnd")%>"+"</td>"+ 
                                              "<td>"+"<%=suggestedProfilesRs.getString("M_F")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getString("Hobbies")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getInt("Height")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getInt("Weight")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getString("HairColor")%>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getDate("CreationDate").toString() %>"+"</td>"+
                                              "<td>"+"<%=suggestedProfilesRs.getDate("LastModDate").toString() %>"+"</td>");
                                    $("tbody").append("</tr>");
                                <%}%>
                        }       
                        function showActiveProfLike(){
                            <%
                            String activeCustLikeQuery = "SELECT P.ProfileID,COUNT(P.ProfileID) AS NumOfLikes FROM Profile P,Likes L"
                                               + " WHERE P.ProfileID=L.Liker GROUP BY P.ProfileID"
                                              + " HAVING COUNT(P.ProfileID) >= 2 ORDER BY NumOfLikes DESC";
                                        java.sql.ResultSet activeCustLikeRs=DBConnection.ExecQuery(activeCustLikeQuery);
                            %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Most Active Profile Based on Likes Table");
                                $("thead").append("<tr>");
                                $("thead").append("<th>Profile</th>" +
                                                  "<th>Activeness</th>");
                                $("thead").append("</tr>");
                                <% while (activeCustLikeRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append(
                                                      "<td>"+"<%=activeCustLikeRs.getString(1)%>"+"</td>"+
                                                      "<td>"+"<%=activeCustLikeRs.getInt(2)%>"+"</td>"); 

                                    $("tbody").append("</tr>");
                                <%}%>
                        }
                        function showActiveProfDate(){
                            <%
                            String activeCustDateQuery = "SELECT P.ProfileID,COUNT(P.ProfileID) AS NumOfDates"
                                    + " FROM Profile P,Date D WHERE (P.ProfileID=D.Profile1 OR P.ProfileID=D.Profile2)"
                                    + " GROUP BY P.ProfileID HAVING COUNT(NumOfDates) >= 2"
                                    + " ORDER BY NumOfDates DESC";
                                        java.sql.ResultSet activeCustDateRs=DBConnection.ExecQuery(activeCustDateQuery);
                            %>
                                    showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Most Active Profile Based on Dates Table");
                                $("thead").append("<tr>");
                                $("thead").append("<th>Profile</th><th>Activeness</th>");
                                $("thead").append("</tr>");
                                <% while (activeCustDateRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td>"+"<%=activeCustDateRs.getString(1)%>"+"</td>"+
                                                      "<td>"+"<%=activeCustDateRs.getInt(2)%>"+"</td>"); 
                                    $("tbody").append("</tr>");
                                <%}%>
                        }
                        function hideActiveButtons(){
                            $("#activenessButtons").addClass("hidden");
                        }
                        function showActiveButtons(){
                            $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Activeness of profiles");
                            $("#activenessButtons").removeClass("hidden");
                        }
                        function highRateProfile(){
                            <%
                            String highRateProfileQuery = "SELECT User, SUM(Total)/SUM(Count) AS AvgRating FROM "
                                                +"(SELECT D.Profile1 AS User, SUM(D.User2Rating) AS Total, COUNT(D.Profile1) AS Count "
                                                +" FROM Date D, Profile P WHERE D.Profile1 = P.ProfileID AND D.User2Rating!=-1 GROUP BY User "
                                                +" UNION ALL SELECT D.Profile2 As User, SUM(D.User1Rating) AS Total, COUNT(D.Profile2) AS Count"
                                                +" FROM Date D, Profile P WHERE D.Profile2 = P.ProfileID AND D.User1Rating!=-1 GROUP BY User) T GROUP BY User HAVING AvgRating > 2.0 ORDER BY AvgRating DESC";
                                        java.sql.ResultSet highRateProfileRs=DBConnection.ExecQuery(highRateProfileQuery);
                            %>
                             showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Highly Rated Profile Based on Dates Table");
                                $("thead").append("<tr><th>Profile</th><th>Average Rating</th></tr>");
                                 <% while (highRateProfileRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append(
                                                      "<td>"+"<%=highRateProfileRs.getString(1)%>"+"</td>"+
                                                      "<td>"+"<%=highRateProfileRs.getFloat(2)%>"+"</td>"); 

                                    $("tbody").append("</tr>");
                                <%}%>
                        }
                        function popGeo(){
                            <%
                            String popularGeo = "SELECT D.Location, COUNT(D.Location) as Occurances FROM Date D GROUP BY D.Location HAVING COUNT(D.Location)>=2";
                            java.sql.ResultSet popularGeoRs=DBConnection.ExecQuery(popularGeo);
                            %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Popular Geo-Date Location Table");
                                $("thead").append("<tr><th>Location</th><th>Occurance</th></tr>");
                                <% while (popularGeoRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append(
                                                      "<td>"+"<%=popularGeoRs.getString(1)%>"+"</td>"+
                                                      "<td>"+"<%=popularGeoRs.getInt(2)%>"+"</td>"); 

                                    $("tbody").append("</tr>");
                                <%}%>
                            
                        }
                        
                         function showOtherUser(){
                             <%  String getOtherUserColQuery = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` "
                                                + "WHERE `TABLE_SCHEMA`='The_Expendables' AND `TABLE_NAME`='Profile';";
                                        java.sql.ResultSet otherUserColRs = DBConnection.ExecQuery(getOtherUserColQuery);
                                 String ownerssnQuery = "SELECT Person.SSN FROM Person, Profile P WHERE P.ProfileID='"+id+"'AND P.OwnerSSN=Person.SSN";
                                 java.sql.ResultSet ownerssnRs=DBConnection.ExecQuery(ownerssnQuery);
                                 String ssn="";
                                  if (ownerssnRs.next()){
                                      ssn=ownerssnRs.getString("SSN");
                                 }
                                  String getOtherUserProfile = "SELECT * FROM Profile ,User WHERE Profile.OwnerSSN !='" + ssn +"'AND Profile.OwnerSSN=User.SSN";
                                  java.sql.ResultSet otherUserProfileRs = DBConnection.ExecQuery(getOtherUserProfile);
                              %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Profile Table");
                                $("thead").append("<tr>");
                                 <% while (otherUserColRs.next()) {
                                    if (!otherUserColRs.getString("COLUMN_NAME").equals("OwnerSSN")
                                        &&!otherUserColRs.getString("COLUMN_NAME").equals("CreationDate")
                                        &&!otherUserColRs.getString("COLUMN_NAME").equals("LastModDate")){%>
                                    $("thead").append("<th>" + "<%= otherUserColRs.getString("COLUMN_NAME")%>" + "</th>");
                                    <%}%>
                                <% }%>
                                $("thead").append("<th>Operation</th>")
                                $("thead").append("</tr>");
                                
                                 <% while (otherUserProfileRs.next()){ %>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td><a href=\"ProfileInfo.jsp?ProfileID=<%=otherUserProfileRs.getString(1)%>\">"+"<%=otherUserProfileRs.getString(1)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getInt(3)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getInt(4)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getInt(5)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getInt(6)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getString(7)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getString(8)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getDouble(9)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getInt(10)%>"+"</td>"+
                                                      "<td>"+"<%=otherUserProfileRs.getString(11)%>"+"</td>");
                                    $("tbody").append("<input type=button onclick=\"javascrip:window.open('DateForm.jsp?datee=<%=otherUserProfileRs.getString(1)%>&dater=<%=id%>','_self');return;\" value=\"Date\">");
                                    $("tbody").append("<input type=button onclick=\"javascrip:window.open('LikeProfile.jsp?likee=<%=otherUserProfileRs.getString(1)%>&liker=<%=id%>','_self');return;\" value=\"Like\">");
                                    $("tbody").append("</tr");
                                <% } %>
                         }
                        function getPastDate(){
                            <%
                            String getPastDateQuery = "SELECT * FROM Date D WHERE (D.Profile1= '" + id + "' OR D.Profile2= '" + id +"') AND D.Date_Time < '"+dateFormat.format(cal.getTime())+"'";
                            java.sql.ResultSet getPastDateRs = DBConnection.ExecQuery(getPastDateQuery);
                            %>
                             showTable();
                                $("thead").html("");
                                $("tbody").html("");;
                                $(".sub-header").html("Past Date Table");
                                 
                                $("thead").append("<tr><th>Profile1</th><th>Profile2</th><th>Date</th><th>Location</th>"
                                                  + "<th>User1Rating</th><th>User2Rating</th><th>Operation</th></tr>");
                                <% while (getPastDateRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td><a href=\"ProfileInfo.jsp?ProfileID=<%=getPastDateRs.getString(1)%>\" >"+"<%=getPastDateRs.getString(1)%>"+"</td>"+
                                                      "<td><a href=\"ProfileInfo.jsp?ProfileID=<%=getPastDateRs.getString(2)%>\" >"+"<%=getPastDateRs.getString(2)%>"+"</td>"+
                                                      "<td>"+"<%=getPastDateRs.getDate(4)%> <%=getPastDateRs.getTime(4)%>"+"</td>"+
                                                      "<td>"+"<%=getPastDateRs.getString(5)%>"+"</td>"+
                                                      "<td>"+<%=getPastDateRs.getInt(8)%>+"</td>"+
                                                      "<td>"+<%=getPastDateRs.getInt(9)%>+"</td>");
                                    $("tbody").append("<input type=button onclick=\"javascript:window.open('RateDateForm.jsp?profile1=<%=getPastDateRs.getString(1)%>&profile2=<%=getPastDateRs.getString(2)%>&date=<%=getPastDateRs.getDate(4)%>&time=<%=getPastDateRs.getTime(4)%>&id=<%=id%>','_self');return;\" value=\"Comment\">");
                                    $("tbody").append("</tr");
                                <%}%>
                                
                        }
                        function getPendingDate(){
                               <%
                                dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                cal = Calendar.getInstance();
                                String getPendingDateQuery = "SELECT * FROM Date D WHERE (D.Profile1= '" + id + "' OR D.Profile2= '" + id +"') AND D.Date_Time > '"+dateFormat.format(cal.getTime())+"'";
                                        java.sql.ResultSet getPendingDateRs = DBConnection.ExecQuery(getPendingDateQuery);
                                %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Pending Date Table");
                                $("thead").append("<tr><th>Profile1</th><th>Profile2</th><th>Date</th>"
                                        + "<th>Location</th><th>Operation</th></tr>");
                                  <% while (getPendingDateRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td><a href=\"ProfileInfo.jsp?ProfileID=<%=getPendingDateRs.getString(1)%>\">"+"<%=getPendingDateRs.getString(1)%>"+"</td>"+
                                                      "<td><a href=\"ProfileInfo.jsp?ProfileID=<%=getPendingDateRs.getString(2)%>\">"+"<%=getPendingDateRs.getString(2)%>"+"</td>"+
                                                      "<td>"+"<%=getPendingDateRs.getDate(4)%> <%=getPendingDateRs.getTime(4)%>"+"</td>"+
                                                      "<td>"+"<%=getPendingDateRs.getString(5)%>"+"</td>");
                                    $("tbody").append("<input type=button onclick=\"javascript:if(confirm('Are you sure that you want to cancel this date?')==true){window.open('CancelDate.jsp?datee=<%=getPendingDateRs.getString(2)%>&dater=<%=getPendingDateRs.getString(1)%>&date=<%=getPendingDateRs.getDate(4)%>&time=<%=getPendingDateRs.getTime(4)%>','_self')};return;\" value=\"Cancel\">");
                 
                                    $("tbody").append("</tr");
                                <%}%>
                        }
                       function myLike(){
                              <%
                                        dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                        cal = Calendar.getInstance();
                                        String myLikeQuery = "SELECT * FROM Likes WHERE Liker='"+id+"'";
                                        java.sql.ResultSet myLikeRs = DBConnection.ExecQuery(myLikeQuery);
                                %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("My Like Table");
                                $("thead").append("<tr><th>Likee</th><th>Like Time</th><th>Operation</th></tr>");
                                  <% while (myLikeRs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td><a href=\"ProfileInfo.jsp?ProfileID=<%=myLikeRs.getString(2)%>\">"+"<%=myLikeRs.getString(2)%>"
                                            +"</td><td>"+"<%=myLikeRs.getDate(3)%> <%=myLikeRs.getTime(3)%>");    
                                    $("tbody").append("<input type=button onclick=\"javascript:if(confirm('Are you sure that you want to unlike this file?')==true){window.open('UnlikeProfile.jsp?likee=<%=myLikeRs.getString(2)%>&liker=<%=id%>&date=<%=myLikeRs.getDate(3)%>&time=<%=myLikeRs.getTime(3)%>','_self')};return;\" value=\"Unlike\">");
                                    $("tbody").append("</tr");
                                <%}%>
                       }
                       function showTable(){
                           
                       };
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp">
        
    </script>
    <script>
        geocoder = new google.maps.Geocoder();
        var coordinateArray = [];
        var userSSNs = [];
        var currentUserGeo;
        var counter = 0;
        function suggestGeoDates(){
            userSSNs=[];
            coordinateArray = [];
            counter = 0;
            <%
            String selectUserAddress = "SELECT P.SSN,P.Street,P.City,P.State,P.Zipcode"
                    + " FROM Person P,User U"
                    + " WHERE P.SSN=U.SSN";
            List addresses = new ArrayList<String>();
            
            java.sql.ResultSet userAddRs = DBConnection.ExecQuery(selectUserAddress);
            while(userAddRs.next()){
                addresses.add(userAddRs.getString("Street")+ " " + userAddRs.getString("City")
                        + ", " + userAddRs.getString("State") + " " + userAddRs.getInt("Zipcode"));
                %>
                userSSNs.push("<%= userAddRs.getString("SSN") %>");
                <%
            }
            %>
            <% 
            for(int i=0;i < addresses.size();i++){
            %>
              getCoordinates("<%= addresses.get(i) %>");      
             <%}%>
        }
        
        function getIndividualCoordinate(address){
            geocoder.geocode({address:address},function(results,status){
                coord_obj = results[0].geometry.location;
                currentUserGeo = [coord_obj.k,coord_obj.B];
         
            });
        }
        function getCoordinates(address){
            var coord_obj;
            geocoder.geocode({address:address},function(results,status){
                coord_obj = results[0].geometry.location;
                coordinateArray.push([coord_obj.k,coord_obj.B]);
                counter += 1;
                //alert(address+"Coordinates"+coordinates+"counter"+ counter+"size"+ <%= addresses.size()%> );
                if(counter === <%= addresses.size() %>){
                    var n;
                    var suggestedGeoUsersSSN = [];
                    for(n = 0;n < coordinateArray.length;n++){
                        //alert("Coordinates x:"+coordinateArray[n][0]+" y: "+coordinateArray[n][1]);
                        
                        if(parseFloat(coordinateArray[n][0]) >= currentUserGeo[0]-0.1 && parseFloat(coordinateArray[n][0]) <= currentUserGeo[0]+0.1 
                                && parseFloat(coordinateArray[n][1]) >= currentUserGeo[1]-0.1 && parseFloat(coordinateArray[n][1]) <= currentUserGeo[1]+0.1)
                        {
                            suggestedGeoUsersSSN.push(userSSNs[n]);
                            
                        }
                        
                    }//end for
                    $("thead").html("");
                    $("tbody").html("");
                    $(".sub-header").html("Suggested Geo Dates For You");
                    $("thead").append("<tr><th>ProfileID</th><th>Age</th><th>City</th><th>DatingAgeRangeStart</th><th>DatingAgeRangeEnd</th><th>DatinGeoRange</th><th>M_F</th><th>Hobbies</th><th>Height</th><th>Weight</th><th>HairColor</th><th>CreationDate</th><th>LastModDate</th></tr>");
                    
                    suggestedGeoUsersSSN.forEach(function(entry){
                         $.get('RetrieveProfileBySSN',{ssn:entry})
                            .done(function(responseText){
                            $("tbody").append(responseText);
                        });
                    });
                    
                }//end if
            });
            
        }
        function personalizedList() {
        <%
        String userProfileQuery = "SELECT * FROM Profile WHERE ProfileID='"+id+"'";
                                        java.sql.ResultSet urs=DBConnection.ExecQuery(userProfileQuery);
                                        String hobbiesst=null;
                                        String [] hobbies=new String[10];
                                        int start=0;
                                        int end=0;
                                        
                                        if (urs.next()){
                                            String hobbiesstr=urs.getString("hobbies");
                                            hobbies=hobbiesstr.split(", ");
                                            start=urs.getInt("DatingAgeRangeStart");
                                            end=urs.getInt("DatingAgeRangeEnd");
                                            urs=DBConnection.ExecQuery(userProfileQuery);
                                        }
                                        String upQuery="(SELECT * FROM Profile WHERE hobbies like '%"+hobbies[0]+"%' AND Age<='"+end+"' AND age>='"+start+"' AND ProfileID!='"+id+"')";
                                        
                                        int i=1;
                                        while (i<hobbies.length){
                                            upQuery=upQuery+" union (SELECT * FROM Profile WHERE hobbies like '%"+hobbies[i]+"%' AND Age<='"+end+"' AND age>='"+start+"' AND ProfileID!='"+id+"')";
                                            i++;
                                        }
                                        java.sql.ResultSet uprs=DBConnection.ExecQuery(upQuery);
        %>
                                showTable();
                                $("thead").html("");
                                $("tbody").html("");
                                $(".sub-header").html("Suggestion Table");
                                $("thead").append("<tr>");
                                $("thead").append("<th>ProfileID</th>" +
                                                  "<th>Age</th>" +
                                                  "<th>DatingAgeRangeStart</th>"+ 
                                                  "<th>DatingAgeRangeEnd</th>"+
                                                  "<th>DatingGeoRange</th>"+
                                                  "<th>M_F</th>"+
                                                  "<th>Hobbies</th>"+
                                                  "<th>Height</th>"+
                                                  "<th>Weight</th>"+
                                                  "<th>HairColor</th>"+
                                                  "<th>Operation</th>");
                                $("thead").append("</tr>");
                                <%
                                
                                while (uprs.next()){%>
                                    $("tbody").append("<tr>");
                                    $("tbody").append("<td><a href=\"ProfileInfo.jsp?ProfileID=<%=uprs.getString(1)%>\">"+"<%=uprs.getString(1)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getInt(3)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getInt(4)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getInt(5)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getInt(6)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getString(7)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getString(8)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getDouble(9)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getInt(10)%>"+"</td>"+
                                                      "<td>"+"<%=uprs.getString(11)%>"+"</td>");
                                    $("tbody").append("<input type=button onclick=\"javascrip:window.open('DateForm.jsp?datee=<%=uprs.getString(1)%>&dater=<%=id%>','_self');return;\" value=\"Date\">");
                                    $("tbody").append("<input type=button onclick=\"javascrip:window.open('LikeProfile.jsp?likee=<%=uprs.getString(1)%>&liker=<%=id%>','_self');return;\" value=\"Like\">");
                                    $("tbody").append("</tr");
                                <%}
                                %>
                            }
    </script>
        
        
    </body>
</html>
