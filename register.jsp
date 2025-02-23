<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>Register</title>
    <link rel="stylesheet" href="css/register.css"> <!-- Link to the CSS file -->
</head>

<body>

    <%String msg = (String) request.getAttribute("message");%>

    
    <div class="container">
        <div class="left">
            <!-- Left section with image centered -->
            <img src="images/unihome-logo.jpg" alt="UniHome Logo">
        </div>

        
        <div class="right">
            <h2>Register</h2>
            <p>Find Your Perfect Student Home</p>
            <% if (msg!= null ){ %>
                <div class="alert alert-danger text-center" role="alert"><%=msg%></div>
            <%}%>
            <form action="registerController.jsp" method="POST" class="form-horizontal">
                <!-- Form fields -->
                <div class="form-group">
                    <label for="firstName">First name</label>
                    <input type="text" name="firstName" id="firstName" class="form-control" placeholder="Enter your first name" required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last name</label>
                    <input type="text" name="lastName" id="lastName" class="form-control" placeholder="Enter your last name" required>
                </div>

                <div class="form-group">
                    <label for="university">University</label>
                    <input type="text" name="university" id="university" class="form-control" placeholder="Enter your university" required>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Enter your username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" required>
                </div>

                <div class="form-group">
                    <label for="confirm_password">Confirm password</label>
                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm your password" required>
                </div>
                    
                <div class="radio-group">
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="student" required> Student
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="graduate"> Graduate
                    </label>
                </div>        

                <!-- Buttons -->
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-custom">Register</button>
                    <button type="reset" class="btn btn-danger btn-custom">Cancel</button> 
                    <button type="back" class="btn btn-back btn-custom"><a href="landingpage.jsp">Back to login</a></button>
	            
                    <!-- <button type="button" class="btn btn-primary btn-custom" href=landingpage.jsp>Back to login</button> -->
                </div>
            </form>
        </div>
    </div>

   </body>
</html>
