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
    <title>House</title>
    <link rel="stylesheet" href="css/houseDetails.css"> 

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
       
        <div class="header">
            <h1>Student Apartment</h1>
            <p>Exarcheia, Athens, Greece</p>
            
            <button class="Interested-button">Interested</button>
        </div>

        
        <div>
            <img class="property-image" src="images/house.jpg" alt="Student Apartment Image">
        </div>

        <div class="property-info">
            <p>
                Perfectly located student apartment in the heart of Athens, close to major universities and amenities. This apartment offers spacious rooms, natural light, and a convenient layout, ideal for student living.
            </p>

            <div class="details-section">
                <div class="detail-item">
                    <p>30 m&sup2;</p>
                </div>
                <div class="detail-item">
                    <p>Apartment</p>
                </div>
                <div class="detail-item">
                    <p>1 bedroom</p>
                </div>
                <div class="detail-item">
                    <p>3rd floor</p>
                </div>
            </div>
            <div class="property-price">€350 per month</div>
            <h2>Apartment Details</h2>

           
            <div class="details-information">
                <p>Address: Exarcheia, Athens, Greece</p>
                <p>Area: Central Athens</p>
                <p>Furnished: Yes</p>
                <p>Amenities: High-speed Wi-Fi</p>
                <p>Availability: 2024-11-01</p> 
                <p>Score of Interest: 20</p>
            </div>

            
            <div class="reviews">
                <h3>Reviews</h3>
                <div class="review-item">
                    <p>"Ideal for students - close to everything!"</p>
                    <small>— Maria Nikolaou, 2024-10-10</small>
                </div>
                <div class="review-item">
                    <p>"Affordable and convenient, perfect for university students."</p>
                    <small>— Kostas Papadopoulos, 2020-09-22</small>
                </div>

                <a href="review.html"><button class="review-button">Make Your Review</button></a>
            </div>
            
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
