<%-- 
    Document   : Date
    Created on : Nov 27, 2014, 4:14:38 PM
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
        
        <h1>Find dates by calendar date or customer SSN</h1>
        <input type="text" placeholder="Enter date or customer SSN" name="dateOrSSN" id="dateOrSSN" > 
        <div id="date"> 
            <div id="mainTable">
            <h2 class="sub-header"></h2>
<!--                <div class="table-responsive col-sm-6" >
                    <table class="table table-striped col-sm-8">-->
<div class="table-responsive col-sm-12" >
                    <table class="table table-striped col-sm-12">
                        
                    </table>
                </div>
            </div>
        </div>
        <a  class="btn btn-default col-md-2" href="Manager.jsp">Back</a>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script href="js/bootstrap.min.js" ></script>
        <script type="text/javascript" language="javascript">    
            $(document).ready(function(){
                $("input").on('input',function(){
                   $.get('RetrieveDate',{dateOrSSN:$("#dateOrSSN").val()})
                           .done(function(responseText){
                               $("table").html(responseText);
                           });
                });
            });
        </script>
    </body>
</html>
