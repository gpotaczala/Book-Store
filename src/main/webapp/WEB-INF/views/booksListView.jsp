<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista książek</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand">Lista
						książek w magazynie</span></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a href="book-append"
					class="btn btn-nav btn-success">Dodaj książkę</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th align="right">#</th>
					<th align="left">Tytuł</th>
					<th align="left">Autor</th>
					<th align="center">Data wydania</th>
					<th align="right">Liczba stron</th>
					<th align="center">Akcja</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="status">
					<tr>
						<td>${status.index}</td>
						<td>${book.title}</td>
						<td>${book.author.getSurnameName()}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${book.releaseDate}" /></td>
						<td>${book.numberOfPages}</td>
						<td>
							<spring:url value="book/${book.id}" var="detailsUrl" /> 
							<spring:url value="book-${book.id}/delete" var="deleteUrl" /> 
							<spring:url value="book-${book.id}/update" var="updateUrl" />

							<button class="btn btn-outline-info btn-sm" onclick="location.href='${detailsUrl}'"> Info </button>
							<button class="btn btn-outline-primary btn-sm" onclick="location.href='${updateUrl}'">Zmień</button>
							<button class="btn btn-outline-danger btn-sm" onclick="this.disabled=true;post('${deleteUrl}')">Usuń</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>