<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webShop.ShoppingCart"%>
<%@ page import="webShop.Products"%>
<%@ page import="webShop.ShoppingCartItem;"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if ( sc == null ) {
			sc = new ShoppingCart();
			session.setAttribute("ShoppingCart", sc);
		}

		if ( request.getParameter("itemId") != null ) {
			try {
				Products products = (Products) application.getAttribute("products");
				sc.addItem(products.getProduct(request.getParameter("itemId")),
						Integer.parseInt(request.getParameter("itemCount")));
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		%>
		Selected items:
		<table><tr bgcolor="lightgrey"><th>Name</th><th>Price</th><th>Number</th><th>Total price</th></tr>
		<%  double total = 0;
		for ( ShoppingCartItem i : sc.getItems() ) {%>
			<td> <%= i.getProduct().getName() %>  </td>
			<td> <%= i.getProduct().getPrice() %> </td>
			<td> <%= i.getCount()  %> 			  </td>
			<% double price = i.getProduct().getPrice() * i.getCount(); %>
			<td>  <%= price  %></td>
			</tr>
			<% total += price; }%>
		</table>
		
		<p>
		Total: $<%=total %>
		</p>

		<p>
		<a href="shop-home.jsp">Back</a>
		<br>
		<a href="buy.jsp">Buy</a>
		<br>
		<a href="../index.jsp">Home</a>
		</p>
</body>
</html>