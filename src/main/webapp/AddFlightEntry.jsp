
<%@page import="com.test.servlet.FlightList"%>
<%@page import="com.test.model.AirlinesList"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="com.test.model.PlacesList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddFlight Entry</title>
</head>
<body>
<%
HttpSession ses=request.getSession();
if(ses!=null && ses.getAttribute("name")!=null &&
!((String)ses.getAttribute("name")).isEmpty()){
PlacesList source=DBUtil.getPlaceByName(request.getParameter("source").strip());
PlacesList destination=DBUtil.getPlaceByName(request.getParameter("destination").strip());
AirlinesList airlines=DBUtil.getAirLinesByName(request.getParameter("airlines").strip());
FlightList flightList=new FlightList();
flightList.setAirLines(airlines);
flightList.setSource(source);
flightList.setDestination(destination);
flightList.setWeekdays(request.getParameter("weekday").strip());
flightList.setName(request.getParameter("flightname").strip());
flightList.setTicketPrice(Integer.parseInt(request.getParameter("price").strip()));
DBUtil.addFlightList(flightList);
%>
<p>Flight Added sucessfully</p>
<a href="Dashboard.html">Dashboard</a>
<a href="Logout.jsp">Logout</a>
<%} %>
</body>
</html>