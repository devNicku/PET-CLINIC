<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li><a href="#about">About</a></li>
					<li><a href="#services">Services</a></li>
					<li><a href="#departments">Departments</a></li>
					<li><a href="#contact">Contact</a></li>
					<li><a href="/login">SignUp/Login</a></li>
				</ul>
			</nav>
			<a href="/appointment" class="appointment-btn scrollto">Make an
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
</body>
</html>