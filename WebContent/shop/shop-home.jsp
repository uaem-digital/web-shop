<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webShop.Products" %>
<%@ page import="webShop.Product" %>

<%!	Products products=null;
	public void jspInit(){
	ServletContext ctx = getServletContext();
	String s=ctx.getRealPath("");
	products = new Products(ctx.getRealPath(""));
	ctx.setAttribute("products", products);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop Home Page</title>
</head>
<body>

<% String search=request.getParameter("search"); %>


<h1>Shop items</h1>
		<form action="shop-home.jsp">Search: <input type="text" name="search"> </form>
		<hr>
		<table border="1">
		<tr bgcolor="lightgrey">
		<th>Name</th>  <th>Price</th><th>&nbsp;</th>    </tr>
		<%  for (Product p: products.values()) {	
			if ( search==null || ( search!=null && p.getName().toLowerCase().contains(search.toLowerCase())) ) { %> 
		<form action="cart.jsp">
			<tr>
			<td> <%= p.getName() %> </td>
			<td> <%= p.getPrice() %> </td>
			<td>
			<input type="text" size="3" name="itemCount">
			<input type="hidden" name="itemId" value="<%= p.getId() %>">
			<input type="submit" value="Add">
			</td>
			</tr>
			</form>
			<%} }%>
			
		</table>
		<p>
		<a href="cart.jsp">Cart</a>
		<hr>
		<a href="../index.jsp">Home</a>
		</p>

</body>
</html>