<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="unihome.Review" %>
<%@ page import="unihome.ReviewDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.IOException" %>

<%
    // Λήψη παραμέτρων από τη φόρμα στη review.jsp
    String comment = request.getParameter("comment");
    String author = request.getParameter("author");
    int rate = 0;
    try {
        rate = request.getParameter("rate") != null ? Integer.parseInt(request.getParameter("rate")) : 0;
    } catch (NumberFormatException e) {
        rate = 0;
    }
    int housing = 0;  // Αντί για houseID, χρησιμοποιούμε τη μεταβλητή housing
    try {
        housing = request.getParameter("housing") != null ? Integer.parseInt(request.getParameter("housing")) : 0;
    } catch (NumberFormatException e) {
        housing = 0;
    }

    // Τρέχουσα ημερομηνία για την κριτική
    Date datePosted = new Date();

    // Δημιουργία λίστας για τις κριτικές
    List<Review> reviews = new ArrayList<Review>();

    try {
        // Δημιουργία αντικειμένου ReviewDAO
        ReviewDAO reviewDAO = new ReviewDAO();

        // Αν έχει υποβληθεί νέα κριτική, καταχώρησέ την
        if (comment != null && author != null && housing > 0) {
            Review newReview = new Review(0, comment, author, datePosted, rate, housing);
            reviewDAO.newReview(newReview);
        }

        // Ανάκτηση όλων των κριτικών για το συγκεκριμένο σπίτι
        reviews = reviewDAO.showReview(housing);

        // Φιλτράρισμα των κριτικών μόνο για το συγκεκριμένο houseID
        List<Review> filteredReviews = new ArrayList<Review>();
        for (Review review : reviews) {
            if (review.getHouseID() == housing) {
                filteredReviews.add(review);
            }
        }

        // Αποθήκευση των φιλτραρισμένων κριτικών στο session
        session.setAttribute("reviews", filteredReviews);

        // Αποθήκευση του housing για χρήση στη houseDetails.jsp
        session.setAttribute("housing", housing);

        // Ανακατεύθυνση στη houseDetails.jsp με την παράμετρο housing
        response.sendRedirect("houseDetails.jsp?housing=" + housing);

    } catch (Exception e) {
        // Σε περίπτωση σφάλματος, εμφάνιση μηνύματος
%>
        <h3>Σφάλμα κατά τη διαχείριση κριτικών: <%= e.getMessage() %></h3>
<%
    }
%>


