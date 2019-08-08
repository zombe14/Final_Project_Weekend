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
		<div class="admin_tbody">
			<div class="admin_hbody">
				<h1> 환영합니다. ${id}님 <br><br>${title} 페이지 입니다.</h1>
				<br>
			</div>
			<div class="admin_mbody">
				<ul>
					<li class="qmyimg"><a href="./aUserList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage1.png">유저<br>관리</a></li>
					<li class="qmyimg"><a href="./aNoticeList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage5.png">게시글<br>관리</a></li>
					<li class="qmyimg"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage2.png">공연<br>관리</a></li>
					<li class="qmyimg"><a href="./aReserList"><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage4.png">예약<br>관리</a></li>
				</ul>
			</div>	
		</div>
	</div>
		<footer class="container-fluid text-center">
			<p>이곳엔 무엇을 넣어야 할 것인가?</p>
		</footer>
</body>
</html>