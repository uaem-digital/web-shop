<%@page import="dao.DAOFactory" %>
<%@page import="dao.DAOInterface"%>

<%@page import="model.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%! DAOInterface<User> dao=DAOFactory.getDao(User.class); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>

	<jsp:useBean id="user" scope="page" class="model.User" />
    <jsp:setProperty name="user" property="name" param="name" />
    <jsp:setProperty name="user" property="username" param="username" />
     <jsp:setProperty name="user" property="password" param="password" />
<%
	if ( dao.has(user) ){
		%><h1>User exist!</h1> <%
	} //response.sendRedirect("shop/.jsp");
	else { dao.save(user); //response.sendRedirect("uspelaRegistracija.jsp");
		%><h1>Thank you!</h1><% 
	}
%>

</body>
</html>