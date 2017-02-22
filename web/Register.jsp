<%-- 
    Document   : Register
    Created on : Dec 2, 2014, 10:07:50 AM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body background="images/one.jpg">
        
        <div class="col-md-6 col-md-offset-3" >
            <h1>Register your account</h1>
        <form class="form  center-block " action="RegisterUser.jsp" method="post">
            <div class="form-group">
                <input name="ssn" type="text" class="form-control input-lg" placeholder="SSN">
            </div>
            <div class="form-group">
                <input name="password" type="password" class="form-control input-lg" placeholder="Password">
            </div>
            <div class="form-group">
                <input name="firstname" type="text" class="form-control input-lg" placeholder="Firstname">
            </div>
            <div class="form-group">
                <input name="lastname" type="text" class="form-control input-lg" placeholder="Lastname">
            </div>
            <div class="form-group">
                <input name="street" type="text" class="form-control input-lg" placeholder="Street">
            </div>
            <div class="form-group">
                <input name="city" type="text" class="form-control input-lg" placeholder="City">
            </div>
            <div class="form-group">
                <input name="state" type="text" class="form-control input-lg" placeholder="State">
            </div>
            <div class="form-group">
                <input name="zipcode" type="text" class="form-control input-lg" placeholder="Zipcode">
            </div>
            <div class="form-group">
                <input name="email" type="text" class="form-control input-lg" placeholder="Email">
            </div>
            <div class="form-group">
                <input name="telephone" type="text" class="form-control input-lg" placeholder="Telephone">
            </div>
            <div class="form-group">
                <input name="profileID" type="text" class="form-control input-lg" placeholder="Profile Name">
            </div>
            <div class="form-group">
                <input name="age" type="text" class="form-control input-lg" placeholder="Age">
            </div>
            <div class="form-group">
                <input name="datingAgeRangeStart" type="text" class="form-control input-lg" placeholder="datingAgeRangeStart">
            </div>
            <div class="form-group">
                <input name="datingAgeRangeEnd" type="text" class="form-control input-lg" placeholder="datingAgeRangeEnd">
            </div>
            <div class="form-group">
                <input name="datingGeoRange" type="text" class="form-control input-lg" placeholder="datingGeoRange">
            </div>
            <div class="form-group">
                <input name="m_f" type="text" class="form-control input-lg" placeholder="gender">
            </div>
            <div class="form-group">
                <input name="hobbies" type="text" class="form-control input-lg" placeholder="Hobbies">
            </div>
            <div class="form-group">
                <input name="height" type="text" class="form-control input-lg" placeholder="Height">
            </div>
            <div class="form-group">
                <input name="weight" type="text" class="form-control input-lg" placeholder="Weight">
            </div>
            <div class="form-group">
                <input name="hairColor" type="text" class="form-control input-lg" placeholder="Hair Color">
            </div>
            
            <div class="form-group">
              <button class="btn btn-primary btn-lg btn-block">Register</button>
              <a  class="btn btn-default btn-lg btn-block" href="index.html">Back</a>
            </div>
        </form>
        </div>
    </body>
</html>
