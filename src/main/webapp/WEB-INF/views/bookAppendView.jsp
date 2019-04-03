<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Dodaj książkę</title>
	</head>
	<body>
	<a href="list">Powrót do listy książek</a><br />
	<br />
	<h3>Wprowadzanie nowej książki</h3>	
		<form:form method="POST" modelAttribute="book">
			<table border="0">
				<tbody>
					<tr>
						<td><form:label path="title">Tytuł:</form:label></td>
						<td><form:input path="title" /></td> 
					</tr>
					<tr>
						<td>Liczba stron:</td>
						<td><form:input path="numberOfPages"/></td> 
					</tr>	
					<tr>
						<td>Data wydania:</td>
						<td><input type="date" name="releaseDate" value="2010-01-01"/></td> 
					</tr>											
					<tr>
						<td><form:label path="author">Autor:</form:label></td>
						<td>
							<form:select path="author.id">
								<form:option value="-1" label="--wybierz autora--" />
								<form:options items="${authors}" itemValue="id" itemLabel="surname" />
							</form:select>
						</td> 
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit" value="Dodaj!" /></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</body>
</html>