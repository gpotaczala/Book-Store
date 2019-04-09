<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista książek</title>
</head>
<body>
	<div class="command_line">
		<table>
			<tr>
				<td width="150"><h3><a href="index">Strona główna</a></h3></td>
				<td width="150"><h3><a href="book-append">Dodaj książkę</a></h3></td>
			</tr>
		</table>
	</div>
	<div class="data_view">
		<table>
			<thead>
				<tr>
					<th align="right">Lp</th>
					<th align="left">Tytuł</th>
					<th align="left">Autor</th>
					<th align="center">Data wydania</th>
					<th align="right">Liczba stron</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="status">
					<tr>
						<td align="right">${status.index}</td>
						<td align="left"><a href="<c:url value="book-${book.id}" />">${book.title}</a></td>
						<td>${book.author.getSurname()}${book.author.getName()}</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
								value="${book.releaseDate}" /></td>
						<td align="right">${book.numberOfPages}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>