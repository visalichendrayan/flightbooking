<%@page import="com.test.servlet.FlightList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flight</title>
<style type="text/css">
}
table th td tr {
	border-style: double;
	border-color: #96D4D4;
	border-collapse: separate; <!--
	vertical-align: top;
	-->
}
</style>
</head>
<body>
	<%
	String source = request.getParameter("source");
	String destination = request.getParameter("destination");
	String date = request.getParameter("traveldate");
	String passengerCount = request.getParameter("passengercount");
	LocalDate localDate = LocalDate.parse(date);
	response.setContentType("text/html");
	String travelDay = localDate.getDayOfWeek().toString().substring(0, 3);
	Map<String, String> hashMap = new HashMap<>();
	hashMap.put("source", source.strip());
	hashMap.put("destination", destination.strip());
	hashMap.put("weekday", travelDay.strip());
	List<FlightList> flightList = DBUtil.getAvailableFlights(hashMap);
	request.setAttribute("flightList", flightList);
	request.setAttribute("traveldate",date);
	request.setAttribute("passengercount",passengerCount);
	%>
	
<table>
		<tr>
			<th>Id&nbsp;&nbsp;</th>
			<th>FlightName&nbsp;&nbsp;</th>
			<th>Source&nbsp;&nbsp;</th>
			<th>Destination&nbsp;&nbsp;</th>
			<th>AirLines&nbsp;&nbsp;</th>
			<th>Price&nbsp;&nbsp;</th>
			</th>
        
        </tr>


			<c:forEach var="fli" items="${flightList}">
				<form action="register" method="post">
					<tr>
						<td><c:out value="${fli.getId()}" />&nbsp;&nbsp;</td>
						<td><c:out value="${fli.getName()}" />&nbsp;&nbsp;</td>
						<td><c:out value="${fli.getSource().getPlaceName()}" />&nbsp;&nbsp;</td>
						<td><c:out value="${fli.getDestination().getPlaceName()}" />&nbsp;&nbsp;</td>
						<td><c:out value="${fli.getAirLines().getAirlinesName()}" />&nbsp;&nbsp;</td>
						<td><c:out value="${fli.getTicketPrice()}" />&nbsp;&nbsp;</td>
						<td>
						<input type=hidden name=id value="${fli.getId()}"/>
						<input type=hidden name=name value="${fli.getName()}" />
						<input type=hidden name=source value="${fli.getSource().getPlaceName()}" />
					     <input type=hidden name=destination
							value="${fli.getDestination().getPlaceName()}" /> 
							<input type=hidden
							name=airlines value="${fli.getAirLines().getAirlinesName()}" /> 
							<input type=hidden
							name=ticketprice value="${fli.getTicketPrice()}" /> 
							<input type=hidden
							name=passengercount value="<%=passengerCount%>" /> 
							<input type=hidden name=traveldate value="${traveldate}"/>
							<input
							type="submit" value="BookNow"></td>
					</tr>
				</form>
			</c:forEach>
	</table>

</html>