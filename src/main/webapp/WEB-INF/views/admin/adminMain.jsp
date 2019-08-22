<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 관리자용 bootstrap -->
<c:import url="../temp/boot.jsp"/>
<html>
<head>
<title>${title} 페이지 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminMain.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<!-- body 전부를 감쌈  -->
		<div id="container">
			<div class="conta">
			<div class="call_quick mypage_quick">
				<div class="title">
					<br>
						<h2>환영합니다 ${id}님!</h2>
					<br>
				</div>
				<br>
				<ul>
					<li class="mqmenu"><a href="./aUserList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage1.png"><br>유저 관리</a></li>
					<li class="mqmenu"><a href="./aNoticeList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage5.png"><br>게시글 관리</a></li>
					<li class="mqmenu"><a href="./aCate1List"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage2.png"><br>공연 관리</a></li>
					<li class="mqmenu"><a href="./aReserList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage4.png"><br>티켓 관리</a></li>
				</ul>
			</div>
		</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>
