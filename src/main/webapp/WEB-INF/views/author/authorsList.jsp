<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista autorów</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand">Autorzy
						książek</span></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a href="<c:url value="authors/add"/>"
					class="btn btn-nav btn-success">Dodaj autora</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="container">
		<c:if test="${not empty msg}">
			<div class="alert alert-${alertType} alert-dismissible fade show"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msgHead}</strong> ${msg}
			</div>
		</c:if>
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Nazwisko</th>
					<th>Imię</th>
					<th></th>
					<th>Akcja</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${authors}" var="author" varStatus="status">
					<tr>
						<td>${status.index}</td>
						<td>${author.getSurname()}</td>
						<td>${author.getName()}</td>
						<spring:url value="authors/${author.id}" var="detailsUrl" />
						<spring:url value="authors/${author.id}/delete" var="deleteUrl" />
						<spring:url value="authors/${author.id}/update" var="updateUrl" />
						<td width="10"><button class="btn btn-outline-info btn-sm" onclick="location.href='${detailsUrl}'">Info</button></td>
						<td width="10"><button class="btn btn-outline-primary btn-sm" onclick="location.href='${updateUrl}'">Zmień</button></td>
						<td width="10"><form action="${deleteUrl}" method="post"> <button type="submit" class="btn btn-outline-danger btn-sm">Usuń</button></form></td>
						<!-- <button class="btn btn-outline-danger" onclick="post('${deleteUrl}')">Usuń</button></td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>