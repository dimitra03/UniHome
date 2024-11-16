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
    <title>UniHome</title>
    <!-- <link rel="stylesheet" href="css/landingpage.css">  -->
    <title>UniHome Listings</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
        }

        /* Navigation Bar Styles */
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: #e6effc;
            border-bottom: 2px solid #d1d9e6;
        }
        .navbar .logo {
            display: flex;
            align-items: center;
            font-size: 1.5em;
            font-weight: bold;
            color: #2c3e50;
        }
        .navbar .logo img {
            height: 24px;
            margin-right: 10px;
        }
        .navbar .nav-links {
            display: flex;
            gap: 20px;
        }
        .navbar .nav-links a {
            text-decoration: none;
            font-size: 1em;
            color: #2c3e50;
            font-weight: bold;
        }
        .navbar .nav-links a:hover {
            color: #2c7be5;
        }
        .navbar .profile {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #2c3e50;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-weight: bold;
        }

        /* Filter Bar Styles */
        .filter-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            background-color: #ffffff;
            border-bottom: 2px solid #e0e4e9;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        .filter-option {
            padding: 8px 15px;
            border: 1px solid #cdd4de;
            border-radius: 5px;
            background-color: #ffffff;
            cursor: pointer;
            font-size: 14px;
            color: #495057;
        }
        .filter-option:hover {
            background-color: #eaf2fc;
            color: #2c7be5;
        }
        .filter-option.active {
            border-color: #2c7be5;
            color: #ffffff;
            background-color: #2c7be5;
        }
        .filter-option:last-child {
            font-weight: bold;
            color: #ffffff;
            background-color: #f7a600;
            border-color: #f7a600;
        }
        .filter-option:last-child:hover {
            background-color: #e09600;
        }
        .icon {
            margin-right: 5px;
        }

        /* Property Listing Styles */
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }
        .property {
            border: 1px solid #cdd4de;
            border-radius: 8px;
            margin-bottom: 20px;
            background-color: #ffffff;
            overflow: hidden;
            display: flex;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        .property img {
            width: 250px;
            height: auto;
        }
        .property-details {
            padding: 15px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .property-title {
            font-size: 1.5em;
            margin: 0 0 10px;
            color: #2c7be5;
        }
        .property-description {
            font-size: 0.9em;
            color: #6c757d;
            margin-bottom: 10px;
        }
        .property-price {
            font-size: 1.2em;
            color: #f7a600;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="logo">
            <img src="images/unihome-logo.jpg" alt="UniHome Logo">
            UNIHΟΜΕ
        </div>
        <div class="nav-links">
            <a href="#home">Home</a>
            <a href="#about">About</a>
        </div>
        <div class="profile">P</div>
    </div>

    <!-- Filter Bar -->
    <div class="filter-bar">
        <div class="filter-option">Πώληση</div>
        <div class="filter-option">Κατοικία</div>
        <div class="filter-option">Υποκατηγορία</div>
        <div class="filter-option">Από 10.000 €</div>
        <div class="filter-option">Εμβαδόν</div>
        <div class="filter-option">
            <span class="icon">🔧</span> Φίλτρα
        </div>
        <div class="filter-option active">Αποθήκευση</div>
    </div>

    <!-- Property Listings -->
    <div class="container">
        <h1>Property Listings in Marousi</h1>

        <!-- Property 1 -->
        <div class="property">
            <img src="apartment.jpg" alt="Apartment">
            <div class="property-details">
                <h2 class="property-title">Διαμέρισμα, 82τ.μ.</h2>
                <p class="property-description">
                    Εξαιρετικό διαμέρισμα 82 τ.μ στο Μαρούσι, πλήρως ανακαινισμένο το 2021. Το ακίνητο συνδυάζει
                    μοντέρνα αισθητική και άνεση, καθώς διαθέτει 2 ευρύχωρα υπνοδωμάτια, κομψό σαλόνι, καλαίσθητη
                    κουζίνα, μπάνιο.
                </p>
                <p class="property-price">€169.000</p>
            </div>
        </div>

        <!-- Property 2 -->
        <div class="property">
            <img src="building.jpg" alt="Building">
            <div class="property-details">
                <h2 class="property-title">Κτίριο, 220τ.μ.</h2>
                <p class="property-description">
                    Κτίριο στο Μαρούσι, κατάλληλο για επένδυση και αξιοποίηση τύπου Airbnb. Η κατοικία είναι τριών
                    επιπέδων και μπορεί να διαχωρισθεί σε μεμονωμένα διαμερίσματα ή να χρησιμοποιηθεί ολόκληρη. 
                </p>
                <p class="property-price">€330.000</p>
            </div>
        </div>
    </div>
</body>
</html>


