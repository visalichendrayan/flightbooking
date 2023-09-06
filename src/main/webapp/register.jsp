<%@page import="com.test.model.AirlinesList"%>
<%@page import="com.test.model.PlacesList"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="com.test.servlet.FlightList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%
HttpSession ses=request.getSession(false);
if(ses!=null && ses.getAttribute("uname")!=null &&
!((String)ses.getAttribute("uname")).isEmpty()){
	if(request.getParameter("source")!=null &&
			request.getParameter("destination")!=null &&
			request.getParameter("traveldate")!=null){
		
		session.setAttribute("traveldate", request.getParameter("traveldate"));
		FlightList flight=new FlightList();
		PlacesList source=DBUtil.getPlaceByName(request.getParameter("source").strip());
		PlacesList destination=DBUtil.getPlaceByName(request.getParameter("destination").strip());
		AirlinesList airlines=DBUtil.getAirLinesByName(request.getParameter("airlines").strip());
		flight.setId(Integer.parseInt(request.getParameter("id").strip()));
		flight.setName(request.getParameter("name").strip());
		flight.setSource(source);
		flight.setDestination(destination);
		flight.setAirLines(airlines);
		flight.setTicketPrice(Integer.parseInt(request.getParameter("ticketprice").strip()));
		session.setAttribute("flightdetails", flight);
        session.
        setAttribute("passengercount", 
       Integer.parseInt(request.getParameter("passengercount").strip()));
        request.
        getRequestDispatcher("bookingconfirmation").
        forward(request, response);}}else{
%> 
<form action="registernewuser" method="post">
		<input type=hidden name=id value="<%=request.getParameter("id")%>" />
		<input type=hidden name=name value="<%=request.getParameter("name")%>" />
		<input type=hidden name=source
			value="<%=request.getParameter("source")%>" /> <input type=hidden
			name=destination value="<%=request.getParameter("destination")%>" />
		<input type=hidden name=airlines
			value="<%=request.getParameter("airlines")%>" /> <input type=hidden
			name=ticketprice value="<%=request.getParameter("ticketprice")%>" />
		<input type=hidden name=traveldate
			value="<%=request.getParameter("traveldate")%>" />
			
				<input type="hidden" name=passengercount value="<%=request.getParameter("passengercount") %>" />
		
		 <input type="submit" value="RegisterNewUSer" />
	</form>
	
	<form action="loginuser" method="post">
	<input type=hidden name=id value="<%=request.getParameter("id")%>" />
		<input type=hidden name=name value="<%=request.getParameter("name")%>" />
		<input type=hidden name=source
			value="<%=request.getParameter("source")%>" /> <input type=hidden
			name=destination value="<%=request.getParameter("destination")%>" />
		<input type=hidden name=airlines
			value="<%=request.getParameter("airlines")%>" /> <input type=hidden
			name=ticketprice value="<%=request.getParameter("ticketprice")%>" />
		<input type=hidden name=traveldate
			value="<%=request.getParameter("traveldate")%>" />
			
		<input type="hidden" name=passengercount value="<%=request.getParameter("passengercount") %>" />
	 <input type="submit" value="Existing User Login" />
	</form>	
<%


} %>
</body>
</html>