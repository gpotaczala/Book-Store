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
	<%!String vTitle, vButtonCaption;%>

	<c:choose>
		<c:when test="${empty bookF.title}">
			<%
				vTitle = "Wprowadzanie danych nowej książki";
						vButtonCaption = "Dodaj";
			%>
		</c:when>
		<c:otherwise>
			<%
				vTitle = "Edycja danych książki";
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
	<div class="container" align="left">
		<spring:url value="/books" var="bookActionUrl" />	
	
		<form:form method="POST" modelAttribute="bookF" action="${bookActionUrl}">
			<form:hidden path="id" />
			
			<spring:bind path="title">
				<div class="form-group">
					<form:label path="title" class="control-label">Tytuł:</form:label>
					<c:if test="${pageContext.request.method!='POST'}">
						<form:input path="title" id="title" class="form-control"
							placeholder="Tutaj wprowadź tytuł książki" />
					</c:if>
					<c:if test="${pageContext.request.method=='POST'}">
						<form:input path="title" id="title"
							class="form-control ${status.error ? 'is-invalid':'is-valid' }"
							placeholder="Tutaj wprowadź tytuł książki" />
						<div class="valid-feedback">${status.error ? '':'Wygląda OK!' }</div>
						<form:errors path="title" class="invalid-feedback" />
					</c:if>
				</div>
			</spring:bind>
			<div class="form-row">
				<spring:bind path="releaseDate">
					<div class="form-group col-sm-4">
						<form:label path="releaseDate">Data wydania</form:label>
						<c:if test="${pageContext.request.method!='POST'}">
							<form:input path="releaseDate" class="form-control" type="date"
								placeholder="Data w formacie: rrrr-mm-dd" />
						</c:if>
						<c:if test="${pageContext.request.method=='POST'}">
							<form:input path="releaseDate"
								class="form-control ${status.error ? 'is-invalid':'is-valid' }"
								type="date" placeholder="Format daty: rrrr-mm-dd" />
							<form:errors path="releaseDate" class="invalid-feedback" />
							<div class="valid-feedback">${status.error ? '':'Piknie!' }</div>
						</c:if>
					</div>
				</spring:bind>
				<spring:bind path="author">
					<div class="form-group col-sm-4">
						<form:label path="author">Autor</form:label>
						<c:if test="${pageContext.request.method!='POST'}">
							<form:select path="author.id" class="form-control">
								<form:option value="-1" label="--wybierz autora--" />
								<form:options items="${authorsF}" itemValue="id"
									itemLabel="surnameName" />
							</form:select>
						</c:if>
						<c:if test="${pageContext.request.method=='POST'}">
							<form:select path="author.id"
								class="form-control  ${status.error ? 'is-invalid':'is-valid' }">
								<form:option value="-1" label="--wybierz autora--" />
								<form:options items="${authorsF}" itemValue="id"
									itemLabel="surnameName" />
							</form:select>
							<div class="valid-feedback">${status.error ? '':'No po prostu super!' }</div>
							<form:errors path="author" class="invalid-feedback" />
						</c:if>
					</div>
				</spring:bind>
				<div class="form-group col-sm-4">
					<form:label path="numberOfPages">Liczba stron</form:label>
					<form:input path="numberOfPages" class="form-control"
						placeholder="np. 345" />
				</div>
			</div>
			<a href="<c:url value="/books"/>" class="btn btn-info">Anuluj</a>
			<button type="submit" class="btn btn-primary"><%=vButtonCaption%></button>
		</form:form>
	</div>
</body>
</html>