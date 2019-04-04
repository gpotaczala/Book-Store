<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dodaj książkę</title>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>
	<a href="books">Powrót do listy książek</a>
	<br />
	<br />
	<h3>Wprowadzanie nowej książki</h3>
	<form:form method="POST" modelAttribute="book">
		<table border="0">
			<tbody>
				<tr>
					<spring:bind path="title">
						<td><form:label path="title">Tytuł:</form:label></td>
						<td><form:input path="title" /></td>
						<td><form:errors path="title" cssClass="error" /></td>
					</spring:bind>
				</tr>
				<tr>
					<td>Liczba stron:</td>
					<td><form:input path="numberOfPages" /></td>
				</tr>
				<tr>
					<spring:bind path="releaseDate">
						<td>Data wydania:</td>
						<td><form:input type="date" path="releaseDate"  placeholder="yyyy-MM-dd" /></td>
						<td><form:errors path="releaseDate" cssClass="error" /></td>	
					</spring:bind>					
				</tr>
				<tr>
					<spring:bind path="author">
						<td><form:label path="author">Autor:</form:label></td>
						<td><form:select path="author.id">
							<form:option value="-1" label="--wybierz autora--" />
							<form:options items="${authors}" itemValue="id"	itemLabel="surname" />
						</form:select></td>
						<td><form:errors path="author" cssClass="error" /></td>						
					</spring:bind>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"
						value="Dodaj!" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>