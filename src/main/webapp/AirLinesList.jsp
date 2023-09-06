
<%@page import="java.io.PrintWriter"%>
<%@page import="com.test.util.DBUtil"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AirLines List</title>
<style type="text/css">
table, th, td {
	border-style: double;
	border-color: #96D4D4;
}
</style>
</head>
<body>
<a href="Dashboard.html">Dashboard</a>
<a href="Logout.jsp">Logout</a>
<br/><br/>
<% 
		HttpSession httpSession=request.getSession(false);
		if(httpSession!=null && httpSession.getAttribute("name")!=null
				&&httpSession.getAttribute("name").equals("admin")){
			List<String> airList=DBUtil.getAirLinesList();
			request.setAttribute("airList", airList);

%>
	<table>
		<tr>
			<th>AirLines</th>

		</tr>
		
		<c:forEach var="air" items="${airList}">
			<tr style="border-style: double; border-color: blue;">

				<td><c:out value="${air}" /></td>

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