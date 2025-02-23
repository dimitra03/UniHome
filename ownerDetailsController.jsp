<%-- Developed by Dimitra Telatinidou --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="unihome.Owner" %>
<%@ page import="unihome.OwnerDAO" %>
<%@ page import="java.sql.SQLException" %>

<%  
    // Get house ID from the request
    int houseID = Integer.parseInt(request.getParameter("houseID"));
    List<Owner> ownerDetails = new ArrayList<Owner>();
    OwnerDAO ownerDAO = new OwnerDAO();
        
    try {
        ownerDetails = ownerDAO.getOwnerDetails(houseID); 
        request.setAttribute("owner", ownerDetails);
    
		request.getRequestDispatcher("/UniHome/ownerDetails.jsp").forward(request, response);

    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

%>