<%-- 
    Document   : WhoDatedWho
    Created on : Nov 28, 2014, 10:15:29 AM
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
        <h1>Who Dated Who!</h1>
        
        <input type="text" placeholder="Enter customer SSN" name="SSN" id="SSN" > 
        <div id="customers"> 
            <div id="mainTable">
            <h2 class="sub-header"></h2>
                <div class="table-responsive col-sm-6" >
                    <table class="table table-striped col-sm-8">
                        
                    </table>
                   
                </div>
             
            </div>
        </div>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script href="js/bootstrap.min.js" ></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function(){
                $("input").on('input',function(){
                   $.get('RetrieveWhoDatedWho',{SSN:$("#SSN").val()})
                           .done(function(responseText){
                               $("#mainTable").html(responseText);
                           });
                });
            });
            
        </script>    
    </body>
</html>
