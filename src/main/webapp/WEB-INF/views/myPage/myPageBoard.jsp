<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - 마이페이지 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
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
					<h2>환영합니다 (대충 회원 이름이 들어갈자리)님!</h2>
					<br>
					<h2>대충 사랑한다는 말이 들어갈 자리? 뭘 넣을까?..</h2>
				</div>
				<br>
				<ul>
					<li class="mqmenu"><a href="./mBoardList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage1.png">회원정보<br>수정</a></li>
					<li class="mqmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage5.png">비밀번호<br>변경</a></li>
					<li class="mqmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage2.png">티켓<br>관리</a></li>
					<li class="mqmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage4.png">공연 문의<br>내역</a></li>
					<li class="mqmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage3.png">나의 게시글<br>관리</a></li>
					<li class="mqmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/myPageLogout.png">회원 탈퇴</a></li>
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

