<%@page import="com.test.model.AirlinesList"%>
<%@page import="com.test.model.PlacesList"%>
<%@page import="com.test.servlet.FlightList"%>
<%@page import="com.test.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Page</title>

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
  float: left;
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
<body>
<ul>
 
  
  <li><a href="Logout.jsp">Logout</a></li>
  <li><a href="PersonalDetails.jsp
  ">Booking History</a></li>
</ul>
<% 
String userEmail=request.getParameter("useremail");
String password=request.getParameter("password");
boolean flag=DBUtil.validateLogin(userEmail, password);
if(flag){
	HttpSession sess=request.getSession();  
	sess.setAttribute("uname",userEmail); 
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
        forward(request, response);
}
	else{
		request.
        getRequestDispatcher("/SearchPage.jsp").
        forward(request, response);
	}
}
%>

</body>
</html>