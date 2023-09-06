<%@page import="com.test.servlet.FlightList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Gateway</title>
<style type="text/css">
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: right;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
.form-center {
  display:flex;
  justify-content: center;
}
</style>
</head>
<body>
<ul>
 
  
  <li><a href="Logout.jsp">Logout</a></li>
  <li><a href="PersonalDetails.jsp
  ">Booking History</a></li>
</ul>
<%
HttpSession ses=request.getSession(false);
if(ses!=null && ses.getAttribute("uname")!=null &&
!((String)ses.getAttribute("uname")).isEmpty()){
	  FlightList flight=(FlightList)ses.getAttribute("flightdetails");
	int passengerCount=(Integer)ses.getAttribute("passengercount");
	int fare=flight.getTicketPrice()*passengerCount;
	
	
%>
<div class="form-center">
<form action="thankyoupage">
<label>CardHolder Name
</label>
<input type="text" name="cardholdername" required="required"/>
<label>Card Number
</label>
<input type="number" name="cardnumber" required="required"/>
<label>Total Fare
</label>
<input type="number" name="totalfare"  required="required"  value="<%=fare%>"/>

<input type="submit" value="Proceed">
</form>
</div>
<%}
%>
</body>
</html>