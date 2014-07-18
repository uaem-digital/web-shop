<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.User" %>
<%@page import="dao.DAOFactory"%>
<%@page import="dao.DAOInterface"%>
<%@ page import="webShop.ShoppingCart"%>
<%@ page import="webShop.Products"%>
<%@ page import="webShop.ShoppingCartItem;"%>

<%! DAOInterface<User> dao=DAOFactory.getDao(User.class); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if( session.getAttribute("user")==null) {%>
<h1> Please login to continue! </h1>
<%} else if ( ! dao.has( (User) session.getAttribute("user"))){	%>
		<h1> The user does not exist</h1>
<%} else { 
			%><h1> Please enter: </h1>
			  <form action="checkout.jsp" method="post">
				Name: <input type="text" name="name"><br>
				Surname: <input type="text" name="surname"><br>
				Cc number: <input type="text" name="number"><br>
				Expiries end: <input type="text" name="end"><br>
				<input type="submit" value="Done">
			  </form>
<% } %> 
	<a href="../index.jsp"> Home </a>
</body>
</html>