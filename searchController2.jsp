<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="unihome.House" %>
<%@ page import="unihome.HouseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.io.IOException" %>

<%

    // Λήψη παραμέτρων από τη φόρμα στη search.jsp
    String area = request.getParameter("area");

    // Μετατροπή των δεδομένων όπου χρειάζεται
    int size = 0;
    try {
        size = request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 0;
    } catch (NumberFormatException e) {
        size = 0; // Προεπιλεγμένη τιμή αν αποτύχει η μετατροπή
    }

   int rentPerMonth = 0;
    try {
        rentPerMonth = request.getParameter("rentPerMonth") != null ? Integer.parseInt(request.getParameter("rentPerMonth")) : 0;
    } catch (NumberFormatException e) {
        rentPerMonth = 0;
    }
    

    String houseType = request.getParameter("houseType");

    int floor = 0;
    try {
        floor = request.getParameter("floor") != null ? Integer.parseInt(request.getParameter("floor")) : 0;
    } catch (NumberFormatException e) {
        floor = 0;
    }

    int rooms = 0;
    try {
        rooms = request.getParameter("rooms") != null ? Integer.parseInt(request.getParameter("rooms")) : 0;
    } catch (NumberFormatException e) {
        rooms = 0;
    }

    
    boolean furnished = Boolean.parseBoolean(request.getParameter("furnished"));

    // Δημιουργία μιας λίστας για τα αποτελέσματα
    List<House> houses = new ArrayList<House>();

    try {
        // Δημιουργία αντικειμένου HouseDAO
        HouseDAO houseDAO = new HouseDAO();

        // Αναζήτηση χρησιμοποιώντας τις παραμέτρους
        houses = houseDAO.searchHouses(area, size, rentPerMonth, houseType, floor, rooms, furnished);

        // Αποθήκευση της λίστας στη request ώστε να προωθηθεί στη showHouses.jsp
        session.setAttribute("houses", houses);

        // Add prefered house attributes
        session.setAttribute("area", area);
        session.setAttribute("size", size);
        session.setAttribute("rentPerMonth", rentPerMonth);
        session.setAttribute("houseType", houseType);
        session.setAttribute("floor", floor);
        session.setAttribute("rooms", rooms);
        session.setAttribute("furnished", furnished);

        /// Forward to showHouses.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("showHouses.jsp");
        dispatcher.forward(request, response);

    } catch (Exception e) { 
        // Σε περίπτωση σφάλματος, εμφανίζεται μήνυμα
    %>
        <h3>Σφάλμα κατά την αναζήτηση σπιτιών: <%= e.getMessage() %> </h3>

<%  }

%>
