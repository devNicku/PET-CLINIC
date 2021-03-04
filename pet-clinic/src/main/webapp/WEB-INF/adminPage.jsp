<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
          <li><a>Welcome: <c:out value="${currentUser.username}"></c:out> </a></li>
          <li>
         <form id="logoutForm"  method="POST" action="/logout">
        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		<input type="submit" class="btn btn-link" value="Logout!" />
    		</form>
         
         </li>
        </ul>
            
      </nav>
      
    </div>
  </header>
  <section  id="heroagenda" class="d-flex align-items-center" >

   <div class="agenda">
    <div class="table-responsive">
      <table class="table table-condensed table-bordered">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Event</th>
          </tr>
        </thead>
        <tbody>
          <!-- Single event in a single day -->
          <tr>
           <c:forEach items="${appointments}" var="appointment">
            <td class="agenda-date" class="active" rowspan="1">
            <c:set var="today" value="${appointment.dateTime}" />
              <div class="dayofmonth"><fmt:formatDate type="both"  value="${today}"  pattern="d"/></div>
              <div class="dayofweek"> <fmt:formatDate type="both"  value="${today}"  pattern="EEEE"/></div>
              <div class="shortdate text-muted"><fmt:formatDate type="both"  value="${today}"  pattern="MMMM,yyyy"/></div>
            </td>
            <td class="agenda-time">
              5:30 AM
            </td>
            <td class="agenda-events">
              <div class="agenda-event">
                <i class="glyphicon glyphicon-repeat text-muted" title="Repeating event"></i> 
                Fishing
              </div>
            </td>
          </tr>
   		 </c:forEach>
          <!-- Multiple events in a single day (note the rowspan) -->
          <tr>
            <td class="agenda-date" class="active" rowspan="3">
              <div class="dayofmonth">4</div>
              <div class="dayofweek">Thursday</div>
              <div class="shortdate text-muted">July, 2014</div>
            </td>
            <td class="agenda-time">
              8:00 - 9:00 AM
            </td>
            <td class="agenda-events">
              <div class="agenda-event">
                Doctor's Appointment
              </div>
            </td>
          </tr>
          <tr>
            <td class="agenda-time">
              10:15 AM - 12:00 PM
            </td>
            <td class="agenda-events">
              <div class="agenda-event">
                Meeting with executives
              </div>
            </td>
          </tr>
          <tr>
            <td class="agenda-time">
              7:00 - 9:00 PM
            </td>
            <td class="agenda-events">
              <div class="agenda-event">
                Aria's dance recital
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  </section>
  
  
  
  
</body>
</html>