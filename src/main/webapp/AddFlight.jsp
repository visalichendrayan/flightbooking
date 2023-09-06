<%@page import="java.util.List"%>
<%@page import="com.test.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Flight</title>
</head>
<body>
<script type="text/javascript">
function validatefields(){
	
		var source = document.getElementsByName("source")[0].value;
		var destination=document.getElementsByName("destination")[0].value;
		if(source==destination){
			 document.getElementById("error1").innerHTML="Source and Destination cannot be same";
			 return false;
		}else {
		
	var weekday="";
	  var markedCheckbox = document.getElementsByName('day');  
	  for (var checkbox of markedCheckbox) {  
	    if (checkbox.checked) {
	    	weekday=weekday+checkbox.value.trim()+"-";
	    } 
	        
	  }  
	  weekday = weekday.replace(new RegExp('-' + '$'), '').trim();
	  alert(weekday);
	  document.getElementsByName("weekday")[0].value=weekday;
	
	 return true;
	}
  
}
</script>
<%HttpSession ses=request.getSession();
if(ses!=null && ses.getAttribute("name")!=null &&
!((String)ses.getAttribute("name")).isEmpty()){
List<String> placesList=DBUtil.getPlacesList();
List<String> airlinesList=DBUtil.getAirLinesList();
request.setAttribute("placesList",placesList);
request.setAttribute("airlinesList",airlinesList);
%>
<form name="addflight" action="AddFlightEntry.jsp" method="post" onsubmit="return validatefields();">
<label>Name</label>
<input type="text" name="flightname"/>
<label>Source</label>
<select name="source">
  <c:forEach items="${placesList}" var="sourceName">
    <option value=" ${sourceName}">
        ${sourceName}
    </option>
  </c:forEach>
</select>
<label>Destination</label>
<select name="destination">
  <c:forEach items="${placesList}" var="destinationName">
    <option value=" ${destinationName}">
        ${destinationName}
    </option>
  </c:forEach>
</select>
<label>Airlines</label>
<select name="airlines">
  <c:forEach items="${airlinesList}" var="airlinesName">
    <option value=" ${airlinesName}">
        ${airlinesName}
    </option>
  </c:forEach>
</select>
<label>Price</label>
<input type="number" name="price"/>
<label>Weekdays</label>
 Sunday<input type="checkbox" id="check1" name="day" value="sun">
 Monday<input type="checkbox" id="check2" name="day" value="mon">
 Tuesday<input type="checkbox" id="check3" name="day" value="tue">
 Wednesday<input type="checkbox" id="check4" name="day" value="wed">
 Thursday<input type="checkbox" id="check5" name="day" value="thu">
 Friday<input type="checkbox" id="check5" name="day" value="fri">
  Saturday<input type="checkbox" id="check5" name="day" value="sat">
 <div id="error1"></div>
 <input type="hidden" name="weekday"/>
 
<input type="submit" value="addflight"/>
</form>
<%} %>
</body>
</html>