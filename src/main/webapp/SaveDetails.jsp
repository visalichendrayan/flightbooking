<%@page import="com.test.util.DBUtil"%>

<%@page import="com.test.model.CustomerDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>
</head>
<body>
<%
CustomerDetails custDetails=new CustomerDetails();
custDetails.setCustEmail(request.getParameter("email").strip());
custDetails.setCustName(request.getParameter("username").strip());
custDetails.setCustPassword(request.getParameter("password".strip()));
custDetails.setCustMobile(request.getParameter("mobile").strip());
DBUtil.saveCustomerDetails(custDetails);
request.
getRequestDispatcher("/LoginUser.jsp").
forward(request, response);

%>
<p>Registration Successful</p>
</body>
</html>