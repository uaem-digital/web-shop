<%@page import="dao.DAOFactory" %>
<%@page import="dao.DAOInterface"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%! DAOInterface<User> dao=DAOFactory.getDao(User.class); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log in</title>
</head>
<body>
	
	
	
	<jsp:useBean id="user" scope="page" class="model.User" />
    <jsp:setProperty name="user" property="name" param="kime" />
    <jsp:setProperty name="user" property="password" param="ksifra" />
<%
	if ( dao.has(user) ) 
		{
			List<User> lista=dao.findAll();
			boolean exist=false;
			for ( User i: lista)
			{
				if ( i.getName().equals(user.getName()) && i.getPassword().equals(user.getPassword()))
					{
						session.removeAttribute("user");
						session.setAttribute("user",i);
						response.sendRedirect("../shop/shop-home.jsp");
						exist=true;
						break;
					}
			}
			if (!exist){ 
				//response.sendRedirect("neuspelaPrijava.jsp");
				%><h1>Bad username or password!</h1><%
			}
		}
	else {
		%><h1>Bad username or password!</h1><%
	}
%>
	
</body>
</html>