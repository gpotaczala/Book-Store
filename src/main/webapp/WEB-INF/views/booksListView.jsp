<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista książek</title>
	</head>
	<body>		
		<table border="0">
			<tr>
				<td width="100"><a href="index">Strona główna</a></td>					
				<td width="100"><a href="book-append">Dodaj książkę</a></td>		
			</tr>
		</table>
		<table border="1">
			<thead>
				<tr>
					<th>#</th>
					<th>Tytuł</th>
					<th>Autor</th>	
					<th>Data wydania</th>						
					<th>Liczba stron</th>			
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="status">
				<tr>
					<td align="right" width="30">${status.index}</td>
					<td width="280"><a href="<c:url value="book-${book.id}" />">${book.title}</a></td>
					<td width="200">${book.author.getSurname()} ${book.author.getName()}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${book.releaseDate}" /></td>								
					<td align="right" width="100">${book.numberOfPages}</td>	
				</tr>
				</c:forEach>			
			</tbody>
		</table>
		<br />
		<hr />
	</body>
</html>