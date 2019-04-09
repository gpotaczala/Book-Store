<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dodaj autora</title>
</head>
<body>
	<div class="command_line">
		<table>
			<tr>
				<td width="300"><h3>
						<a href="authors">Powrót do listy autorów</a>
					</h3></td>
			</tr>
		</table>
	</div>
	<div class="form_header">
		<p>Dane autora</p>
	</div>
	<div class="form_view">
		<form:form method="POST" modelAttribute="author">
			<form:errors path="*" cssClass="form_error_block" element="div" />
			<table class="main_page table">
				<tbody>
					<tr>
						<td><form:label path="surname"> Nazwisko: </form:label></td>
						<td><form:input path="surname" /></td>
						<td><form:errors path="surname" cssClass="line_error" /></td>
					</tr>
					<tr>
						<td><form:label path="name"> Imię: </form:label></td>
						<td><form:input path="name" /></td>
						<td><form:errors path="name" cssClass="line_error" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit"
							value="Dodaj" /></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
</body>
</html>
