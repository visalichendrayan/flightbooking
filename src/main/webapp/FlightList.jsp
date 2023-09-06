<%@page import="java.io.PrintWriter"%>
<%@page import="com.test.servlet.FlightList"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flights List</title>
<style type="text/css">
table, th, td {
	border-style: double;
	border-color: #96D4D4;
}
</style>
</head>
<body>
<a href="Dashboard.html">Dashboard</a>
<a href="AddFlight.jsp">Add Flight</a>
<a href="Logout.jsp">Logout</a>
<br/><br/>
<% 
		HttpSession httpSession=request.getSession(false);
		if(httpSession!=null && httpSession.getAttribute("name")!=null
				&&httpSession.getAttribute("name").equals("admin")){
			List<FlightList> flightList=DBUtil.getFlightList();
			request.setAttribute("flightList", flightList);

%>

	<table>
		<tr>
			<th>Id</th>
			<th>FlightName</th>
			<th>Source</th>
			<th>Destination</th>
			<th>AirLines</th>
			<th>Price</th>
		</tr>
	<c:forEach var="fli" items="${flightList}">
			<tr style="border-style: double; border-color: blue;">
				<td><c:out value="${fli.getId()}" /></td>
				<td><c:out value="${fli.getName()}" /></td>
				<td><c:out value="${fli.getSource().getPlaceName()}" /></td>
				<td><c:out value="${fli.getDestination().getPlaceName()}" /></td>
				<td><c:out value="${fli.getAirLines().getAirlinesName()}" /></td>
				<td><c:out value="${fli.getTicketPrice()}" /></td>
			</tr>
		</c:forEach>

	</table>

	<% 
	}else{
		response.setContentType("text/html");
		PrintWriter wri=response.getWriter();
		wri.println("<p>Please Login First</p>");
		wri.close();
		RequestDispatcher req=request.getRequestDispatcher("/AdminLogin.jsp");
		req.include(request, response);
		
	}
		
	%>
</body>
</html>