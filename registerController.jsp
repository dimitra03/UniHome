<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="unihome.User" %>
<%@ page import="unihome.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>Register</title>
    <link rel="stylesheet" href="css/registerController.css"> 
</head>

<body>
    <div class="container">
        <%
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String university = request.getParameter("university");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirm_password = request.getParameter("confirm_password");
            String userType = request.getParameter("userType");

            boolean valid = (password.equals(confirm_password));

            if (valid) {
                User user = new User(firstName, lastName, university, username, password, userType);
                UserDAO userDao = new UserDAO();
                
                try {
                    userDao.register(user);
                    response.sendRedirect("landingpage.jsp");
                } catch (Exception e) {
                    request.setAttribute("message", e.getMessage());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                    dispatcher.forward(request, response);
                }
	
        
        
            } else { %>
    
                <div class="page-header">
                    <h1>Registration Form Errors</h1>
                </div>
                <ul>
                   
                <p> The two passwords do not match </p>
                <a href="register.jsp">Back to form</a>
        <%
            }
        %>
    </div>

   
</body>

</html>
