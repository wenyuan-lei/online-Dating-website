<%-- 
    Document   : EditEmp
    Created on : Nov 24, 2014, 10:55:59 PM
    Author     : Kevin
--%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    
    <body>
        <h1>Edit Employee</h1>
        
        <input type="text" placeholder="Enter Employee's SSN" name="SSN" id="SSN" > 
        
        <div id="toBeEditEmp"> 
            <div id="mainTable">
            <h2 class="sub-header"></h2>
                <div class="table-responsive col-sm-12" >
                    <table class="table table-striped col-sm-12" id="table1">
           
                    </table>
                   
                </div>
             
            <table  class="table table-striped col-sm-12" id="inputGroup" >
                <thead></thead>
                <tbody>
                    <tr>
                        <td><input type="text" placeholder="SSN"  name ="inputSSN" id="inputSSN"></td>
                
                <td><input type="text" placeholder="First Name"  name ="inputFirstName" id="inputFirstName"></td>
                <td><input type="text" placeholder="Last Name" name ="inputLastName" id="inputLastName"></td>
                <td><input type="text" placeholder="Role" name ="inputRole" id="inputRole"></td>
                <td><input type="text" placeholder="Start Date"  name ="inputStartDate" id="inputStartDate"></td>
                <td><input type="text" placeholder="Hourly Rate"  name ="inputHourlyRate" id="inputHourlyRate"></td>
                <td><input type="text" placeholder="Street"  name ="inputStreet" id="inputStreet"></td>
                <td><input type="text" placeholder="City" name ="inputCity" id="inputCity"></td>
                <td><input type="text" placeholder="State"  name ="inputState" id="inputState"></td>
                <td><input type="text" placeholder="Zipcode" name ="inputZipcode" id="inputZipcode"></td>
                <td><input type="text" placeholder="Email"  name ="inputEmail" id="inputEmail"></td>
                <td><input type="text" placeholder="Telephone"  name ="inputTelephone" id="inputTelephone"></td>
                    </tr>
                </tbody>
           </table>
            <button type="button" class="btn btn-primary col-sm-3">Update Employee Info</button>
            
            </div>
            <span id="responseMsg"></span>
        </div>
        <a  class="btn btn-default col-sm-3" href="Manager.jsp">Back</a>
        
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">
         $(document).ready(function(){
            $("button").hide();
            $("#inputGroup").hide();
           $("#SSN").on('input',function(){
               $.get('RetrieveEmp',{ssn:$("#SSN").val()})
                       .done(function(responseText){
                  $("#table1").html(responseText);
                  $("#responseMsg").html("");
                  if(responseText !== ""){
                      $("button").show();
                      $("#inputGroup").show();
                      $.get('retrieveEmp2',{ssn:$("#SSN").val()})
                              .done(function(jsonObj){
                                  $.each(jsonObj,function(index,value){
                                      switch(index){
                                          case 0:
                                              $("#inputSSN").val(value);
                                              break;
                                          case 1:
                                              $("#inputFirstName").val(value);
                                              break;
                                          case 2:
                                              $("#inputLastName").val(value);
                                              break;
                                          case 3:
                                              $("#inputRole").val(value);
                                              break;    
                                          case 4:
                                              $("#inputStartDate").val(value);
                                              break;
                                          case 5:
                                              $("#inputHourlyRate").val(value);
                                              break;    
                                          case 6:
                                              $("#inputStreet").val(value);
                                              break;
                                          case 7:
                                              $("#inputCity").val(value);
                                              break;    
                                          case 8:
                                              $("#inputState").val(value);
                                              break;
                                          case 9:
                                              $("#inputZipcode").val(value);
                                              break;
                                          case 10:
                                              $("#inputEmail").val(value);
                                              break;
                                          case 11:
                                              $("#inputTelephone").val(value);
                                              break;
                                      }
                                          
                                  });
                              });
                      
                  }else{
                      $("button").hide();
                  }
               });
           });
           
           $("button").click(function(){
               $.get('EditEmployeeServlet',{ssn:$("#SSN").val(),firstName:$("#inputFirstName").val(),
                   lastName:$("#inputLastName").val(),role:$("#inputRole").val(),
                   startDate:$("#inputStartDate").val(),hourlyRate:$("#inputHourlyRate").val(),
                   street:$("#inputStreet").val(),city:$("#inputCity").val(),state:$("#inputState").val(),
                   zipcode:$("#inputZipcode").val(),email:$("#inputEmail").val(),telephone:$("#inputTelephone").val()})
                       .done(function(responseText){
                           if(parseInt(responseText)> 0){
                            $("#responseMsg").html("<h2>Successfully updated employee info!</h2>");   
                           }else{
                            $("#responseMsg").html("Failed to updated employee info");   
                           }
                           $("#inputGroup").hide();
                           clearInput();
                           $("#table1").html("");
                       });
                  $("button").hide();
               
           });
            
        });
        function clearInput(){
              $("#inputSSN").val("");
                $("#inputFirstName").val("");
                $("#inputLastName").val("");
                $("#inputRole").val("");
                $("#inputStartDate").val("");
                $("#inputHourlyRate").val("");
                $("#inputStreet").val("");
                $("#inputCity").val("");
                $("#inputState").val("");
                $("#inputZipcode").val("");
                $("#inputEmail").val("");
                $("#inputTelephone").val("");
        }
    </script>
    </body>
</html>
