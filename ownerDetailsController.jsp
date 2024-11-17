<%-- Developed by Dimitra Telatinidou --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="src.main.java.Owner" %>
<%@ page import="src.main.java.OwnerDAO" %>
<%@ page import="java.sql.SQLException" %>

<%  
    // Get house ID from the request
    // String houseId = request.getParameter("houseId");
    List<Owner> ownerDetails = new ArrayList<Owner>();
    OwnerDAO ownerDAO = new OwnerDAO();
        
    try {
        ownerDetails = ownerDAO.getOwnerDetails(157);  // house id = 157 as an example
        request.setAttribute("owner", ownerDetails);
		request.getRequestDispatcher("/UniHome/ownerDetails.jsp").forward(request, response);

    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

%>