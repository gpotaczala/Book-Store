<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Szczegóły książki</title>
</head>
<body>

	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand">Szczegóły
						książki: <b>${book.title}</b>
				</span></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a href="<c:url value = "/books"/>" class="btn btn-nav btn-outline-success">Powrót do listy książek</a></li>
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
			
		<div class="row">
			<label class="col-sm-2">Tytuł:</label>
			<div class="col-sm-10">${book.title}</div>
		</div>
		<div class="row">
			<label class="col-sm-2">Autor:</label>
			<div class="col-sm-10">${book.author.getSurnameName()}</div>
		</div>
		<div class="row">
			<label class="col-sm-2">Liczba stron:</label>
			<div class="col-sm-10">${book.numberOfPages}</div>
		</div>
		<div class="row">
			<label class="col-sm-2">Data wydania:</label>
			<div class="col-sm-10">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${book.releaseDate}" />
			</div>
		</div>
	</div>
</body>
</html>