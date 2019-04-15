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
				<li class="nav-item"><a href="author-append"
					class="btn btn-nav btn-outline-success">Dodaj autora</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Nazwisko</th>
					<th>Imię</th>
					<th align="center">Akcja</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${authors}" var="author" varStatus="status">
					<tr>
						<td>${status.index}</td>
						<td>${author.getSurname()}</td>
						<td>${author.getName()}</td>
						<td>
							<spring:url value="author-${author.id}" var="detailsUrl" />
							<spring:url value="author-${author.id}/delete" var="deleteUrl" /> 
							<spring:url value="author-${author.id}/update" var="updateUrl" />

							<button class="btn btn-outline-info"
								onclick="location.href='${detailsUrl}'">Info</button>
							<button class="btn btn-outline-primary"
								onclick="location.href='${updateUrl}'">Zmień</button>
							<button class="btn btn-outline-danger"
								onclick="this.disabled=true;post('${deleteUrl}')">Usuń</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>