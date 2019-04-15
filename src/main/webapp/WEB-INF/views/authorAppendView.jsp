<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Dodaj autora</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand">Dane
						autora</span></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="container">
		<form:form method="POST" modelAttribute="author">
			<div class="form-row">
				<div class="form-group col-sm-6">
					<form:label path="surname" class="control-label">Nazwisko:</form:label>
					<div>
						<form:input path="surname" class="form-control" />
						<small><form:errors path="surname" /></small>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<form:label path="name" class="control-label">Imię:</form:label>
					<div>
						<form:input path="name" class="form-control" />
						<small><form:errors path="name" /></small>
					</div>
				</div>
			</div>
			<a href="authors" class="btn btn-info">Anuluj</a>
			<button type="submit" class="btn btn-primary">Dodaj</button>
		</form:form>
	</div>
</body>
</html>
