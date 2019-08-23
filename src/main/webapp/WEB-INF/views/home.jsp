<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="./temp/boot.jsp"></c:import>
<html>
<head>
	<title>Weekend 뭐해</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css"> 
	<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo/logo.png" />
	<script type="text/javascript" src="./resources/js/home.js"></script>
<script type="text/javascript">
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      console.log('현재 위도 :' + position.coords.latitude);
	      console.log('현재 경도 :' + position.coords.longitude);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
	}
	getLocation();
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="./inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<c:import url="./inc/container.jsp"></c:import>
	</div> 
	<div id="footer">
		<c:import url="./inc/footer.jsp"></c:import>
	</div>
</div>
<!-- 실시간 채팅 API -->
<script type="text/javascript">
tocplusTop=1150;
tocplusLeft=50;
tocplusMinimizedImage='http://kr03.tocplus007.com/img/minimized_ko.gif';
tocplusHAlign='right'; // float: right ? left ?
tocplusWidth=180; // 상담창 크기
tocplusHeight=220;
tocplusUserName='손님'; // 유저 이름 변경
tocplusFrameColor='#00d344'; // 대화창 테마 색상
tocplusFloatingWindow=true; // 상담창 위치를 고정으로 줄 것인지 움직이게 할것인지 지정
var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%"+"3Cscript src='" + tocplusHost 
		+ "kr03.tocplus007.com/chatLoader.do?userId=kws332' type='text/javascript'"
				+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
</script>
</body>
</html>

