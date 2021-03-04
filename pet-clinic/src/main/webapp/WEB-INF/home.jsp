<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Pet Clinic</title>

</head>
<body>
	<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
	</div>
	<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html">Pet Clinic</a></h1>
       <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#doctors">Doctors</a></li>
          <li class="drop-down"><a >Services</a>
            <ul>
       
              <li class="drop-down"><a href="#">Veterinary</a>
                <ul>
                  <li><a href="#">Vaccine</a></li>
                  <li><a href="#">Dental Check</a></li>
                  <li><a href="#">Surgery</a></li>
                </ul>
              </li>
               <li class="drop-down"><a href="#">Grooming</a>
                <ul>
                  <li><a href="#">Cats</a></li>
                  <li><a href="#">Dogs</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li>
               <c:if test="${errorMessage != null}">
        		<c:out value="${errorMessage}"></c:out>
   				 </c:if>
              <security:authorize access="isAuthenticated()">
        		<li><a>Welcome: <c:out value="${currentUser.username}"></c:out></a></li>
        		<li>
            <form id="logoutForm"  method="POST" action="/logout">
        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		<input type="submit" class="btn btn-link" value="Logout!" />
    		</form>
         
         </li> 
    		</security:authorize> 
        </ul>
            
      </nav>

      <a href="#appointment" class="appointment-btn scrollto">Make an Appointment</a>
      
    </div>
  </header>
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1>Welcome to Pet Clinic</h1>
      <h2>We  Care For Dogs & Cats</h2>
      <a href="#about" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section>
</body>
</html>