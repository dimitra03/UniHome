<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="unihome.*" %>

<!DOCTYPE html>
<html>
<head>
  <%@ include file="header.jsp" %>
  <title>Home Page</title>
  <link rel="stylesheet" type="text/css" href="css/search2.css">
  
   
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
  <main>
    <div class="navbar">
      <a href="search.jsp"><img src="images/unihome-logo.jpg" alt="UniHome Logo"></a>
      <div class="navbar-links">
          <a href="search.jsp">Home</a>
          <a href="about.jsp">About</a> 
          <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a>
      </div>
      <button class="account">Signed in as <%= user.getUsername() %></button> 
    </div> 
    <header>
      <div class="jumbotron">
				<h1>Search your...</h1>
			</div>
      <img  class="myphoto" src="images/unihome-logo.jpg" width="420px;" height="250px;">
      <div class="jumbotron">
				<h1>of your dreams!</h1>
			</div>
    </header>
     
    <form action="searchController2.jsp" method="POST" class="form-horizontal">
                
      <div class=" center">
        <div class="search-container">
            
          <label for="mySelect" class="select-label">Area</label>
          <select id="mySelect" name="area" class="styled-select form-input">
            <option value="" selected disabled>Select area</option>
            <option value="Aigaleo">Aigaleo</option>
            <option value="Ampelokipoi">Ampelokipoi</option>
            <option value="Exarcheia">Exarcheia</option>
            <option value="Gyzi">Gyzi</option>
            <option value="Kallithea">Kallithea</option>
            <option value="Kypseli">Kypseli</option>
            <option value="Neo Faliro">Neo Faliro</option>
            <option value="Nea Smyrni">Nea Smyrni</option>
            <option value="Pagrati">Pagrati</option>
            <option value="Patisia">Patissia</option>
            <option value="Peristeri">Peristeri</option>
            <option value="Petroupoli">Petroupoli</option>
            <option value="Peiraias">Piraeus</option>
            <option value="Sepolia">Sepolia</option>
            <option value="Zografou">Zografou</option>
          </select>
         
        </div>
            <br>

            <div class=" center">
              <div class="search-container">
                  
                <label for="mySelect" class="select-label">Select house size (m²)</label>
                <select id="mySelect" name="size" class="styled-select form-input">
                    <option value="" selected disabled>Select house size</option>
                    <option value="20">Under 20 m² </option>
                    <option value="40">20-40 m²</option>
                    <option value="60">40-60 m²</option>
                    <option value="80">60-80 m²</option>
                    <option value="100">80 m² and more</option>
                </select>
               
        </div>
         <br>
        <div class=" center">
          <div class="search-container">
              
            <label for="mySelect" class="select-label">Select price range(€)</label>
            <select id="mySelect" name="rentPerMonth" class="styled-select form-input">
                <option value="" selected disabled>Select price range(€)</option>
                <option value="300">Under 300€</option>
                <option value="500">300-500€</option>
                <option value="700">500-700€</option>
                <option value="900">700€ and more </option>
            </select>
           
          </div>

            <br>

            <div class=" center">
              <div class="search-container">
                  
                <label for="mySelect" class="select-label">Select house type</label>
                <select id="mySelect" name="houseType" class="styled-select form-input">
                    <option value="" selected disabled>Select house type</option>
                    <option value="Studio">Studio apartment</option>
                    <option value="One bedroom apartment">One bedroom apartment</option>
                    <option value="Shared apartment">Shared apartment</option>
                    <option value="Apartment">Apartment</option>
                </select>

        </div>
        <br>

        <div class=" center">
          <div class="search-container">
              
            <label for="mySelect" class="select-label">Select floor</label>
            <select id="mySelect" name="floor" class="styled-select form-input">
                <option value="" selected disabled>Select floor</option>
                <option value="1">1st floor</option>
                <option value="2">2nd floor</option>
                <option value="3">3rd floor</option>
                <option value="4">4th floor</option>
                <option value="5">5th floor</option>
                <option value="6">6th floor</option>
                <option value="7">7th floor</option>
                <option value="8">8th floor</option>
                <option value="9">9th floor</option>
                <option value="10">10th floor</option>
            </select>
          </div>
          <br>

          <div class="search-container">
              
            <label for="mySelect" class="select-label">Select bedrooms</label>
            <select id="mySelect" name="rooms" class="styled-select form-input">
                <option value="" selected disabled>Select bedrooms</option>
                <option value="1">1 bedroom</option>
                <option value="2">2 bedrooms</option>
                <option value="3">3 bedrooms</option>
                <option value="4">4 bedrooms</option>
                <option value="5">5+ bedrooms</option>
                
            </select>
          </div>
      <br>

      <br>

        <form id="furnishingForm" action="searchController2.jsp" method="POST">
          <div class="furnished-group">
              <label><b>Furnished:</b></label>   <!-- required -->
              <label>
                  <input type="radio" name="furnished" value="true" required> Yes
              </label>
              <label>
                  <input type="radio" name="furnished" value="false"> No
              </label>
          </div>
          <div class="col-sm-offset-2 col-sm-10">
            <!-- Green button with a tick symbol -->
            <button type="submit" style="background-color: #4dcf69; color: white; padding: 10px 20px; border: none; border-radius: 5px;">
              &#x2713; Search
            </button>
        </div> 
      </form>
      <br>

      <div class="images-container">
        <img class="myphoto2" src="images/searchphoto.jpg" alt="Search Photo">
        <img class="myphoto2" src="images/dorm.jpg" alt="Dorm Photo">
      </div>

    </form> <!-- Close main form -->
  </main>
  
</body>
</html>
