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
<title>Add a Course</title>
</head>
<body>

		<div class="main">
			<section class="signup">
				<div class="container">
					<div class="text-end">
						<a href="/dashboard" class="nav-link mb-3">Home</a>
					</div>
					<div class="signup-content">				
						<div class="signup-form mx-auto">
							<h2 class="form-title">Add Course</h2>
							<form:form  action="/courses/create" modelAttribute="courses" method="POST" class="mt-4 p-3 register-form">
								<div>
									<form:errors path="*" class="text-danger"/>
								</div>
								<div class="form-group">
									<form:label path="courseName" ></form:label>
									<form:input path="courseName" placeholder="Course Name" />
								</div>
								<div class="form-group">
									<form:label path="address" ></form:label>
									<form:input path="address" placeholder="Address" />
								</div>
								<div class="form-group">
									<form:label path="par" ></form:label>
									<form:input path="par" placeholder="Par" />
								</div>
								<div class="form-group">
									<form:label path="eventDate" ></form:label>
									<form:input path="eventDate" type="Date" />
								</div>
								<div class="form-row">
									<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
								</div>
								<div class="form-group form-button">
									<input type="submit" name="signin" id="signin" class="form-submit" value="Submit" />
								</div>
							</form:form>		
						</div>
					</div>
				</div>
			</section>
		</div>

</body>
</html>