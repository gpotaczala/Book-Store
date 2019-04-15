<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Book Store</title>
<!-- <link rel="stylesheet" type="text/css" href="<s:url value="/resources/style.css" />">  -->
</head>
<body>
	<div id="header">
		<t:insertAttribute name="header" />
	</div>
	<div id="content">
		<t:insertAttribute name="body" />
	</div>
	<div id="footer">
		<t:insertAttribute name="footer" />
	</div>
</body>
</html>
