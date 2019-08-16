+<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 카카오맵 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />

<!-- 카카오맵  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc046e4f4893e653801de407847c4b15"></script> 

</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="../inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<div class="conta">
		
			<!-- 카카오맵 -->
			<div id="map" style="width:1000px;height:600px;"></div>
		</div>
	</div>
	<div id="footer">
		<c:import url="../inc/footer.jsp"></c:import>
	</div>
</div>
<script>

	 // 카카오맵 jsp에 띄우기
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(36.2683, 127.6358),
		level: 12
	}

	var map = new kakao.maps.Map(container, options);  
	customOverlay = new kakao.maps.CustomOverlay({}),
	infowindow = new kakao.maps.InfoWindow({removable: true});
	
</script>
</body>
</html>