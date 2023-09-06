<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>
<body>

<form action="validatelogin">
<% if(request.getParameter("source")!=null &&
request.getParameter("destination")!=null &&
request.getParameter("traveldate")!=null){
%>
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
			<input type=hidden name=passengercount
			value="<%=request.getParameter("passengercount")%>"/>
	
<%
}
%>		

<label>User Email</label>
<input type="email" name="useremail"/>
<label>Password</label>
<input type="password" name="password"/>
<input type="submit" value="Login"/>
</form>
</body>
</html>