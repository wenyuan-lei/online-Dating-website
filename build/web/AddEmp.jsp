<%-- 
    Document   : AddEmp
    Created on : Nov 24, 2014, 10:55:26 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
        <style>
        
        </style>
    </head>
    <body>
        <div class="col-md-6 col-md-offset-3" >
        <h1>Add Employee</h1>
        <form  role="form" method="POST" action="processAddEmp.jsp" id="form1">
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="empSSN">SSN </label>
                <input type="text" class="form-control input-sm" name="SSN" id="empSSN" placeholder="Employee's SSN">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="empPassword">Password </label>
                <input type="password" class="form-control input-sm" name="Password" id="empPassword" placeholder="Password">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="FirstName">First Name</label>
                <input type="text" class="form-control" name="FirstName" id="FirstName" placeholder="FirstName">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="LastName">Last Name</label>
                <input type="text" class="form-control" name="LastName" id="LastName" placeholder="LastName">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Role">Role</label>
                <input type="text" class="form-control" name="Role" id="Role" placeholder="Role">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="StartDate">Start Date</label>
                <input type="text" class="form-control" name="StartDate" id="StartDate" placeholder="StartDate">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="HourlyRate">HourlyRate</label>
                <input type="text" class="form-control" name="HourlyRate" id="HourlyRate" placeholder="HourlyRate">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Street">Street</label>
                <input type="text" class="form-control" name="Street" id="Street" placeholder="Street">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="City">City</label>
                <input type="text" class="form-control" name="City" id="City" placeholder="City">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="State">State</label>
                <input type="text" class="form-control" name="State" id="State" placeholder="State">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Zip">Zip</label>
                <input type="text" class="form-control" name="Zipcode" id="Zip" placeholder="Zip">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Email">Email</label>
                <input type="text" class="form-control" name="Email" id="Email" placeholder="Email">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Telephone">Telephone</label>
                <input type="text" class="form-control" name="Telephone" id="Telephone" placeholder="Telephone">
            </div>
            <div class="form-group">
            <button type="submit" class="btn btn-primary col-sm-4 col-md-offset-4">Submit</button>
            <a  class="btn btn-default col-sm-4 col-md-offset-4" href="Manager.jsp">Back</a>
            </div>
        </form>
    </div>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script href="js/bootstrap.min.js" ></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function(){
//            var form=$("#form1");
//            form.submit(function(){
//                $.post('AddEmp',form.serialize())
//                        .done(
//                    function(responseText){
//                        if(reponseText === 'OK'){
//                            alert("Success");
//                        }
//                    });
//                
//            });
        });
        </script>
    </body>
</html>
