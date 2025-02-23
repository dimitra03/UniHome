<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <%@ include file="header.jsp" %>
      <title>Login</title>
      <link rel="stylesheet" href="css/landingpage.css"> 
  </head>

<%
  String msg = (String) request.getAttribute("message");
   
%>



  <body>
    <div class="container">
      <div class="right">
        <img src="images/unihome-logo.jpg" alt="UniHome Logo">
      </div>

      <div class="left">
        <h2>Welcome to UniHome!</h2>
        <p>Find Your Perfect Student Home</p>
        <% if (msg!= null ){ %>
          <div class="alert alert-danger text-center" role="alert"><%=msg%></div>
        <%}%>
        
        <br>
        <!-- Added name attributes for form submission -->
        <form class="form-signin" method="post" action="loginController.jsp">
          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
          </div>
          <button type="submit" class="login-btn">Log in</button>
        </form>

        <div class="signup-link">
          Don't have an account? <a href="register.jsp">Create an account</a>
        </div>
      </div>
    </div>
    
     
  </body>
</html>

