<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista autorów</title>
</head>
<div class="command_line">
	<body>
		<table>
			<tr>
				<td width="150"><h3><a href="index">Strona główna</a></h3></td>
				<td width="150"><h3><a href="author-append">Dodaj autora</a></h3></td>
			</tr>
		</table>
</div>
<div class="data_view">
	<table>
		<thead>
			<tr>
				<th width="50">#</th>
				<th width="150">Nazwisko</th>
				<th width="150">Imię</th>
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