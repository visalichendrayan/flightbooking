<%@page import="com.test.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<a href="Dashboard.html">Dashboard</a>
<a href="Logout.jsp">Logout</a>
<%

HttpSession httpSession=request.getSession(false);
if(httpSession!=null && httpSession.getAttribute("name")!=null
		&&httpSession.getAttribute("name").equals("admin")){
	
if(DBUtil.changePassword(request.getParameter("newpassword").strip())){
%>

<p>Password changed successfully</p>
<%}else{
	 %>
<p>Password change failed</p>
<%
}}
%>
</body>
</html>