<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - 마이페이지 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<!-- body 전부를 감쌈  -->
		<div class="container">
			<div class="conta">
			<div class="call_quick mypage_quick">
				<div class="title">
					<h2>마이페이지</h2>
				</div>
				<ul>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage1.png">회원정보<br>수정</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage2.png">나의예매<br>확인</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage3.png">나의후기<br>보기</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/mypage/mypage4.png">상품문의<br>내역</a></li>

				</ul>
			</div>
			<div class="call_container">
				<ul class="call_menu">
					<li class="cmenu1">회원정보관리</li>
						<p><a href="#">회원정보수정</a></p>
						<p><a href="#">회원탈퇴</a></p>
					<li class="cmenu2"><a href="">내 글 관리</a></li>
						<p><a href="#">Notice</a></p>
						<p><a href="#">Show</a></p>
						<p><a href="#">Festi</a></p>
						<p><a href="#">After Show</a></p>
						<p><a href="#">Admin Recommend</a></p>
						<p><a href="#">Rank</a></p>
						<p><a href="#">QnA</a></p>
					<li class="cmenu3"><a href="#">예매관리</a></li>
						<p><a href="#">예매 현황</a></p>
				</ul>
				<div class="call_cont">
						<table class="table table-hover">
							<tr>
								<td>ID</td>
								<td>NAME</td>
								<td>AGE</td>
								<td>EMAIL</td>
								<td>PHONE</td>
							</tr>
							<tr>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
							</tr>
						</table>
				</div>
			</div>
		</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>
