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
			<h1 class="logo mr-auto"><a href="/home">Pet Clinic</a></h1>
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="/home">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
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
					<li><a href="/login">SignUp/Login</a></li>
					<security:authorize access="isAuthenticated()">
	        			<li><a>Welcome: <c:out value="${currentUser.username}"></c:out></a></li>
	        			<li>
				            <form id="logoutForm"  method="POST" action="/logout">
				        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        		<input type="submit" class="btn btn-link" value="Logout!" />
				    		</form>
	         
	         			</li> 
    				</security:authorize> 
    			</nav>

      <a href="/add/appointment" class="appointment-btn scrollto">Make an Appointment</a>
    </div>
  </header>
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1>Welcome to Pet Clinic</h1>
      <h2>We  Care For Dogs & Cats</h2>
      <a href="#about" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section>
  <section id="about" class="about">
      <div class="container-fluid">

        <div class="row">
          <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch">
          <a href="#" class=" mb-4" ></a>
          </div>

          <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
            <h3>Enim quis est voluptatibus aliquid consequatur fugiat</h3>
            <p>Esse voluptas cumque vel exercitationem. Reiciendis est hic accusamus. Non ipsam et sed minima temporibus laudantium. Soluta voluptate sed facere corporis dolores excepturi. Libero laboriosam sint et id nulla tenetur. Suscipit aut voluptate.</p>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-fingerprint"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-gift"></i></div>
              <h4 class="title"><a href="">Nemo Enim</a></h4>
              <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-atom"></i></div>
              <h4 class="title"><a href="">Dine Pad</a></h4>
              <p class="description">Explicabo est voluptatum asperiores consequatur magnam. Et veritatis odit. Sunt aut deserunt minus aut eligendi omnis</p>
            </div>

          </div>
        </div>

      </div>
    </section>
</body>
</html>