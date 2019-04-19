<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Dodaj autora</title>
</head>
<body>
	<%!String vTitle, vButtonCaption;%>

	<c:choose>
		<c:when test="${empty authorForm.surname}">
			<%
				vTitle = "Wprowadzanie danych nowego autora";
						vButtonCaption = "Dodaj";
			%>
		</c:when>
		<c:otherwise>
			<%
				vTitle = "Edycja danych autora";
						vButtonCaption = "Zapisz";
			%>
		</c:otherwise>
	</c:choose>

	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand"><%=vTitle%></span></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="container">
		<spring:url value="/authors" var="authorActionUrl" />

		<form:form method="POST" modelAttribute="authorForm"
			action="${authorActionUrl}">
			<form:hidden path="id" />

			<div class="form-row">
				<spring:bind path="surname">
					<div class="form-group col-sm-6">
						<form:label path="surname" class="control-label">Nazwisko:</form:label>
						<div>
							<c:if test="${pageContext.request.method!='POST'}">
								<form:input path="surname" class="form-control"
									placeholder="Wprowadź nazwisko" />
							</c:if>
							<c:if test="${pageContext.request.method=='POST'}">
								<form:input path="surname"
									class="form-control ${status.error ? 'is-invalid':'is-valid' }"
									placeholder="Wprowadź nazwisko" />
								<div class="valid-feedback">${status.error ? '':'Jest ok!' }</div>
								<form:errors path="surname" class="invalid-feedback" />
							</c:if>
						</div>
					</div>
				</spring:bind>
				<spring:bind path="name">
					<div class="form-group col-sm-6">
						<form:label path="name" class="control-label">Imię:</form:label>
						<div>
							<c:if test="${pageContext.request.method!='POST'}">
								<form:input path="name" class="form-control"
									placeholder="Wprowadź imię" />
							</c:if>
							<c:if test="${pageContext.request.method=='POST'}">
								<form:input path="name"
									class="form-control ${status.error ? 'is-invalid':'is-valid'}"
									placeholder="Wprowadź imię" />
								<div class="valid-feedback">${status.error ? '':':)'}</div>
								<form:errors path="name" class="invalid-feedback" />
							</c:if>
						</div>
					</div>
				</spring:bind>
			</div>
			<a href="${authorActionUrl}" class="btn btn-info">Anuluj</a>
			<button type="submit" class="btn btn-primary"><%=vButtonCaption%></button>
		</form:form>
	</div>
</body>
</html>
