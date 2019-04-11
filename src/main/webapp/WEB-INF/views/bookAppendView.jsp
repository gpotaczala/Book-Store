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
</head>
<body>
	<div class="command_line">
		<table>
			<tr>
				<td width="300"><h3>
						<a href="books">Powrót do listy książek</a>
					</h3></td>
			</tr>
		</table>
	</div>
	<div class="form_header">
		<p>Wprowadzanie nowej książki</p>
	</div>
	<div class="form_view">
		<form:form method="POST" modelAttribute="book">
			<table class="main_page table">
				<tbody>
					<tr>
						<spring:bind path="title">
							<td><form:label path="title">Tytuł:</form:label></td>
							<td><form:input path="title" /></td>
							<td><form:errors path="title" cssClass="line_error" /></td>
						</spring:bind>
					</tr>
					<tr>
						<td>Liczba stron:</td>
						<td><form:input path="numberOfPages" /></td>
					</tr>
					<tr>
						<spring:bind path="releaseDate">
							<td>Data wydania:</td>
							<td><form:input type="date" path="releaseDate"
									placeholder="rrrr-mm-dd" /></td>
							<td><form:errors path="releaseDate" cssClass="line_error" /></td>
						</spring:bind>
					</tr>
					<tr>
						<spring:bind path="author">
							<td><form:label path="author">Autor:</form:label></td>
							<td><form:select path="author.id">
									<form:option value="-1" label="--wybierz autora--" />
									<form:options items="${authors}" itemValue="id" itemLabel="surnameName" />
								</form:select></td>
							<td><form:errors path="author" cssClass="line_error" /></td>
						</spring:bind>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit"
							value="Dodaj!" /></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
</body>
</html>