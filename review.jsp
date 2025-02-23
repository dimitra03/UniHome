<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="unihome.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    // Ανάκτηση του houseID
    String houseID = request.getParameter("houseID");
    if (houseID == null || houseID.isEmpty()) {
        houseID = request.getParameter("housing");
    }
    if (houseID == null || houseID.isEmpty()) {
        out.println("Error: House ID is missing!");
        return;
    }

    // Επικύρωση ότι το houseID είναι αριθμός
    int housing = 0;
    try {
        housing = Integer.parseInt(houseID);
    } catch (NumberFormatException e) {
        out.println("Error: Invalid House ID!");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <title>Review</title>
    <link rel="stylesheet" href="css/review.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #4682B4; 
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .review-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 450px;
            text-align: center;
        }
        .review-container h1 {
            font-size: 1.6em;
            margin-bottom: 20px;
            color: #333;
        }
        .review-container textarea,
        .review-container input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-bottom: 18px;
            font-size: 1em;
            transition: all 0.3s ease;
        }
        .review-container textarea {
            resize: none;
        }
        .review-container textarea:focus,
        .review-container input[type="text"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
            outline: none;
        }
        .review-container .star-rating {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .review-container .star-rating input[type="radio"] {
            display: none;
        }
        .review-container .star-rating label {
            font-size: 2em;
            color: #ccc;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        .review-container .star-rating input[type="radio"]:checked ~ label {
            color: #ffcc00;
        }
        .review-container .star-rating label:hover {
            color: #ff9900;
        }
        .review-container .review-button {
            background-color: #007bff;
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 1.1em;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .review-container .review-button:hover {
            background-color: #0056b3;
        }

        .button-group {
            display: flex; /* Align buttons horizontally */
            gap: 10px; /* Space between buttons */
            justify-content: center; /* Align buttons in the center, adjust as needed */
            margin-top: 20px; /* Add spacing above the buttons */
        }

        .button-back {
            display: flex; /* Align buttons horizontally */
            gap: 10px; /* Space between buttons */
            justify-content: center; /* Align buttons in the center, adjust as needed */
            margin-top: 20px; /* Add spacing above the buttons */
        }

    </style> 
   
</head>
<body>
    <div class="review-container">
        <h1>Write Your Review</h1>
        <form action="reviewController.jsp" method="POST">
            <!-- Κείμενο Κριτικής -->
            <textarea name="comment" placeholder="Share your experience..." required></textarea>

            <!-- Όνομα Χρήστη -->
            <input type="text" name="author" placeholder="Your name" required  />

            <!-- Βαθμολογία -->
            <div class="star-rating" required>
                <input type="radio" id="star5" name="rate" value="5" />
                <label for="star5" title="5 stars">&#9733;</label>
                <input type="radio" id="star4" name="rate" value="4" />
                <label for="star4" title="4 stars">&#9733;</label>
                <input type="radio" id="star3" name="rate" value="3" />
                <label for="star3" title="3 stars">&#9733;</label>
                <input type="radio" id="star2" name="rate" value="2" />
                <label for="star2" title="2 stars">&#9733;</label>
                <input type="radio" id="star1" name="rate" value="1" />
                <label for="star1" title="1 star">&#9733;</label>
            </div>

            <!-- House ID -->
            <input type="hidden" name="housing" value="<%= housing %>">

            <%
                String referer = request.getHeader("Referer");
                if (referer == null || referer.isEmpty()) {
                    referer = "errorPage.jsp"; // Set a fallback page
                }
            %>

        
            <div class="button-group">
                <button type="submit" class="review-button">Submit Your Review</button>
            </div>
        </form>
        <br>
        <div class="button-back">
        <form action="<%= referer %>" method="POST">
            <button type="submit" class="review-button">Back to House</button>
        </form>
        </div>
    </div>
</body>
</html>
