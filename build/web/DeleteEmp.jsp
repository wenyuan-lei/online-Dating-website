<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
<%-- 
    Document   : DeleteEmp
    Created on : Nov 24, 2014, 10:55:53 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    
        <body>
        <h1>Delete Employee</h1>
        
        <input type="text" placeholder="Enter Employee's SSN" name="SSN" id="SSN" > 
        
        <div id="toBeDelEmp"> 
            <div id="mainTable">
            <h2 class="sub-header"></h2>
                <div class="table-responsive col-sm-12" >
                    <table class="table table-striped col-sm-12">
                        
                    </table>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-primary col-sm-2">Delete</button>
        <a  class="btn btn-default col-sm-2" href="Manager.jsp">Back</a>
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">    
        $(document).ready(function(){
            $("button").hide();
           $("input").on('input',function(){
               $.get('RetrieveEmp',{ssn:$("#SSN").val()})
                       .done(function(responseText){
                  
                  $("table").html(responseText);
          
                  if(responseText !== ""){
                      $("button").show();
                  }else{
                      $("button").hide();
                  }
               });
           });
           $("button").click(function(){
               $.get('DeleteEmployee',{ssn:$("#SSN").val()})
                       .done(function(responseText){
                           if(parseInt(responseText)> 0){
                            $("#toBeDelEmp").html("Successfully deleted employee!");   
                           }else{
                            $("#toBeDelEmp").html("Failed to delete employee");   
                           }
                       });
                  $("button").hide();
               
           });
            
        });
    </script>
    </body>
</html>
