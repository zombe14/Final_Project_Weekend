<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본 폼</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<script type="text/javascript">
	$(function() {
		var url = '${url}';
		var win = window.open(null, "", "width=450,height=700");
		win.document.write('<iframe width="100%", height="100%" src="' + url
				+ '" frameborder="0" allowfullscreen></iframe>');
	});
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<h1>Payment Request Loding...</h1>
	<input type="text" id="partner_order_id" value="${order}">
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>