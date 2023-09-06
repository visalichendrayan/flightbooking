<%@page import="com.test.servlet.FlightList"%>
<%@page import="com.test.model.BookingDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="com.test.model.CustomerDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking History</title>
</head>
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
table {
  margin-left: auto;
  margin-right: auto;
  margin-top: 200px;
}
</style>
<body>
<ul>
<li><a href="Logout.jsp">Logout</a></li>
 <li><a href="SearchPage.jsp">SeachPage</a></li>
 </ul>
<%
HttpSession ses=request.getSession(false);
if(ses!=null && ses.getAttribute("uname")!=null &&
!((String)ses.getAttribute("uname")).isEmpty()){
	String uname=((String)ses.getAttribute("uname")).strip();
	CustomerDetails custDetail=DBUtil.getCustomerByUserEmail(uname);
	List<BookingDetails> bookingDetails=DBUtil.
			getBookingDetailsByUserId(custDetail.getCustId());
	request.setAttribute("bookingdetails", bookingDetails);
%>

<table>
		<tr>
			<th>Id</th>
			<th>FlightName</th>
			<th>Source</th>
			<th>Destination</th>
			<th>AirLines</th>
			<th>Price</th>
			<th>Travel Date</th>
		
		</tr>
	<c:forEach var="b" items="${bookingdetails}">
			<tr style="border-style: double; border-color: blue;">
				<td><c:out value="${b.getFlightlist().getId()}" /></td>
				<td><c:out value="${b.getFlightlist().getName()}" /></td>
				<td><c:out value="${b.getFlightlist().getSource().getPlaceName()}" /></td>
				<td><c:out value="${b.getFlightlist().getDestination().getPlaceName()}" /></td>
				<td><c:out value="${b.getFlightlist().getAirLines().getAirlinesName()}" /></td>
				<td><c:out value="${b.getTotalFare()}" /></td>
				<td><c:out value="${b.getTravelDate()}" /></td>
			</tr>
		</c:forEach>

	</table>
	<%} %>
</body>
</html>