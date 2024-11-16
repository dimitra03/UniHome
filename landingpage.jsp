<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="UniHome - Find Your Perfect Student Home">
    <meta name="author" content="t8210156@aueb.gr">
    <link rel="icon" href="images/unihome-logo-site.jpg">
    <title>UniHome</title>
    <link rel="stylesheet" href="css/landingpage.css"> 

<body>

<div class="container">
  <div class="right">
   
    <img src="images/unihome-logo.jpg" alt="UniHome Logo">
  </div>
  
  <div class="left">
    <h2>Welcome to UniHome!</h2>
    <p>Find Your Perfect Student Home</p>
    
    <form action="search.html">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" placeholder="Enter your username">
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" placeholder="Enter your password">
      </div>
      <button type="submit" class="login-btn">Log in</button>
    </form>

    <div class="signup-link">
      Don't have an account? <a href="register.html">Create an account</a>
    </div>
  </div>

</div>
      
  
  <!-- <%@ include file="footer.jsp" %> -->


</body>

</html>
