package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import DBWorks.DBConnection;
import java.sql.SQLException;
import java.sql.ResultSet;

public final class User_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("        <title>Dashboard Template for Bootstrap</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link href=\"css/dashboard.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("            ");

                
                String id = (String) session.getAttribute("ProfileID");
                String state= (String)session.getAttribute("state");
                
            
      out.write("\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">");
      out.print(id);
      out.write("</a>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"navbar\" class=\"navbar-collapse collapse\">\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        <li><a href=\"User.jsp?ProfileID=");
      out.print(id);
      out.write("\" id=\"emp\"  >My Profile</a></li>\n");
      out.write("                        <li><a href=\"SelectProfile.jsp\" >Change Profile</a></li>\n");
      out.write("                        <li><a href=\"index.jsp\">Logout</a></li>\n");
      out.write("                    </ul>\n");
      out.write("<!--                    <form class=\"navbar-form navbar-right\">\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"Search...\">\n");
      out.write("                    </form>-->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-3 col-md-2 sidebar\">\n");
      out.write("                    <ul class=\"nav nav-sidebar\">\n");
      out.write("                        <li id=\"home\" class=\"active\" onclick=\"showOtherUser();hideActiveButtons();\"><a href=\"#\" >Other User<span class=\"sr-only\">(current)</span></a></li>\n");
      out.write("                        <li id=\"past\" onclick=\"getPastDate();hideActiveButtons();\"><a href=\"#\" >My Past Dates</a></li>\n");
      out.write("                        <li id=\"pending\" onclick=\"getPendingDate();hideActiveButtons();\"><a href=\"#\" >My Pending Dates</a></li>\n");
      out.write("                        <li id=\"mylike\" onclick=\"myLike();hideActiveButtons();\"><a href=\"#\" >My Like List</li>\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"nav nav-sidebar\">\n");
      out.write("                        <li><a href=\"FindByTrait.jsp\" >Profile Filter</a></li>\n");
      out.write("                        <li onclick=\"showActiveButtons();\"><a href=\"#\">Most Active</a></li>\n");
      out.write("                        <li onclick=\"highRateProfile();hideActiveButtons();\"><a href=\"#\">Most Highly Rated</a></li>\n");
      out.write("                        <li onclick=\"popGeo();hideActiveButtons();\"><a href=\"#\">Popular Geo-Date Location</a></li>\n");
      out.write("                        <li onclick=\"personalizedList();hideActiveButtons();\"><a href=\"#\">Date Suggestion</a></li>\n");
      out.write("                        <li onclick=\"suggestGeoDates();\"><a href=\"#\">Geo Date</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main\">\n");
      out.write("                    <h1 class=\"page-header\">");
      out.print( id );
      out.write("</h1>\n");
      out.write("                    \n");
      out.write("                    <div id=\"mainTable\">\n");
      out.write("                        <h2 class=\"sub-header\"></h2>\n");
      out.write("                        <div class=\"table-responsive\" >\n");
      out.write("                            <table class=\"table table-striped\">\n");
      out.write("                                <thead>\n");
      out.write("\n");
      out.write("                                </thead>\n");
      out.write("                                <tbody id=\"bodyemp\">\n");
      out.write("                                   \n");
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div id=\"activenessButtons\" class=\"hidden\" >\n");
      out.write("                        <button type=\"button\" class=\"btn btn-default\" onclick=\"showActiveProfLike();\">By Likes</button>\n");
      out.write("                        <button type=\"button\" class=\"btn btn-default\" onclick=\"showActiveProfDate();\" >By Dates</button>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core JavaScript\n");
      out.write("        ================================================== -->\n");
      out.write("        <!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("        <script href=\"js/bootstrap.min.js\" ></script>\n");
      out.write("        <script type=\"text/javascript\" language=\"javascript\">\n");
      out.write("                        $(document).ready(function(){\n");
      out.write("                            ");

                            
                            String currentUserAddQuery = "SELECT P.Street,P.City,P.State,P.Zipcode"
                        + " FROM Person P,Profile Pr"
                        + " WHERE Pr.ProfileID='"+(String)session.getAttribute("ProfileID")+"' AND P.SSN=Pr.OwnerSSN";
                            java.sql.ResultSet currentUserAddRs = DBConnection.ExecQuery(currentUserAddQuery);
                            while(currentUserAddRs.next()){
                            
      out.write("\n");
      out.write("                                    \n");
      out.write("                               getIndividualCoordinate(\"");
      out.print( currentUserAddRs.getString("Street") );
      out.write("\" \n");
      out.write("                                       + \"");
      out.print( currentUserAddRs.getString("City") );
      out.write("\" + \", \"\n");
      out.write("                                       + \"");
      out.print( currentUserAddRs.getString("State") );
      out.write("\" + \" \" \n");
      out.write("                                       + \"");
      out.print( currentUserAddRs.getInt("Zipcode") );
      out.write("\");\n");
      out.write("                            ");
    
                            }
                            
                            
      out.write("\n");
      out.write("                                    \n");
      out.write("                            ");
if (state!=null){ 
                                    if (state.equals("make")){
      out.write("\n");
      out.write("                                    alert(\"You date request has been sent.\");\n");
      out.write("                                    \n");
      out.write("                                ");
}
                                    if (state.equals("cancel")){
      out.write("\n");
      out.write("                                    alert(\"You succesfully cancel a date .\");\n");
      out.write("                                ");
}
                                    if (state.equals("like")){
      out.write("\n");
      out.write("                                        alert(\"You succesfully like this profile .\");\n");
      out.write("                                        \n");
      out.write("                                ");
}
                                    if (state.equals("failedlike")){
      out.write("\n");
      out.write("                                        alert(\"You already like this profile\");\n");
      out.write("                                ");
} if (state.equals("comment")){
      out.write("\n");
      out.write("                                        alert(\"You successfully comment a past date\");\n");
      out.write("                                ");
} if (state.equals("refer")){
      out.write("\n");
      out.write("                                        alert(\"You successfully refer a profile to your friend\");\n");
      out.write("                                ");
} }state=null; 
                                    
      out.write("\n");
      out.write("                            $('.nav.nav-sidebar li').click(function(){\n");
      out.write("                                $('.nav.nav-sidebar li').removeClass('active');\n");
      out.write("                                $(this).toggleClass('active');\n");
      out.write("                                });\n");
      out.write("                            ");

                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                Calendar cal = Calendar.getInstance();
                            
      out.write("\n");
      out.write("                             \n");
      out.write("                        });\n");
      out.write("                        function showDateSuggestions(){\n");
      out.write("                        ");

                                String getLikesQuery = "SELECT L.Likee AS ProfileID, P.Age, P.DatingAgeRangeStart, P.DatingAgeRangeEnd, P.M_F, P.Hobbies, P.Height, P.Weight, P.HairColor, P.CreationDate, P.LastModDate"
                                        + " FROM Likes L, Profile P"
                                        + " WHERE L.Liker='" + id + "' AND P.ProfileID=L.Likee";
                                
                                java.sql.ResultSet suggestedProfilesRs=DBConnection.ExecQuery(getLikesQuery);
                                
                        
      out.write("    \n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Suggested dates based on your likes\");\n");
      out.write("                                $(\"thead\").append(\"<tr>\");\n");
      out.write("                                $(\"thead\").append(\"<th>Profile</th><th>Age</th><th>DatingAgeRangeStart</th><th>DatingAgeRangeEnd</th><th>M_F</th><th>Hobbies</th><th>Height</th><th>Weight</th><th>HairColor</th><th>CreationDate</th><th>LastModDate</th>\");\n");
      out.write("                                $(\"thead\").append(\"</tr>\");\n");
      out.write("                                ");
 while (suggestedProfilesRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td>\"+\"");
      out.print(suggestedProfilesRs.getString("ProfileID"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getInt("Age"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getInt("DatingAgeRangeStart"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getInt("DatingAgeRangeEnd"));
      out.write("\"+\"</td>\"+ \n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getString("M_F"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getString("Hobbies"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getInt("Height"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getInt("Weight"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getString("HairColor"));
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getDate("CreationDate").toString() );
      out.write("\"+\"</td>\"+\n");
      out.write("                                              \"<td>\"+\"");
      out.print(suggestedProfilesRs.getDate("LastModDate").toString() );
      out.write("\"+\"</td>\");\n");
      out.write("                                    $(\"tbody\").append(\"</tr>\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                        }       \n");
      out.write("                        function showActiveProfLike(){\n");
      out.write("                            ");

                            String activeCustLikeQuery = "SELECT P.ProfileID,COUNT(P.ProfileID) AS NumOfLikes FROM Profile P,Likes L"
                                               + " WHERE P.ProfileID=L.Liker GROUP BY P.ProfileID"
                                              + " HAVING COUNT(P.ProfileID) >= 2 ORDER BY NumOfLikes DESC";
                                        java.sql.ResultSet activeCustLikeRs=DBConnection.ExecQuery(activeCustLikeQuery);
                            
      out.write("\n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Most Active Profile Based on Likes Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr>\");\n");
      out.write("                                $(\"thead\").append(\"<th>Profile</th>\" +\n");
      out.write("                                                  \"<th>Activeness</th>\");\n");
      out.write("                                $(\"thead\").append(\"</tr>\");\n");
      out.write("                                ");
 while (activeCustLikeRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(activeCustLikeRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(activeCustLikeRs.getInt(2));
      out.write("\"+\"</td>\"); \n");
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"</tr>\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                        }\n");
      out.write("                        function showActiveProfDate(){\n");
      out.write("                            ");

                            String activeCustDateQuery = "SELECT P.ProfileID,COUNT(P.ProfileID) AS NumOfDates"
                                    + " FROM Profile P,Date D WHERE (P.ProfileID=D.Profile1 OR P.ProfileID=D.Profile2)"
                                    + " GROUP BY P.ProfileID HAVING COUNT(NumOfDates) >= 2"
                                    + " ORDER BY NumOfDates DESC";
                                        java.sql.ResultSet activeCustDateRs=DBConnection.ExecQuery(activeCustDateQuery);
                            
      out.write("\n");
      out.write("                                    showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Most Active Profile Based on Dates Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr>\");\n");
      out.write("                                $(\"thead\").append(\"<th>Profile</th><th>Activeness</th>\");\n");
      out.write("                                $(\"thead\").append(\"</tr>\");\n");
      out.write("                                ");
 while (activeCustDateRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td>\"+\"");
      out.print(activeCustDateRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(activeCustDateRs.getInt(2));
      out.write("\"+\"</td>\"); \n");
      out.write("                                    $(\"tbody\").append(\"</tr>\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                        }\n");
      out.write("                        function hideActiveButtons(){\n");
      out.write("                            $(\"#activenessButtons\").addClass(\"hidden\");\n");
      out.write("                        }\n");
      out.write("                        function showActiveButtons(){\n");
      out.write("                            $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Activeness of profiles\");\n");
      out.write("                            $(\"#activenessButtons\").removeClass(\"hidden\");\n");
      out.write("                        }\n");
      out.write("                        function highRateProfile(){\n");
      out.write("                            ");

                            String highRateProfileQuery = "SELECT User, SUM(Total)/SUM(Count) AS AvgRating FROM "
                                                +"(SELECT D.Profile1 AS User, SUM(D.User2Rating) AS Total, COUNT(D.Profile1) AS Count "
                                                +" FROM Date D, Profile P WHERE D.Profile1 = P.ProfileID AND D.User2Rating!=-1 GROUP BY User "
                                                +" UNION ALL SELECT D.Profile2 As User, SUM(D.User1Rating) AS Total, COUNT(D.Profile2) AS Count"
                                                +" FROM Date D, Profile P WHERE D.Profile2 = P.ProfileID AND D.User1Rating!=-1 GROUP BY User) T GROUP BY User HAVING AvgRating > 2.0 ORDER BY AvgRating DESC";
                                        java.sql.ResultSet highRateProfileRs=DBConnection.ExecQuery(highRateProfileQuery);
                            
      out.write("\n");
      out.write("                             showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Highly Rated Profile Based on Dates Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr><th>Profile</th><th>Average Rating</th></tr>\");\n");
      out.write("                                 ");
 while (highRateProfileRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(highRateProfileRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(highRateProfileRs.getFloat(2));
      out.write("\"+\"</td>\"); \n");
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"</tr>\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                        }\n");
      out.write("                        function popGeo(){\n");
      out.write("                            ");

                            String popularGeo = "SELECT D.Location, COUNT(D.Location) as Occurances FROM Date D GROUP BY D.Location HAVING COUNT(D.Location)>=2";
                            java.sql.ResultSet popularGeoRs=DBConnection.ExecQuery(popularGeo);
                            
      out.write("\n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Popular Geo-Date Location Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr><th>Location</th><th>Occurance</th></tr>\");\n");
      out.write("                                ");
 while (popularGeoRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(popularGeoRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(popularGeoRs.getInt(2));
      out.write("\"+\"</td>\"); \n");
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"</tr>\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                            \n");
      out.write("                        }\n");
      out.write("                        \n");
      out.write("                         function showOtherUser(){\n");
      out.write("                             ");
  String getOtherUserColQuery = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` "
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
                              
      out.write("\n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Profile Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr>\");\n");
      out.write("                                 ");
 while (otherUserColRs.next()) {
                                    if (!otherUserColRs.getString("COLUMN_NAME").equals("OwnerSSN")
                                        &&!otherUserColRs.getString("COLUMN_NAME").equals("CreationDate")
                                        &&!otherUserColRs.getString("COLUMN_NAME").equals("LastModDate")){
      out.write("\n");
      out.write("                                    $(\"thead\").append(\"<th>\" + \"");
      out.print( otherUserColRs.getString("COLUMN_NAME"));
      out.write("\" + \"</th>\");\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                ");
 }
      out.write("\n");
      out.write("                                $(\"thead\").append(\"<th>Operation</th>\")\n");
      out.write("                                $(\"thead\").append(\"</tr>\");\n");
      out.write("                                \n");
      out.write("                                 ");
 while (otherUserProfileRs.next()){ 
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(otherUserProfileRs.getString(1));
      out.write("\\\">\"+\"");
      out.print(otherUserProfileRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getInt(3));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getInt(4));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getInt(5));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getInt(6));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getString(7));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getString(8));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getDouble(9));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getInt(10));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(otherUserProfileRs.getString(11));
      out.write("\"+\"</td>\");\n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascrip:window.open('DateForm.jsp?datee=");
      out.print(otherUserProfileRs.getString(1));
      out.write("&dater=");
      out.print(id);
      out.write("','_self');return;\\\" value=\\\"Date\\\">\");\n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascrip:window.open('LikeProfile.jsp?likee=");
      out.print(otherUserProfileRs.getString(1));
      out.write("&liker=");
      out.print(id);
      out.write("','_self');return;\\\" value=\\\"Like\\\">\");\n");
      out.write("                                    $(\"tbody\").append(\"</tr\");\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                         }\n");
      out.write("                        function getPastDate(){\n");
      out.write("                            ");

                            String getPastDateQuery = "SELECT * FROM Date D WHERE (D.Profile1= '" + id + "' OR D.Profile2= '" + id +"') AND D.Date_Time < '"+dateFormat.format(cal.getTime())+"'";
                            java.sql.ResultSet getPastDateRs = DBConnection.ExecQuery(getPastDateQuery);
                            
      out.write("\n");
      out.write("                             showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");;\n");
      out.write("                                $(\".sub-header\").html(\"Past Date Table\");\n");
      out.write("                                 \n");
      out.write("                                $(\"thead\").append(\"<tr><th>Profile1</th><th>Profile2</th><th>Date</th><th>Location</th>\"\n");
      out.write("                                                  + \"<th>User1Rating</th><th>User2Rating</th><th>Operation</th></tr>\");\n");
      out.write("                                ");
 while (getPastDateRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(getPastDateRs.getString(1));
      out.write("\\\" >\"+\"");
      out.print(getPastDateRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(getPastDateRs.getString(2));
      out.write("\\\" >\"+\"");
      out.print(getPastDateRs.getString(2));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(getPastDateRs.getDate(4));
      out.write(' ');
      out.print(getPastDateRs.getTime(4));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(getPastDateRs.getString(5));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+");
      out.print(getPastDateRs.getInt(8));
      out.write("+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+");
      out.print(getPastDateRs.getInt(9));
      out.write("+\"</td>\");\n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascript:window.open('RateDateForm.jsp?profile1=");
      out.print(getPastDateRs.getString(1));
      out.write("&profile2=");
      out.print(getPastDateRs.getString(2));
      out.write("&date=");
      out.print(getPastDateRs.getDate(4));
      out.write("&time=");
      out.print(getPastDateRs.getTime(4));
      out.write("&id=");
      out.print(id);
      out.write("','_self');return;\\\" value=\\\"Comment\\\">\");\n");
      out.write("                                    $(\"tbody\").append(\"</tr\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                                \n");
      out.write("                        }\n");
      out.write("                        function getPendingDate(){\n");
      out.write("                               ");

                                dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                cal = Calendar.getInstance();
                                String getPendingDateQuery = "SELECT * FROM Date D WHERE (D.Profile1= '" + id + "' OR D.Profile2= '" + id +"') AND D.Date_Time > '"+dateFormat.format(cal.getTime())+"'";
                                        java.sql.ResultSet getPendingDateRs = DBConnection.ExecQuery(getPendingDateQuery);
                                
      out.write("\n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Pending Date Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr><th>Profile1</th><th>Profile2</th><th>Date</th>\"\n");
      out.write("                                        + \"<th>Location</th><th>Operation</th></tr>\");\n");
      out.write("                                  ");
 while (getPendingDateRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(getPendingDateRs.getString(1));
      out.write("\\\">\"+\"");
      out.print(getPendingDateRs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(getPendingDateRs.getString(2));
      out.write("\\\">\"+\"");
      out.print(getPendingDateRs.getString(2));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(getPendingDateRs.getDate(4));
      out.write(' ');
      out.print(getPendingDateRs.getTime(4));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(getPendingDateRs.getString(5));
      out.write("\"+\"</td>\");\n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascript:if(confirm('Are you sure that you want to cancel this date?')==true){window.open('CancelDate.jsp?datee=");
      out.print(getPendingDateRs.getString(2));
      out.write("&dater=");
      out.print(getPendingDateRs.getString(1));
      out.write("&date=");
      out.print(getPendingDateRs.getDate(4));
      out.write("&time=");
      out.print(getPendingDateRs.getTime(4));
      out.write("','_self')};return;\\\" value=\\\"Cancel\\\">\");\n");
      out.write("                 \n");
      out.write("                                    $(\"tbody\").append(\"</tr\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                        }\n");
      out.write("                       function myLike(){\n");
      out.write("                              ");

                                        dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                        cal = Calendar.getInstance();
                                        String myLikeQuery = "SELECT * FROM Likes WHERE Liker='"+id+"'";
                                        java.sql.ResultSet myLikeRs = DBConnection.ExecQuery(myLikeQuery);
                                
      out.write("\n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"My Like Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr><th>Likee</th><th>Like Time</th><th>Operation</th></tr>\");\n");
      out.write("                                  ");
 while (myLikeRs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(myLikeRs.getString(2));
      out.write("\\\">\"+\"");
      out.print(myLikeRs.getString(2));
      out.write("\"\n");
      out.write("                                            +\"</td><td>\"+\"");
      out.print(myLikeRs.getDate(3));
      out.write(' ');
      out.print(myLikeRs.getTime(3));
      out.write("\");    \n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascript:if(confirm('Are you sure that you want to unlike this file?')==true){window.open('UnlikeProfile.jsp?likee=");
      out.print(myLikeRs.getString(2));
      out.write("&liker=");
      out.print(id);
      out.write("&date=");
      out.print(myLikeRs.getDate(3));
      out.write("&time=");
      out.print(myLikeRs.getTime(3));
      out.write("','_self')};return;\\\" value=\\\"Unlike\\\">\");\n");
      out.write("                                    $(\"tbody\").append(\"</tr\");\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                       }\n");
      out.write("                       function showTable(){\n");
      out.write("                           \n");
      out.write("                       };\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://maps.googleapis.com/maps/api/js?v=3.exp\">\n");
      out.write("        \n");
      out.write("    </script>\n");
      out.write("    <script>\n");
      out.write("        geocoder = new google.maps.Geocoder();\n");
      out.write("        var coordinateArray = [];\n");
      out.write("        var userSSNs = [];\n");
      out.write("        var currentUserGeo;\n");
      out.write("        var counter = 0;\n");
      out.write("        function suggestGeoDates(){\n");
      out.write("            userSSNs=[];\n");
      out.write("            coordinateArray = [];\n");
      out.write("            counter = 0;\n");
      out.write("            ");

            String selectUserAddress = "SELECT P.SSN,P.Street,P.City,P.State,P.Zipcode"
                    + " FROM Person P,User U"
                    + " WHERE P.SSN=U.SSN";
            List addresses = new ArrayList<String>();
            
            java.sql.ResultSet userAddRs = DBConnection.ExecQuery(selectUserAddress);
            while(userAddRs.next()){
                addresses.add(userAddRs.getString("Street")+ " " + userAddRs.getString("City")
                        + ", " + userAddRs.getString("State") + " " + userAddRs.getInt("Zipcode"));
                
      out.write("\n");
      out.write("                userSSNs.push(\"");
      out.print( userAddRs.getString("SSN") );
      out.write("\");\n");
      out.write("                ");

            }
            
      out.write("\n");
      out.write("            ");
 
            for(int i=0;i < addresses.size();i++){
            
      out.write("\n");
      out.write("              getCoordinates(\"");
      out.print( addresses.get(i) );
      out.write("\");      \n");
      out.write("             ");
}
      out.write("\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        function getIndividualCoordinate(address){\n");
      out.write("            geocoder.geocode({address:address},function(results,status){\n");
      out.write("                coord_obj = results[0].geometry.location;\n");
      out.write("                currentUserGeo = [coord_obj.k,coord_obj.B];\n");
      out.write("         \n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("        function getCoordinates(address){\n");
      out.write("            var coord_obj;\n");
      out.write("            geocoder.geocode({address:address},function(results,status){\n");
      out.write("                coord_obj = results[0].geometry.location;\n");
      out.write("                coordinateArray.push([coord_obj.k,coord_obj.B]);\n");
      out.write("                counter += 1;\n");
      out.write("                //alert(address+\"Coordinates\"+coordinates+\"counter\"+ counter+\"size\"+ ");
      out.print( addresses.size());
      out.write(" );\n");
      out.write("                if(counter === ");
      out.print( addresses.size() );
      out.write("){\n");
      out.write("                    var n;\n");
      out.write("                    var suggestedGeoUsersSSN = [];\n");
      out.write("                    for(n = 0;n < coordinateArray.length;n++){\n");
      out.write("                        //alert(\"Coordinates x:\"+coordinateArray[n][0]+\" y: \"+coordinateArray[n][1]);\n");
      out.write("                        \n");
      out.write("                        if(parseFloat(coordinateArray[n][0]) >= currentUserGeo[0]-0.1 && parseFloat(coordinateArray[n][0]) <= currentUserGeo[0]+0.1 \n");
      out.write("                                && parseFloat(coordinateArray[n][1]) >= currentUserGeo[1]-0.1 && parseFloat(coordinateArray[n][1]) <= currentUserGeo[1]+0.1)\n");
      out.write("                        {\n");
      out.write("                            suggestedGeoUsersSSN.push(userSSNs[n]);\n");
      out.write("                            \n");
      out.write("                        }\n");
      out.write("                        \n");
      out.write("                    }//end for\n");
      out.write("                    $(\"thead\").html(\"\");\n");
      out.write("                    $(\"tbody\").html(\"\");\n");
      out.write("                    $(\".sub-header\").html(\"Suggested Geo Dates For You\");\n");
      out.write("                    $(\"thead\").append(\"<tr><th>ProfileID</th><th>Age</th><th>City</th><th>DatingAgeRangeStart</th><th>DatingAgeRangeEnd</th><th>DatinGeoRange</th><th>M_F</th><th>Hobbies</th><th>Height</th><th>Weight</th><th>HairColor</th><th>CreationDate</th><th>LastModDate</th></tr>\");\n");
      out.write("                    \n");
      out.write("                    suggestedGeoUsersSSN.forEach(function(entry){\n");
      out.write("                         $.get('RetrieveProfileBySSN',{ssn:entry})\n");
      out.write("                            .done(function(responseText){\n");
      out.write("                            $(\"tbody\").append(responseText);\n");
      out.write("                        });\n");
      out.write("                    });\n");
      out.write("                    \n");
      out.write("                }//end if\n");
      out.write("            });\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("        function personalizedList() {\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("                                showTable();\n");
      out.write("                                $(\"thead\").html(\"\");\n");
      out.write("                                $(\"tbody\").html(\"\");\n");
      out.write("                                $(\".sub-header\").html(\"Suggestion Table\");\n");
      out.write("                                $(\"thead\").append(\"<tr>\");\n");
      out.write("                                $(\"thead\").append(\"<th>ProfileID</th>\" +\n");
      out.write("                                                  \"<th>Age</th>\" +\n");
      out.write("                                                  \"<th>DatingAgeRangeStart</th>\"+ \n");
      out.write("                                                  \"<th>DatingAgeRangeEnd</th>\"+\n");
      out.write("                                                  \"<th>DatingGeoRange</th>\"+\n");
      out.write("                                                  \"<th>M_F</th>\"+\n");
      out.write("                                                  \"<th>Hobbies</th>\"+\n");
      out.write("                                                  \"<th>Height</th>\"+\n");
      out.write("                                                  \"<th>Weight</th>\"+\n");
      out.write("                                                  \"<th>HairColor</th>\"+\n");
      out.write("                                                  \"<th>Operation</th>\");\n");
      out.write("                                $(\"thead\").append(\"</tr>\");\n");
      out.write("                                ");

                                
                                while (uprs.next()){
      out.write("\n");
      out.write("                                    $(\"tbody\").append(\"<tr>\");\n");
      out.write("                                    $(\"tbody\").append(\"<td><a href=\\\"ProfileInfo.jsp?ProfileID=");
      out.print(uprs.getString(1));
      out.write("\\\">\"+\"");
      out.print(uprs.getString(1));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getInt(3));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getInt(4));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getInt(5));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getInt(6));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getString(7));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getString(8));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getDouble(9));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getInt(10));
      out.write("\"+\"</td>\"+\n");
      out.write("                                                      \"<td>\"+\"");
      out.print(uprs.getString(11));
      out.write("\"+\"</td>\");\n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascrip:window.open('DateForm.jsp?datee=");
      out.print(uprs.getString(1));
      out.write("&dater=");
      out.print(id);
      out.write("','_self');return;\\\" value=\\\"Date\\\">\");\n");
      out.write("                                    $(\"tbody\").append(\"<input type=button onclick=\\\"javascrip:window.open('LikeProfile.jsp?likee=");
      out.print(uprs.getString(1));
      out.write("&liker=");
      out.print(id);
      out.write("','_self');return;\\\" value=\\\"Like\\\">\");\n");
      out.write("                                    $(\"tbody\").append(\"</tr\");\n");
      out.write("                                ");
}
                                
      out.write("\n");
      out.write("                            }\n");
      out.write("    </script>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
