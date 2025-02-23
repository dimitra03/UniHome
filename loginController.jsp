<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="unihome.*" %>
<%@ page errorPage="errorPage.jsp" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

UserDAO userDao = new UserDAO();

try {

    User user = userDao.authenticate(username, password);
    //response.sendRedirect("search.jsp");
    session.setAttribute("userObj2024", user);
    RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
    dispatcher.forward(request, response);
   
} catch (Exception e) {
    request.setAttribute("message", "Wrong username or password");
    
    //session.setAttribute("message", e.getMessage());
   // response.sendRedirect("landingpage.jsp");

    RequestDispatcher dispatcher = request.getRequestDispatcher("landingpage.jsp");
    dispatcher.forward(request, response);
}
%>
