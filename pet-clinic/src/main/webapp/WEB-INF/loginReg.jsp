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
<title>Login</title>
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
		<div class=" spacetop">
			<div  class="d-flex justify-content-evenly">
				<div class="section-title">
					<h2>SignUp Here</h2>
					<p></p>
				</div>
				<div class="section-title">
					<h2>Login Here</h2>
					<p></p>
				</div>
			</div>
			<div  class="d-flex justify-content-evenly">
				<div>
					<form:form class="php-email-form" action="/registration"
						method="POST" modelAttribute="user">
							<div class="form-row">
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="nombre">Name</form:label>
								<form:input class="form-control" id="name" path="nombre" />
								
								<p><form:errors style="color:red" path="nombre" /></p>
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="email">Email</form:label>
								<form:input class="form-control" id="name" path="email" />
							
								<p><form:errors style="color:red" path="email" /></p>
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="phone">Phone</form:label>
								<form:input class="form-control" id="name" path="phone" />
						
								<p><form:errors style="color:red" path="phone" /></p>
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="username">User Name</form:label>
								<form:input class="form-control" id="name" path="username" />
					
								<p><form:errors style="color:red" path="username" /></p>
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="password">Password</form:label>
								<form:input type="password" class="form-control" id="name" path="password" />
						
								<p><form:errors style="color:red" path="password" /></p>
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<form:label class="form-label" path="passwordConfirmation">Confirm Password</form:label>
								<form:input type="password" class="form-control" id="name"
									path="passwordConfirmation" />
								<div class="validate"></div>
							</div>
						</div>
						<div class="">
							<button type="submit">Register</button>
						</div>
					</form:form>
				</div>
				<div >
					<form action="/login" method="post" class="php-email-form">
						<c:if test="${logoutMessage != null}">
							<c:out value="${logoutMessage}"></c:out>
						</c:if>
	
						<c:if test="${errorMessage != null}">
							<c:out value="${errorMessage}"></c:out>
						</c:if>
						<div class="form-row">
							<div class="col-md-12 form-group">
								<label for="username" class="form-label">User Name</label> <input
									type="text" class="form-control" id="name" name="username" />
								<div class="validate"></div>
							</div>
							<div class="col-md-12 form-group">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="name" name="password" />
								<div class="validate"></div>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="">
							<button type="submit">LogIn</button>
						</div>
					</form>
				</div>
			</div>
	</section>

</body>
</html>