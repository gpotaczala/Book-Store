<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<html>
<head>
<title>Book Store</title>
	<link rel="stylesheet" type="text/css" href="<s:url value="/resources/style.css" />">
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
