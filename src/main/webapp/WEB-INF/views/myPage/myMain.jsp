<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - 마이페이지 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">
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
						<h2>환영합니다. ${member.id} 님!</h2>
					<h2>${member.phone}</h2>
					<h2>대충 개인정보를 띄우는 창</h2>
					<br>
				</div>
				<div>
				</div>
				<br>
				<ul>
					<li class="mqmenu"><a href="./mInfoList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage1.png">회원정보<br>수정</a></li>
					<li class="mqmenu"><a href="./mPasswordList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage5.png">비밀번호<br>변경</a></li>
					<li class="mqmenu"><a href="./mTicketList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage2.png">티켓<br>관리</a></li>
					<li class="mqmenu"><a href="./mQnaList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage4.png">공연 문의<br>내역</a></li>
					<li class="mqmenu"><a href="./mBoardList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage3.png">나의 게시글<br>관리</a></li>
					<li class="mqmenu"><a href="./mByeByeList"><img src="${pageContext.request.contextPath}/resources/images/mypage/myPageLogout.png">회원 탈퇴</a></li>
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

