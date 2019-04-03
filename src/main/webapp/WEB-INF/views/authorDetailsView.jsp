<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Informacje o autorze</title>
</head>
<body>
	<a href="authors">Powrót do listy autorów</a>
	<br />
	<table border="1">
		<tbody>
			<tr>
				<th>Nazwisko</th>
				<td>${author.getSurname()}</td>
			</tr>
			<tr>
				<th>Imię</th>
				<td>${author.getName()}</td>
		</tbody>
	</table>
	<br>
	<table border="1">
		<thead>
			<tr>Książki autora</tr>
			<tr>
				<th>Tytuł</th>
				<th>Liczba stron</th>
			</tr>
		<tbody>
			<c:forEach items="${books}" var="book" varStatus="status">
				<tr>
					<td>${book.title}</td>
					<td>${book.numberOfPages}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>