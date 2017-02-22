<%-- 
    Document   : RetrieveDateRevenue
    Created on : Nov 30, 2014, 10:52:13 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Retrieve revenue from dates by calendar date or SSN</h1>
        
        <input type="text" placeholder="Enter Employee's SSN" name="dateOrSSN" id="dateOrSSN" > 
        
        <div id="toBeDelEmp"> 
            <div id="mainTable">
            <h2 class="sub-header"></h2>
                <div class="table-responsive col-sm-12" >
                    <table class="table table-striped col-sm-12">
                    </table>           
                </div>
            </div>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script href="js/bootstrap.min.js" ></script>
    <script type="text/javascript" language="javascript">    
        $(document).ready(function(){
           $("input").on('input',function(){
               $.get('RetrieveDateRevenue',{dateOrSSN:$("#dateOrSSN").val()})
                       .done(function(responseText){
                  $("table").html(responseText);
               });
           });
        });
        
    </script>
    </body>
</html>
