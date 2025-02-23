<script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=ZV5D73GO7xZwIiYYjf0Oz8sSsJy2kiAhNhS3DjbOyyfF6P187bwfAy9p0ctpfFoZ8mzic3xpdyJgXMigHbzy67Ngoz88_W78Bvg9y2kb6BFaRqtDqwqmKgW4x4YVLN85dEwirPZk5UvX2Vjg4Q7x2Aziot9Sshbgozn4YB5vqpg" charset="UTF-8">
	
</script><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html lang="en">
	<head>
        <%@ include file="header.jsp" %>
		<title>Error Page</title>
        <link rel="stylesheet" href="css/errorPage.css"> 
    </head>

	

<body>
    <div class="error-container">
        <h1 class="error-code">404</h1>
        <p class="error-message">Oops! The page you're looking for cannot be found.</p>
        <a href="search.jsp" class="home-button">Back to Home</a>
    </div>

	 <!-- footer -->
	 <jsp:include page="footer.jsp" />
	 <!-- End footer -->
</body>


</html>


