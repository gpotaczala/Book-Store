<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Dodaj książkę</title>
	</head>
	<body>
	<a href="lista">Powrót do listy książek</a><br />
		<form method="post">
			<table border="1">
				<tbody>
					<tr>
						<th>Tytuł</th>
						<td><input type="text" name="title" /></td> 
					</tr>
					<tr>
						<th>Autor</th>
						<td><input type="text" name="author" /></td> 
					</tr>
					<tr>
						<th>Liczba stron</th>
						<td><input type="text" name="numberOfPages" /></td> 
					</tr>
					<tr></tr>				
					<tr>
						<td colspan="2" align="right"><input type="submit" value="Dodaj!" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>