<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Appointment</title>
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
    document.getElementById("groom").removeAttribute("name");
   }
   function showOrHideDivGrom() {
  
     document.getElementById("showOrHidegroom").style.display='block';
     document.getElementById("vet").removeAttribute("name");
   }
</script>
	
	<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
	</div>
	
	
    
	<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/">Pet Clinic</a></h1>
       <nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="/">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#services">Services</a></li>
					<li><a href="#departments">Departments</a></li>
					<li><a href="#contact">Contact</a></li>
					<li>
					<security:authorize access="isAuthenticated()">
	        			<li><a>Welcome: <c:out value="${currentUser.username}"></c:out></a></li>
	        			<li>
				            <form id="logoutForm"  method="POST" action="/logout">
				        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        		<input type="submit" class="btn btn-link" value="Logout!" />
				    		</form>
	         
	         			</li> 
    				</security:authorize> 
    				</li>
				</ul>
			</nav>

      <a href="/appointment" class="appointment-btn scrollto">Make an Appointment</a>
    </div>
  </header>
  <section id="appointment" class="appointment section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Make an Appointment</h2>
          <p>If this is an urgent issue, please call us at XXX-xxx-0000.</p>
        </div>
        <div>
			<p><form:errors path="user.*"/></p>
	    	<H1> Choose a Service </H1>

	    	<button class="appointment-btn scrollto" onclick="showOrHideDiv();">Veterinarian</button>
	    	<button class="appointment-btn scrollto" onclick="showOrHideDivGrom();">Grooming</button>
	    	
        </div><br>
        <div >
        <form:form action="/add/appointment" method="post" modelAttribute="appointment" class="php-email-form">
          <div class="form-row">
            <div class="col-md-4 form-group">
            	<form:label class="form-label" path="dateTime">Date</form:label>
            	<form:input class="form-control" type="date" path="dateTime"/>
				<div class="validate"></div>
            </div>
            <div class="col-md-4 form-group">
            	<form:label class="form-label" path="time">Time for appointment</form:label>
            	<div>
	            	<form:input class="form-control" type = "time"  min="09:00" max="18:00" value="" step="3600" path="time"/>
	            	<small>Office hours are 9am to 6pm</small>
            	</div>
				<div class="validate"></div>
            </div><br>
            <div class="col-md-4 form-group">
            	<form:label class="form-label" path="assigned">Select a person for Service:</form:label>
				<div id="showOrHidevet">
					<form:select class="form-select" id="vet" path="assigned">
						<option selected disabled>Open this to select</option>
						<c:forEach items="${veterinarians}" var="vet">
							<option value="${vet.id}">${vet.nombre}</option>
						</c:forEach>
					</form:select>
				</div>
				<div id="showOrHidegroom">
          			<form:select class="form-select" id="groom" path="assigned">
          				<option selected disabled>Open this to select</option>
        				<c:forEach items="${groomers}" var="groom">
        					<option value="${groom.id}">${groom.nombre}</option>
        	   			</c:forEach>
        			</form:select>
       			</div>
				<div class="validate"></div>
            </div>
            <div class="col-md-4 form-group">
            	<form:label class="form-label" path="pet">Select your pet:</form:label>
            	<form:select class="form-select" path="pet">
            		<option selected disabled>Open this to select</option>
        			<c:forEach items="${pets}" var="pet">
        				<option value="${pet.id}">${pet.name}</option>
        	   		</c:forEach>
        		</form:select>
				<div class="validate"></div>
            </div>
            <div class="col-md-4 form-group">
            	<form:label class="form-label" path="service">Select a service:</form:label>
            	<form:select class="form-select" path="service">
            		<option selected disabled>Open this to select</option>
        			<option value="vaccines">Vaccine</option>
        			<option value="Dental Care">Dental Care</option>
        			<option value="Grooming">Grooming</option>
        			<option value="Surgery">Surgery</option>
        		</form:select>
				<div class="validate"></div>
            </div>
            <div class="col-md-4 form-group">
              	<form:hidden path="owner" value="${currentUser.id}"/>
        		<form:hidden path="status" value="true"/>
            </div>
          </div>
          <div ><button type="submit">Make an Appointment</button></div>
        </form:form>
        </div>
      </div>
    </section>
   
</body>
</html>