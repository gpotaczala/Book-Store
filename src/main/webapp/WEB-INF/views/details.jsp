<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Szczegóły książki</title>
	</head>
	<body>
		<a href="lista">Powrót do listy książek</a><br />
		<table border="1">
			<tbody>
				<tr>
					<th>Tytuł</th>
					<td>${book.title}</td>
				</tr>
				<tr>
					<th>Autor</th>
					<td>${book.author}</td>
				</tr>
				<tr>
					<th>Liczba stron</th>
					<td>${book.numberOfPages}</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>