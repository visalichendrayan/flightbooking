<%@page import="com.test.servlet.FlightList"%>
<%@page import="com.test.model.CustomerDetails"%>
<%@page import="com.test.util.DBUtil"%>

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Confirmation</title>
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
		   
  
	String date = (String)ses.getAttribute("traveldate");
	String userEmail=(String)ses.getAttribute("uname");
	int passengerCount=(Integer)ses.getAttribute("passengercount");
	CustomerDetails cust=DBUtil.getCustomerByUserEmail(userEmail.strip());
    session.setAttribute("userdetails", cust);
    //request.getRequestDispatcher("payment").forward(request, response);
%>
<form action="payment">
	<p><b>Booking Details</b></p>
	<p>Flight Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=flight.getId()%></p>
	<p>Flight Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=flight.getName()%></p>
	<p>Airlines&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=flight.getAirLines().getAirlinesName()%></p>
	<p>Source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=flight.getSource().getPlaceName()%></p>
	<p>Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=flight.getDestination().getPlaceName()%></p>
	<p>Travel Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></p>
	<p>PassengerCount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=passengerCount%></p>
	<p>TicketPrice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=passengerCount*flight.getTicketPrice()%></p>
	<p>Passenger Details</p>
	<p>Passenger Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cust.getCustId()%></p>
	<p>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cust.getCustName()%></p>
	<p>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cust.getCustEmail()%></p>
	<p>Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cust.getCustMobile()%></p>
	<input type="submit" value="Make Payment"> 
	</form>
	<%}else{ 
PrintWriter pri=response.getWriter();
pri.println("Please Login first");
request.getRequestDispatcher("loginuser").include(request, response);
pri.close();
}%>
</body>
</html>