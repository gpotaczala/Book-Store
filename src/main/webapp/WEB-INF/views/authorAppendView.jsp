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
	<div class="container col-sm-5">
		<h2>Dane autora</h2>
		<form:form method="POST" modelAttribute="author">
			<div class="form-group row">
				<form:label path="surname" class="control-label col-2">Nazwisko:</form:label>
				<div class="col-sm-5">
					<form:input path="surname" class="form-control" />
					<small><form:errors path="surname" /></small>
				</div>
			</div>
			<div class="form-group row">
				<form:label path="name" class="control-label col-2">Imię:</form:label>
				<div class="col-sm-5">
					<form:input path="name" class="form-control" />
					<small><form:errors path="name" /></small>
				</div>
			</div>
			<a href="authors" class="btn btn-info">Anuluj</a>
			<button type="submit" class="btn btn-primary">Dodaj</button>
		</form:form>
	</div>
</body>
</html>
