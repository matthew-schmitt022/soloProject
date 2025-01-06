<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css">
<title>${course.courseName}</title>
</head>
<body>

	<div class="main">
		<div class="container-fluid">
			<div class=" mx-auto mt-4">
				<header class=" header-b row justify-content-between align-items-center p-4">
					<div class="text-start">
						<h3>${course.courseName} Course List</h3>
					</div>
					<div class=" d-flex justify-content-end ">
						<a href="/dashboard" class="nav-link image-link">Home</a>|
						<c:if test="${course.user.id == user.id}">
							<a href="/courses/${course.id}/edit" class="nav-link  danger">Edit Course</a>|
						</c:if>
						<c:if test="${course.user.id == user.id}">
							<a href="/courses/${course.id}/delete" class="nav-link  danger">Delete Course</a>|
						</c:if>
						<a href="/logout" class="nav-link mb-3 danger">Logout</a>
					</div>
				</header>
				<hr>
				<div class=" d-flex justify-content-between m-4">
					<main class="col-5 px-4 py-4 box">
							
							<h5>Course Name: ${course.courseName}</h5>
							<p>Par: ${course.par}</p>
							<p>Address: ${course.address}</p>
							<p>Date Played: ${course.eventDate}</p>
	
					</main>
				
								
				</div>	
			</div>
		</div>
	</div>

</body>
</html>