<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 소개</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/introduction.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<!-- 구글 맵 api -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDTVGctPPCMK9jfFwhq0mjA7aL34D0hqFw" ></script>
<style>
#map_ma {width:1100px; height:400px; clear:both; border:solid 1px #f5f6f7; margin: 0 auto}
</style>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<div class="inner">
				<c:import url="../inc/intro_header.jsp"></c:import>
			</div>
		</div>
		<div id="container">
			<div class="inner">
				<c:import url="../inc/intro_container.jsp"></c:import>
			</div>
		</div>
		<div id="footer">
			<div class="inner">
				<c:import url="../inc/footer.jsp"></c:import>
			</div>
		</div>
	</div>
</body>
</html>
