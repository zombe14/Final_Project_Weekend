<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Weekend - 고객센터 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ticketguide.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="../inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<div class="conta">
			<div class="call_quick">
				<div class="title">
					<h2>고객센터</h2>
				</div>
				<ul>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call1.png">아이디/<br>패스워드 찾기</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call2.png">상담내역<br>확인</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call3.png">티켓<br>예매문의</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call4.png">티켓<br>환불문의</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call5.png">티켓<br>수령문의</a></li>
				</ul>
			</div>
			<div class="call_container">
				<ul class="call_menu">
					<li class="cmenu1"><a href="${pageContext.request.contextPath}/callcenter/main">고객센터 홈</a></li>
					<li class="cmenu2"><a href="">공지사항</a></li>
					<li class="cmenu3"><a href="">질문과 답변</a></li>
					<li class="cmenu4"><a href="">예매안내</a></li>
					<li class="cmenu5"><a href="">결제수단안내</a></li>
					<li class="cmenu6"><a href="">회원정보안내</a></li>
					<li class="cmenu7"><a href="">환불안내</a></li>
					<li class="cmenu8"><a href="">부정이용 규제안내</a></li>
					<li class="cmenu9"><a href="">티켓판매안내</a></li>
				</ul>
				<div class="call_cont">
					<div class="partner_effect">
						<ul>
							<li class="pe1">
							<span></span>
							<h4>다양하고 편리한 예매서비스</h4>
							<p>인터넷,모바일,콜센터,유/무인 예매 채널에서 판매가 가능합니다.</p>
							</li>
							<li class="pe2">
							<span></span>
							<h4>마케팅 및 고객분석 서비스 제공</h4>
							<p>통계 시스템을 활용한 고객 티켓 예매 현황을 수집/분석하여 마케팅 솔루션을 제공합니다.</p>
							</li>
							<li class="pe3">
							<span></span>
							<h4>판매자 보호</h4>
							<p>Weekend는 판매자를 보호하며 지불을 보장하는 신뢰할 수 있는 기업입니다.</p>
							</li>
						</ul>
					
					</div>
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