<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="unihome.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>Logout</title>
    <link rel="stylesheet" href="css/logout.css"> 
</head>

<% 
User user = (User) session.getAttribute("userObj2024");

 if (user == null) {
     request.setAttribute("message", "You are not authorized to access this resource. Please login.");
     RequestDispatcher dispatcher = request.getRequestDispatcher("landingpage.jsp");
     dispatcher.forward(request, response);
     return; 
 }

 %>

<body>
    <div class="logout-container">
        <img src="images/unihome-logo.jpg" alt="Unihome Logo">
        <h1><%=user.getFirstName()%>, you have successfully logged out!</h1>
        <p>Thank you for using Unihome. We hope to see you again soon!</p>
        <br>
        <a href="landingpage.jsp">Go to Login Page</a>
    </div>
</body>
</html>
