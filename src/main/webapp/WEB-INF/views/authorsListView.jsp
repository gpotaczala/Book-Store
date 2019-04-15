<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista autorów</title>
</head>
<body>
	<div class="container col-sm-6" align="center">
		<h2>Lista autorów książek</h2>
	</div>
	<div class="container col-sm-6" align="right">
		<a href="author-append" class="btn btn-info">Dodaj autora</a>
	</div>
	<div class="container col-sm-6">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Nazwisko</th>
					<th>Imię</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${authors}" var="author" varStatus="status">
					<tr>
						<td align="right"><a
							href="<c:url value="author-${author.id}" />">${status.index}</a></td>
						<td>${author.getSurname()}</td>
						<td>${author.getName()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>