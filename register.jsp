<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="t8210147@aueb.gr">
    <title>Register</title>
    <link rel="icon" href="images/unihome-logo-site.jpg">
    <link rel="stylesheet" href="css/register.css"> <!-- Link to the CSS file -->
</head>

<body>
    <div class="container">
        <!-- Heading and Subheading -->
        <div class="header">
            
        </div>

        <div class="left">
            <!-- Left section with image centered and smaller -->
            <img src="images/unihome-logo.jpg" alt="UniHome Logo">
        </div>
        
        <div class="right">
            <h2>Register</h2>
            <p>Find Your Perfect Student Home</p>
            <form action="landingpage.html" method="POST" class="form-horizontal">
                <!-- First Name -->
                <div class="form-group">
                    <label for="firstName">First name</label>
                    <input type="text" name="firstName" id="firstName" class="form-control" placeholder="Enter your first name">
                </div>

                <!-- Last Name -->
                <div class="form-group">
                    <label for="lastName">Last name</label>
                    <input type="text" name="surname" id="surname" class="form-control" placeholder="Enter your last name">
                </div>

                <!-- University -->
                <div class="form-group">
                    <label for="university">University</label>
                    <input type="text" name="university" id="university" class="form-control" placeholder="Enter your university">
                </div>

                <!-- Username -->
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Enter your username">
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password">
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label for="password">Confirm password</label>
                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm your password">
                </div>
                    
                <!-- User Type -->
                <div class="radio-group">
                    <label class="radio-inline"> <br>
                        <input type="radio" name="userType" value="student"> Student
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="graduate"> Graduate
                    </label>
                </div>        

                <br><br>
                
                <!-- Buttons -->
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-custom">Register</button>
                    <button type="reset" class="btn btn-danger btn-custom">Cancel</button>              
                </div>
            </form>
        </div>
    </div>
</body>
</html>