
<%@page import="com.test.model.BookingDetails"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="com.test.servlet.FlightList"%>
<%@page import="com.test.model.CustomerDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
</style>
<meta charset="ISO-8859-1">
<title>Thankyou Page</title>
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
	if(request.getParameter("cardholdername")!=null && request.getParameter("cardnumber")!=null){
		CustomerDetails custDetails=(CustomerDetails)ses.getAttribute("userdetails");
		 FlightList flight=(FlightList)ses.getAttribute("flightdetails");
		BookingDetails bookDetails=new BookingDetails();
		bookDetails.setCustomerdetails(custDetails);
		bookDetails.setFlightlist(flight);
		bookDetails.setTravelDate((String)ses.getAttribute("traveldate"));
		bookDetails.setTotalFare(flight.getTicketPrice()*(Integer)ses.getAttribute("passengercount"));
		DBUtil.addBookingDetails(bookDetails);
		
	

%>
<p>Ticket successfully Booked</p>
<p><a href="Logout.jsp">Logout</a></p>
<%}} %>
</body>
</html>