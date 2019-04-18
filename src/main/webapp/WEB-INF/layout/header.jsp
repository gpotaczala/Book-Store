<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="navbar-brand" href="<c:url value = "/index"/>">
						<img src="<c:url value="/resources/images/book_store.png" />" alt="Logo" style="width: 80px;">
						<!-- <img src="${pageContext.request.contextPath}/resources/images/book_store.png" alt="Logo" style="width: 80px;"> -->
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="<c:url value = "/index"/>">Strona
						główna</a></li>
				<li class="nav-item active"><a class="nav-link " href="<c:url value = "/books"/>">Lista
						książek</a></li>
				<li class="nav-item active"><a class="nav-link" href="<c:url value = "/authors"/>">Lista
						autorów</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Pomoc</a></li>
			</ul>
		</div>
		</nav>
	</div>
</body>