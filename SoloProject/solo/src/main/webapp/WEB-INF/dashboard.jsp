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
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>${user.name}'s Dashboard</title>
</head>
<body>

	<div class="main">
		<div class="container-fluid">
			<div class="  mx-auto mt-4">
				<header class="header-b row justify-content-between align-items-center p-3">
					<div class="text-start">
						<h4>Hello, ${user.name}!</h4>
					</div>
					<div class="col-5 text-start">
						<p>Here's a list of your saved courses!</p>
					</div>
					<div class="col-5 d-flex justify-content-end">
						<a href="/courses/new" class="nav-link image-link">Add Course</a> |
						<a href="/logout" class="nav-link danger">Logout</a>
					</div>
				</header><hr>
			</div>
			<div class="container row mx-auto mt-3 p-4">
				<table class="table table-striped table-bordered caption-top ">
					<thead class="table-info">
						<tr class="align-middle">
							<th>Course Name</th>
							<th>Date Played</th>
							<th>Address</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="course" items="${courses}">
							<tr>
								<td><a href="/courses/${course.id}" class="nav-link"><c:out value="${course.courseName}"/></a></td>
								<td><fmt:formatDate value="${course.eventDate}" pattern="MMMM dd-yyyy"/>						
								<td><c:out value="${course.address}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>