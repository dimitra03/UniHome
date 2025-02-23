<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="unihome.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    
    HouseDAO houseDao = new HouseDAO();
    int housing = Integer.parseInt(request.getParameter("housing"));
    House foundHouse = houseDao.findHouse(housing);

    
    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviews = reviewDAO.showReview(housing); 
%>


<% 
User user = (User) session.getAttribute("userObj2024");

 if (user == null) {
     request.setAttribute("message", "You are not authorized to access this resource. Please login.");
     RequestDispatcher dispatcher = request.getRequestDispatcher("landingpage.jsp");
     dispatcher.forward(request, response);
     return; 
 }

 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>House</title>
    <link rel="stylesheet" href="css/houseDetails.css"> 
</head>

<body>
    <div class="navbar">
        <a href="search.jsp"><img src="images/unihome-logo.jpg" alt="UniHome Logo"></a>
        <div class="navbar-links">
            <a href="search.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a>
        </div>
        <button class="account">Signed in as <%=user.getUsername()%> </button>  
    </div>

    <div class="container">
        <div class="header">
            <h1>Student <%=foundHouse.getHouseType()%></h1>
            <p><%=foundHouse.getArea()%>, Athens, Greece</p>

            <form action="showHouses.jsp" method="POST">
                <button type="submit" class="back-button">Back to Houses</button>
            </form>

            <form action="ownerDetailsController.jsp" method="POST">
                <input type="hidden" name="houseID" value="<%= housing %>">
                <button type="submit" class="Interested-button">Interested</button>
            </form>
        </div>

        <div>
            <img class="property-image" src="images/houses/<%=foundHouse.getHouseID()%>.png" alt="Student Apartment Image">
        </div>

        <div class="property-info">
            <p>Perfectly located student apartment in the heart of Athens, close to major universities and amenities.</p>
            <div class="details-section">
                <div class="detail-item">
                    <p><%=foundHouse.getSize()%> m&sup2;</p>
                </div>
                <div class="detail-item">
                    <p><%=foundHouse.getHouseType()%></p>
                </div>
                <div class="detail-item">
                    <p><%=foundHouse.getRooms()%> bedroom</p>
                </div>
                <div class="detail-item">
                    <p><%=foundHouse.getFloor()%> floor</p>
                </div>
            </div>
            <div class="property-price">€<%=foundHouse.getRentPerMonth()%> per month</div>
        </div>

        <!-- Εμφάνιση των κριτικών -->
        <div class="reviews">
            <h3>Reviews</h3>
            <div class="review-list">
                <% 
                    if (reviews != null && !reviews.isEmpty()) {
                        for (Review review : reviews) {
                %>
                        <div class="review-item">
                            <p><%= review.getComment() %></p>
                            <small>— <%= review.getAuthor() %>, 
                                <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(review.getDatePosted()) %>
                            </small>
                            <p>Rating: <%= review.getRate() %> / 5</p>
                        </div>
                <%
                        }
                    } else {
                %>
                    <p>No reviews available for this house.</p>
                <% } %>
            </div>
            <form action="review.jsp" method="GET">
                <input type="hidden" name="houseID" value="<%= housing %>">
                <button class="review-button">Make Your Review</button>
            </form>
        </div>
    </div>
</body>
</html>
