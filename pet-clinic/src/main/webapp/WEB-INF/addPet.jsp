<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>add Pet</h1>
	<p><form:errors path="user.*"/></p>
	<c:out value="${currentUser.id}"></c:out>
    
    <form:form method="POST" action="/add/pet" modelAttribute="petModel">
    	<p>
            <form:label path="name">Name:</form:label>
            <form:input path="name"/>
        </p>
        <p>
            <form:label path="age">Age:</form:label>
            <form:input path="age"/>
        </p>
        <p>
            <form:label path="sex">Sex:</form:label>
            <form:input path="sex"/>
        </p>
         <p>
            <form:hidden path="owner" value="${currentUser.id}"/>
        </p>
        
        <form:select path="specie" class="form-select">
		  <form:option value="NONE">Select pet</form:option>
		  <c:forEach items="${species}" var="specie">
		  <form:option value="${specie.id}">${specie.specieName}</form:option>
		  </c:forEach>
		</form:select>	
		  <input type="submit" value="Register!"/>
    </form:form>
 

</body>
</html>