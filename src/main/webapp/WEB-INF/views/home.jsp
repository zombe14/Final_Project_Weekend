<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="./temp/boot.jsp"></c:import>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="css/home.css">
	<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo/logo.png" />
<script>
jQuery(document).ready(function() {
	var bodyOffset = jQuery('body').offset();
	jQuery(window).scroll(function() {
		if (jQuery(document).scrollTop() > bodyOffset.top) {
			jQuery('#wingright').addClass('right_suv');
		} else {
			jQuery('#wingright').removeClass('right_suv');
		}
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
<<<<<<< HEAD
		<%@ include file="./inc/header.jsp" %> 
=======
		<c:import url="./inc/header.jsp"></c:import>
>>>>>>> master
	</div>
	<div id="container">
		<c:import url="./inc/container.jsp"></c:import>
	</div>
	<div id="footer">
		<c:import url="./inc/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>
