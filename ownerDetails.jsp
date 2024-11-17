<%-- Developed by Dimitra Telatinidou --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="src.main.java.Owner" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="t8210147@aueb.gr">
    <title>Owner Details</title>
    <link rel="icon" href="images/unihome-logo-site.jpg">
    <link href="<%=request.getContextPath() %>/UniHome/css/ownerDetails.css" rel="stylesheet">

</head>

<body>

    <%
        // Retrieve the list from the request attribute
        List<Owner> ownerDetails = (List<Owner>) request.getAttribute("owner");
    %>
    <% if (ownerDetails != null && !ownerDetails.isEmpty()) { %>
        <div class="owner-details">
            <h1>Owner Details</h1>
            <% 
                // Iterate through the list of owners
                for (Owner owner : ownerDetails) { 
            %>
            <p><strong>First Name:</strong> <%= owner.getFirstName() %></p>
            <p><strong>Last Name:</strong> <%= owner.getLastName() %></p>
            <p><strong>Phone Number:</strong> <%= owner.getPhoneNumber() %></p>
            <p><strong>Email:</strong> <%= owner.getEmail() %></p>

            <% 
                } 
            %>
            <% } else { %>
                <p>No owner details available.</p>
            <% } %>
            <br>
            <a href="showHouses.jsp" class="back-btn">Back to Houses</a>

        </div>


</body>
</html>