<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.User"%>
<%@page import="model.CreditCard"%>
<%@page import="dao.DAOFactory"%>
<%@page import="dao.DAOInterface"%>
<%@ page import="webShop.ShoppingCart"%>
<%@ page import="webShop.Products"%>
<%@ page import="webShop.ShoppingCartItem;"%>

<%! DAOInterface<User> dao=DAOFactory.getDao(User.class);
	DAOInterface<CreditCard> daoSecond=DAOFactory.getDao(CreditCard.class);
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check out!</title>
</head>
<body>

	<jsp:useBean id="card" scope="page" class="model.CreditCard" />
    <jsp:setProperty name="card" property="name" param="name" />
    <jsp:setProperty name="card" property="surname" param="surname" />
    <jsp:setProperty name="card" property="ccnumber" param="number" />
     <jsp:setProperty name="card" property="end" param="end" />
    
  <%
  String s = card.getName()+","+card.getSurname()+","+card.getCcnumber()+","+card.getEnd();
  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
  Date date = new Date();
  s+="," + dateFormat.format(date);
  System.out.println("ovo je s" + s);
  ShoppingCart sc=(ShoppingCart)session.getAttribute("ShoppingCart");
  double totalPrice = 0;
  String p = "";
  for ( ShoppingCartItem i : sc.getItems() ){ 
	  totalPrice += i.getCount()*i.getProduct().getPrice();	
	  p+= ","+i.getProduct().getName()+ " " + i.getProduct().getPrice() + " " + i.getCount();
  }
  s=s+p+","+totalPrice+";";
  try{
   	BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\Nemanja\\Desktop\\data.txt",true));
  	writer.append(s);
  	writer.close();
  	session.removeAttribute("ShoppingCart");
  	}catch(Exception ex){
  		ex.printStackTrace();
  	}
  %>
  <h1>Thank you!</h1>
</body>
</html>