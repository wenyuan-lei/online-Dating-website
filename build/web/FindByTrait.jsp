<%-- 
    Document   : FindByTrait
    Created on : Nov 30, 2014, 5:21:03 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            background-repeat: no-repeat;
            background-size: cover;
        }
        
</style>
    </head>
    <body background="images/five.jpg">
        <h1>Find by age, height, weight, hair color, hobbies</h1>
        <input type="text" placeholder="Enter Traits" name="trait" id="trait" > 
        
        <div id="profile"> 
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
               $.get('RetrieveProfile',{trait:$("#trait").val()})
                       .done(function(responseText){
                  
                  $("table").html(responseText);
          
               });
           });
       });
        </script>
    </body>
</html>
