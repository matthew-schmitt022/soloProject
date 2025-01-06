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
<title>Edit ${course.courseName}</title>
</head>
<body>

	<div class="main">
		<section class="signup">
			<div class="container">
				<div class="d-flex justify-content-end">
					<a href="/dashboard" class="nav-link mb-3">Home</a>|
					<a href="/courses/${course.id}" class="nav-link mb-3">Course</a>
				</div>
				<div class="signup-content">
					<div class="signup-form mx-auto">
						<h1 class="form-title">Edit ${course.courseName}!</h1>
						<form:form action="/courses/${course.id}/update" modelAttribute="course" method="POST" class="mt-4 p-3">
							<input type="hidden" name="_method" value="PUT" />
							<div>
								<form:errors path="*" class="text-danger"/>
							</div>
							<div class="form-group">
								<form:label path="courseName"></form:label>
								<form:input  path="courseName" />
							</div>
							<div class="form-group">
								<form:label path="address"></form:label>
								<form:input path="address" />
							</div>
							<div class="form-group">
								<form:label path="par"></form:label>
								<form:input path="par" />
							</div>
							<div class="form-group">
								<form:label path="eventDate" ></form:label>
								<form:input path="eventDate" type="Date" class="form-control" />
							</div>
							<div class="form-row">
								<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
							</div>
							<div class="form-group form-button">
								<input type="submit" value="Update Course" class="form-submit" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>

