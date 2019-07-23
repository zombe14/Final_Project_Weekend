<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:import url="./temp/boot.jsp"></c:import>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="css/home.css">
</head>
<body>
<div id="wrap">
	<div id="header">
		<%@ include file="./inc/header.jsp" %>
	</div>
	<div id="container">
		<%@ include file="./inc/container.jsp" %>
	</div>
	<div id="footer">
		<%@ include file="./inc/footer.jsp" %>
	</div>

</div>
</body>
</html>
