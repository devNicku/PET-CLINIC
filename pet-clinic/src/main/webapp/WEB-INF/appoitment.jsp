<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>appoitment Page</title>
</head>
<body>
<script>
	function HideDiv() {
         document.getElementById("showOrHidevet").style.display='none';
         document.getElementById("showOrHidegroom").style.display='none';
        }
   window.onload = HideDiv;
   function showOrHideDiv() {
    document.getElementById("showOrHidevet").style.display='block';
   }
   function showOrHideDivGrom() {
  
     document.getElementById("showOrHidegroom").style.display='block';
   }
</script>

    <p><form:errors path="user.*"/></p>
    <c:out value="${currentUser.id}"></c:out>
    <H1> Choose a Service </H1>
    <button  onclick="showOrHideDiv();">Veterinarian</button>
    <button onclick="showOrHideDivGrom();">Grooming</button>
    
    
    
    
    <form:form method="POST" action="/add/appointment" modelAttribute="appointment">
    	<p>
            <form:label path="dateTime">Date</form:label>
            <form:input type="date" path="dateTime"/>
        </p>
       <p>
            <form:label path="time">Time for appointment</form:label>
            <form:input type = "time"  min="09:00" max="18:00" path="time"/> <small>Office hours are 9am to 6pm</small>
        </p>

        <p>
            <form:label path="assigned">Select a person for Service:</form:label>
            <div id="showOrHidevet">
	    	  	<form:select path="assigned">
	        		<c:forEach items="${veterinarians}" var="vet">
	        			<option value="${vet.id}">${vet.nombre}</option>
	        	   </c:forEach>
	        	</form:select>
    		</div>
    		<div id="showOrHidegroom">
          		<form:select path="assigned">
        			<c:forEach items="${groomers}" var="groom">
        				<option value="${groom.id}">${groom.nombre}</option>
        	   		</c:forEach>
        		</form:select>
       		</div>
        </p>
        <p>
         	<form:label path="pet">Select your pet:</form:label>
            <form:select path="pet">
        		<c:forEach items="${pets}" var="pet">
        			<option value="${pet.id}">${pet.name}</option>
        	   </c:forEach>
        	</form:select>
        </p>
        <p>	
        	<form:label path="service">Select a service:</form:label>
            <form:select path="service">
        			<option value="vaccines">Vaccine</option>
        			<option value="Dental Care">Dental Care</option>
        			<option value="Grooming">Grooming</option>
        			<option value="Surgery">Surgery</option>
        	</form:select>
        </p>
         <p>	
        	<form:hidden path="owner" value="${currentUser.id}"/>
        	<form:hidden path="status" value="true"/>
        </p>
        <input type="submit" value="Create appointment!"/>
    </form:form>
     		
		
   
</body>
</html>