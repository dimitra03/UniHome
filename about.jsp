<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="unihome.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>About Us</title>
    <link rel="stylesheet" href="css/about.css"> 
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

<style>
        .social-media {
            display: flex;
            justify-content: start; /* Align icons to the left */
            gap: 10px; /* Add spacing between icons */
            align-items: center; /* Vertically align icons */
        }
        .social-media img {
            width: 50px; /* Set the width of the icons */
            height: auto; /* Maintain aspect ratio */
        }

        .social-media img:hover {
            transform: scale(1.2); /* Enlarge the icon by 20% */
        }

</style>
 
<body>
    <div class="navbar">
        <a href="search.jsp"><img src="images/unihome-logo.jpg" alt="UniHome Logo"></a>
        <div class="navbar-links">
            <a href="search.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a>
        </div>
        <button class="account">Signed in as <%=user.getUsername()%></button> 
    </div>

    <br>
    <header>
        <div class="jumbotron">
          <h1>
            <span>Learn</span>
            <span>about</span>
            <span>us</span>
          </h1>
        </div>
    </header>
    <br>

    <main>
        <section id="about">
            <h2>Our Mission</h2>
            <p>The Student Housing Search application is designed to help students find housing quickly and easily. Our platform gathers information from various property owners and offers filtered options according to students' needs.</p>
        </section>

        <section id="features">
            <h2>What We Offer</h2>
            <ul>
                <li>Search for housing by area</li>
                <li>Easy navigation and user-friendly filters for customized searches</li>
                <li>Reliable information and direct contact with property owners</li>
            </ul>
        </section>

        <section id="team">
            <h2>Our Team</h2>
            <p>Our team consists of developers and real estate experts who are committed to making it easier for students to find the right place to live.</p>
        </section>

        <section id="contact">
            <h2>Contact Us</h2>
            <p>We’re here to help! Get in touch with us through the following:</p>
            <ul>
                <li><strong>Email:</strong> <a href="mailto:info@UniHome.com">info@UniHome.com</a></li>
                <li><strong>Phone:</strong> +30 210 1234567</li>
                <li><strong>Address:</strong> 10 Student Street, Athens, Greece</li>
            </ul>
            <p>Follow us on social media for updates and offers:</p>
            <br>

            <div class="social-media">
                <a href="https://www.facebook.com" target="_blank">
                    <img src="images/facebook.png" alt="Facebook">
                </a>
                <a href="https://www.instagram.com" target="_blank">
                    <img src="images/instagram.png" alt="Instagram">
                </a>
                <a href="https://www.twitter.com" target="_blank">
                    <img src="images/twitter.png" alt="Twitter">
                </a>
            </div>
        </section>
    </main>

</body>
</html>
