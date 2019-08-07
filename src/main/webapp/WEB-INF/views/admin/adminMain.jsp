<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${board}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 관리자용 bootstrap -->
<c:import url="../temp/adminBoot.jsp" />
<!-- 관리자용 css -->
<c:import url="../../../resources/css/adminBoard.css" />
</head>
<body>
	<div class="totalBody">
		<!-- header.jsp -->
		<c:import url="../inc/admin_header.jsp" />
		<div id="mypage_body">
			<h2> 관리자 페이지 입니다.</h2>
		</div>
		<br>
			<ul>
				<li class="qmyimg"><a href="./mBoardList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage1.png">회원정보<br>수정</a></li>
				<li class="qmyimg"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage5.png">비밀번호<br>변경</a></li>
				<li class="qmyimg"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage2.png">티켓<br>관리</a></li>
				<li class="qmyimg"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage4.png">공연 문의<br>내역</a></li>
				<li class="qmyimg"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage3.png">나의 게시글<br>관리</a></li>
				<li class="qmyimg"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/myPageLogout.png">회원 탈퇴</a></li>
			</ul>
		<footer class="container-fluid text-center">
			<p>이곳엔 무엇을 넣어야 할 것인가?</p>
		</footer>
	</div>
</body>
</html>