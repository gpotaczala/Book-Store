<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista autorów</title>
	</head>
	<body>
		<table border="0">
			<tr>
				<td width="100"><a href="index">Strona główna</a></td>				
				<td width="100"><a href="author-append">Dodaj autora</a></td>			
			</tr>
		</table>			
		<table border="1">
			<thead>
				<tr>
					<th>#</th>
					<th>Nazwisko</th>
					<th>Imię</th>			
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${authors}" var="author" varStatus="status">
				<tr>
					<td><a href="<c:url value="author-${author.id}" />">${status.index}</a></td>
					<td>${author.getSurname()}</td>		
					<td>${author.getName()}</td>	
				</tr>
				</c:forEach>			
			</tbody>
		</table>
		<br />
		<hr />
	</body>
</html>