<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="unihome.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.servlet.*" %>
<%@ page import="java.io.IOException" %>
<%@ page errorPage="errorPage.jsp"%>


<% 
User user = (User) session.getAttribute("userObj2024");

 if (user == null) {
     request.setAttribute("message", "You are not authorized to access this resource. Please login.");
     RequestDispatcher dispatcher = request.getRequestDispatcher("landingpage.jsp");
     dispatcher.forward(request, response);
     return; 
 }

 %>
 
<style>
    .more-info-button {
        background: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
    }


</style>

<%

        /* // Get the list of houses and user-selected filters from the request scope
        List<House> houses = (List<House>) request.getAttribute("houses");
    
        String area = (String) request.getAttribute("area");
        String houseType = (String) request.getAttribute("houseType");
        boolean furnished = Boolean.parseBoolean(request.getAttribute("furnished").toString());
        int size = Integer.parseInt(request.getAttribute("size").toString());
        int rentPerMonth = Integer.parseInt(request.getAttribute("rentPerMonth").toString());
        int rooms = Integer.parseInt(request.getAttribute("rooms").toString());
        int floor = Integer.parseInt(request.getAttribute("floor").toString()); */
        
         // Retrieve parameters from the session
    String area = (String) session.getAttribute("area");
    String houseType = (String) session.getAttribute("houseType");
    boolean furnished = session.getAttribute("furnished") != null 
                        ? Boolean.parseBoolean(session.getAttribute("furnished").toString()) : false;
    int size = session.getAttribute("size") != null 
               ? Integer.parseInt(session.getAttribute("size").toString()) : 0;
    int rentPerMonth = session.getAttribute("rentPerMonth") != null 
                       ? Integer.parseInt(session.getAttribute("rentPerMonth").toString()) : 0;
    int rooms = session.getAttribute("rooms") != null 
                ? Integer.parseInt(session.getAttribute("rooms").toString()) : 0;
    int floor = session.getAttribute("floor") != null 
                ? Integer.parseInt(session.getAttribute("floor").toString()) : 0;

    // Retrieve the list of houses 
    List<House> houses = (List<House>) session.getAttribute("houses");
        %>
       
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="css/showHouses.css">

    <title>UniHome Listings</title>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="search.jsp"><img src="images/unihome-logo.jpg" alt="UniHome Logo"></a>
        <div class="navbar-links">
            <a href="search.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a>
        </div>
        <button class="account">Signed in as <%=user.getUsername()%></button>  
    </div>

    <!-- Filter Bar -->
    <div class="filter-bar">
        <% if(area != null) { %>
            <div class="filter-option">Area: <%= area %></div>
        <% } 
        
        if(size != 0) { 
            int minsize = size-20; %>
            <div class="filter-option">Size: <%=minsize%>-<%= size %> m&sup2;</div>
         <% } 
        
        if(rentPerMonth != 0) { %>    
            <div class="filter-option">Rent: <%= rentPerMonth %></div>
        <% } 
        
        if(houseType != null) { %>
            <div class="filter-option">Type: <%= houseType %></div>
        <% } 
        
        if(floor != 0) { %>
            <div class="filter-option">Floor: <%= floor %></div>
        <% } 
        
        if(rooms != 0) { %>
            <div class="filter-option">Bedroom(s): <%= rooms %></div>

        <% }
        
        if(furnished) { %>
            <div class="filter-option">Furnished: Yes</div>

        <% } else { %>
            <div class="filter-option">Furnished: No</div>

        <% } %>
       
    </div>

    <br>
    <br>


    <form action="search.jsp" method="POST">
        <button type="submit" class="back-button">Back to search</button>
    </form>


   <% if (houses.size() == 0) { 
    %>
   
    <p>No results found based on your search criteria.</p>

   <% } else { %>
    

            <h1>Your Results</h1>

            <% for (House house : houses) { %>

                 <!-- Property Listings -->
                 <div class="container">
                    
                            <div class="property">
                                <img src="images/houses/<%=house.getHouseID()%>.png" alt="Property Image">
                                <div class="property-details">
                                    <div class="property-title">Beautiful <%=house.getHouseType()%> in <%= house.getArea() %> </div>
                                    <p class="property-price">Rent: <%=house.getRentPerMonth()%>€ per month</p>
                                    <p>Area: <%= house.getArea()%></p>
                                    <p>Size: <%= house.getSize()%> m&sup2;</p>
                                    <a href="houseDetails.jsp?housing=<%= house.getHouseID() %>"><button class="more-info-button">More Information</button></a>
                                </div>
                            </div>
            
               </div>
           
  <% } 
  
  } %>
               
    

    

</body>
</html>
