<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Informacje o autorze</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand">Informacje
						o autorze: <b>${author.getSurnameName()}</b>
				</span></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a href="<c:url value = "/authors"/>"
					class="btn btn-nav btn-outline-success">Powrót do listy autorów</a></li>
			</ul>
		</div>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<label class="col-sm-2">Nazwisko:</label>
			<div class="col-sm-10">${authorForm.getSurname()}</div>
		</div>
		<div class="row">
			<label class="col-sm-2">Imię:</label>
			<div class="col-sm-10">${authorForm.getName()}</div>
		</div>
	</div>
	<br>
	<div class="container">
		<span><b>Książki autora</b></span>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Lp</th>
					<th>Tytuł</th>
					<th>Data wydania</th>
					<th>Liczba stron</th>
				</tr>
			<tbody>
				<c:forEach items="${booksForm}" var="book" varStatus="status">
					<tr>
						<td>${status.index}</td>
						<td>${book.title}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${book.releaseDate}" /></td>
						<td>${book.numberOfPages}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>