
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
			List<String[]> placeList=DBUtil.getPlacesList();
			request.setAttribute("placeList", placeList);

%>
	<table>
		<tr>
			<th>Source</th>
             <th>Destination</th>
		</tr>
		
	
	<c:forEach var="innerList" items="${placeList}">
	<tr>
    <c:forEach var="obj" items="${innerList}">
    <td>
        <c:out value="${obj}"></c:out>
        </td>
    </c:forEach>
    </tr>
</c:forEach>
	</table>
		<%
	}else{
		response.setContentType("text/html");
		PrintWriter wri=response.getWriter();
		wri.println("<p>Please Login First</p>");
		RequestDispatcher req=request.getRequestDispatcher("/AdminLogin.jsp");
		req.include(request, response);
		wri.close();
		
		
	}
		
	%>
</body>
</html>