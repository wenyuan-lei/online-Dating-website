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
        <h1>Edit Customer</h1>
        
 <form role="form" method=POST action="updateCustomer.jsp">
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="empSSN">SSN </label>
                <input type="text" class="form-control input-sm" name="SSN" id="empSSN" placeholder="Customer's SSN">
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
                <label for="PPP">PPP</label>
                <input type="text" class="form-control" name="PPP" id="PPP" placeholder="PPP">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="DateOfLastAct">Date Of Last Act</label>
                <input type="text" class="form-control" name="DateOfLastAct" id="DateOfLastAct" placeholder="Date of Last Act">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Rating">Rating</label>
                <input type="text" class="form-control" name="Rating" id="Rating" placeholder="Rating">
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
                <label for="Zipcode">Zipcode</label>
                <input type="text" class="form-control" name="Zipcode" id="Zipcode" placeholder="Zipcode">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Email">Email</label>
                <input type="text" class="form-control" name="Email" id="Email" placeholder="Email">
            </div>
            <div class="form-group form-group-sm col-sm-6 col-md-offset-3">
                <label for="Telephone">Telephone</label>
                <input type="text" class="form-control" name="Telephone" id="Telephone" placeholder="Telephone">
            </div>
            <button type="submit" class="btn btn-default col-sm-2 col-md-offset-5">Submit</button>
        </form>
        
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
      
      
    </script>
    </body>
</html>
