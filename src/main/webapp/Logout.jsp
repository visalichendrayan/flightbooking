<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
	<%
response.setContentType("text/html");  
PrintWriter wri=response.getWriter();  
wri.println("You are successfully logged out!");  
HttpSession sess=request.getSession();
sess.invalidate();  
request.getRequestDispatcher("/index.html").include(request, response); 
wri.close();

%>
</body>
</html>