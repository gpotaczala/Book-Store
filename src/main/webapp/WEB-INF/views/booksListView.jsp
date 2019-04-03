<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista książek</title>
	</head>
	<body>
		<a href="append">Dodaj książkę</a><br />
		<table border="1">
			<thead>
				<tr>
					<th>#</th>
					<th>Tytuł</th>
					<th>Autor</th>	
					<th>Liczba stron</th>			
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="status">
				<tr>
					<td>${status.index}</td>
					<td><a href="<c:url value="book-${book.id}" />">${book.title}</a></td>
					<td>${book.author.getSurname()} ${book.author.getName()}</td>		
					<td>${book.numberOfPages}</td>	
				</tr>
				</c:forEach>			
			</tbody>
		</table>
		<br />
		<hr />
	</body>
</html>