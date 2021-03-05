<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"
          prefix="fmt" %>
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
<title>Add pet</title>
</head>
<body>
	<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
	</div>
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">
			<h1 class="logo mr-auto">
				<a href="/home">Pet Clinic</a>
			</h1>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="/home">Home</a></li>
					<li><a href="/home/#about">About</a></li>
					<li><a href="/home/#services">Services</a></li>
					<li><a href="/home/#contact">Contact</a></li>
					<li><a href="/add/pet/#my-pet">My Pets</a></li>
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
			<a href="/add/appointment" class="appointment-btn scrollto">Make an
				Appointment</a>
		</div>
	</header>
	<section id="appointment" class="appointment section-bg ">
		<div class="spacetop">
			<div  class="d-flex justify-content-evenly">
				<div class="section-title">
					<h2>Add your pet</h2>
					<p></p>
				</div>
			</div>
			<div  class="d-flex justify-content-evenly">
				<div>
				<form:form class="php-email-form" action="/add/pet" method="POST"  modelAttribute="petModel">
							<div class="form-row">
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="name">Name</form:label>
								<form:input class="form-control" id="name" path="name" />
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="age">Age</form:label>
								<form:input class="form-control" type="number" path="age" />
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="sex">Sex</form:label>
								<form:input class="form-control" id="name" path="sex" />
								<div class="validate"></div>
							</div>
							<p>
            					<form:hidden path="owner" value="${currentUser.id}"/>
        					</p>
						</div>
						<div class="col-md-12 form-group">
							<form:label class="form-label" path="specie">Specie</form:label>
							<form:select path="specie" class="form-select">
		  						<form:option value="NONE">Select pet</form:option>
		 						 <c:forEach items="${species}" var="specie">
		  						<form:option value="${specie.id}">${specie.specieName}</form:option>
		  						</c:forEach>
							</form:select>	
						</div>
						<br/>
						<div class="d-flex justify-content-center">
							<button type="submit">Register</button>
						</div>
				</form:form>	
				</div>
			</div>
	</section>
	<section id="my-pet" class="services">
      <div class="container">
      	<div class="section-title">
          <h2>Upcoming</h2>
          <p>Keep track of your pet Info</p>
        </div>
      	<div class="container d-flex align-items-center">
    		<div class="table-responsive">
      			<table class="table table-condensed table-bordered">
        			<thead>
			          <tr>
			            <th>Pet Name</th>
			            <th>Pet Type</th>
			            <th>Pet Age</th>
			            <th>Visit Date</th>
			            <th>Hour</th>
			            <th>Service</th>
			            <th>Veterinarian/Groomer</th>
			            <th></th>
			          </tr>
			        </thead>
        			<tbody>
			          <!-- Single event in a single day -->
			          <c:forEach items="${nextAppointments}" var="appointment">
			          <tr>
			           <td>${appointment.pet.name} </td>
			           <td>${appointment.pet.specie.specieName} </td>
			           <td>${appointment.pet.age} </td>
			            <c:set var="today" value="${appointment.dateTime}" />
			            <td><fmt:formatDate type="both"  value="${today}"  pattern="d-MMMM-yyyy"/></td>
			              <c:set var="time" value="${appointment.time}" />
			            <td><fmt:formatDate type="both"  value="${time}"  pattern="hh:mm a"/></td>
			            <td>${appointment.service}</td>        
			            <td>${appointment.assigned.nombre}</td>
			            <td><button type="submit">Update Date</button></td>
			            </c:forEach>
			          </tr>
			         </tbody>
      			</table>
   			</div>
 		</div>
	</div>
	</section><!-- End Services Section -->
	<section id="my-pet" class="services">
      <div class="container">
      	<div class="section-title">
          <h2>My Pet</h2>
          <p>Past Appointments</p>
        </div>
      	<div class="container d-flex align-items-center">
    		<div class="table-responsive">
      			<table class="table table-condensed table-bordered">
        			<thead>
			          <tr>
			            <th>Pet Name</th>
			            <th>Pet Type</th>
			            <th>Pet Age</th>
			            <th>Visit Date</th>
			            <th>Hour</th>
			            <th>Service</th>
			            <th>Veterinarian/Groomer</th>
			         
			          </tr>
			        </thead>
        			<tbody>
			          <!-- Single event in a single day -->
			          <c:forEach items="${pastAppointment}" var="appointment">
			          <tr>
			           <td>${appointment.pet.name} </td>
			           <td>${appointment.pet.specie.specieName} </td>
			           <td>${appointment.pet.age} </td>
			            <c:set var="today" value="${appointment.dateTime}" />
			            <td><fmt:formatDate type="both"  value="${today}"  pattern="d-MMMM-yyyy"/></td>
			              <c:set var="time" value="${appointment.time}" />
			            <td><fmt:formatDate type="both"  value="${time}"  pattern="hh:mm a"/></td>
			            <td>${appointment.service}</td>        
			            <td>${appointment.assigned.nombre}</td>
			            </c:forEach>
			          </tr>
			         </tbody>
      			</table>
   			</div>
 		</div>
	</div>
	</section><!-- End Services Section -->
</body>
</html>