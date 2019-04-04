<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dodaj autora</title>
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
	<a href="authors">Powrót do listy autorów</a>
	<br />
	<h3>Wprowadzanie nowego autora</h3>
	<form:form method="POST" modelAttribute="author">
	<form:errors path="*" cssClass="errorblock" element="div" />
		<table border="0">
			<tbody>
				<tr>
					<td><form:label path="surname"> Nazwisko: </form:label></td>
					<td><form:input path="surname" /></td>
					<td><form:errors path="surname" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:label path="name"> Imię: </form:label></td>
					<td><form:input path="name" /></td>
					<td><form:errors path="name" cssClass="error" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="Dodaj" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>
