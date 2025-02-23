<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="unihome.HouseDAO" %>
<%@ page import="unihome.House" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="UniHome - Find Your Perfect Student Home">
    <meta name="author" content="t8210156@aueb.gr">
    <link rel="icon" href="images/unihome-logo-site.jpg">
    <title>House</title>
    <link rel="stylesheet" href="css/houseDetails.css"> 
</head>

<body>
    
    <div class="navbar">
        <a href="#"><img src="images/unihome-logo.jpg" alt="UniHome Logo"></a>
        <div class="navbar-links">
            <a href="search.jsp">Home</a>
            <a href="about.jsp">About</a>
        </div>
        <button class="account-button"><P>P</P></button> 
    </div>

    <div class="container">

        <% 
            // Λήψη του houseID από το αίτημα
            int houseID = Integer.parseInt(request.getParameter("houseId"));
            
            // Δημιουργία αντικειμένου HouseDAO για την ανάκτηση στοιχείων διαμερίσματος
            HouseDAO houseDAO = new HouseDAO();
            House house = null;
            
            try {
                // Ανάκτηση των στοιχείων του διαμερίσματος
                house = houseDAO.findHouse(houseID);
            } catch (SQLException e) {
                out.println("<h3>Error retrieving house details: " + e.getMessage() + "</h3>");
                return;
            }

            if (house != null) {
        %>

        <form action="ownerDetailsController.jsp" method="GET">
            <input type="hidden" name="houseID" value="<%= houseID %>">
            <button type="submit" class="Interested-button">Interested</button>
        </form>

    </form>
     
    <div class="house-image">
        <img src="images/house-<%= house.getHouseID() %>.jpg" alt="Image of house <%= house.getHouseID() %>" />
    </div>
    

        <div class="property-info">

            <div class="details-section">
                <div class="detail-item">
                    <p><%= house.getArea() %> m&sup2;</p>
                </div>
                <div class="detail-item">
                    <p><%= house.getSize() %> m&sup2;</p>
                </div>
                <div class="detail-item">
                    <p><%= house.getHouseType() %></p>
                </div>
                <div class="detail-item">
                    <p><%= house.getRooms() %> bedroom(s)</p>
                </div>
                <div class="detail-item">
                    <p><%= house.getFloor() %> floor</p>
                </div>
                <div class="detail-item">
                    <p><%= house.getRentPerMonth() %> m&sup2;</p>
                </div>
            </div>
            <div class="property-price"><%= house.getRentPerMonth() %> per month</div>
            <h2>Apartment Details</h2>

            <div class="details-information">
                <p>Address: <%= house.getAddress() %></p>
                <p>Area: <%= house.getArea() %></p>
                <p>Furnished: <%= house.isFurnished() ? "Yes" : "No" %></p>
                <p>Amenities: <%= house.getAmenities() %></p>
                <p>Availability: <%= house.getAvailability() %></p>
                <p>Score of Interest: <%= house.getScoreOfInterest() %></p>
            </div>


            <!-- reviews -->

            <%-- <div class="reviews">
                <h3>Reviews</h3>
                <div class="review-item">
                    <p>"<%= house.getReviews().get(0) %>"</p>
                    <small>— <%= house.getReviewAuthor(0) %>, <%= house.getReviewDate(0) %></small>
                </div>
                <div class="review-item">
                    <p>"<%= house.getReviews().get(1) %>"</p>
                    <small>— <%= house.getReviewAuthor(1) %>, <%= house.getReviewDate(1) %></small>
                </div>

                <a href="review.html"><button class="review-button">Make Your Review</button></a>
            </div> --%>

        </div>

        <% 
            } else {
                out.println("<h3>House not found.</h3>");
            }
        %>

    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>

