<%@page import="java.util.List"%>
<%@page import="com.test.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Page</title>
<style type="text/css">

form  { display: table;    width: 25%;
        margin-left : 25%  }
p     { display: table-row;  }
label { display: table-cell;
 margin-right: 50px; }
select,input { display: table-cell; }
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
<script type="text/javascript">
function validatefields(){
	
	var source = document.getElementsByName("source")[0].value.trim();
	var destination=document.getElementsByName("destination")[0].value.trim();
	if(source==destination){
		 document.getElementById("error1").innerHTML="Source and Destination cannot be same";
		 return false;
	}else{
		return true;
	}
}
	
	</script>
<%
List<String> places=DBUtil.getPlacesList();

request.setAttribute("places", places);
HttpSession ses=request.getSession(false);
if(ses!=null && ses.getAttribute("uname")!=null &&
!((String)ses.getAttribute("uname")).isEmpty()){
%>
<ul>
<li><a href="Logout.jsp">Logout</a></li>
 <li><a href="PersonalDetails.jsp">Booking History</a></li>
 </ul>

<%}%>
<form action="searchflight" method="post" onsubmit="return validatefields()">
<p>
<label style='font-size: larger;'>Source&nbsp;&nbsp;</label>
<select name="source">
  <c:forEach items="${places}" var="sourceName">
    <option value=" ${sourceName}">
        ${sourceName}
    </option>
    
  </c:forEach>
</select>

</p>
<br/>
<p>
<label style='font-size: larger;'>Destination&nbsp;&nbsp;</label>
<select name="destination">
  <c:forEach items="${places}" var="destinationName" varStatus="loop">
    <option value="${destinationName}">
        ${destinationName}
    </option>
  </c:forEach>
</select>

</p>
<br/>
<p>
<label style='font-size: larger;'>
Travel Date &nbsp;&nbsp;
</label>
<input type="date" name="traveldate" required="required"/>

</p>
<br/>
<p>
<label style='font-size: larger;'>No of Passengers &nbsp;&nbsp;</label>
<input type="number" name="passengercount" step="1" required="required"/>

</p>
<br/>
<div id="error1"></div>
<p style="align-items: center;"><input type="submit" required="required"/></p>
</form>
</body>
</html>