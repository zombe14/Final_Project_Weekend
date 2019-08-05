<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Weekend - 부정이용규제 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/legalguide.css">
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
					<li class="cmenu7"><a href="${pageContext.request.contextPath}/callcenter/cancel">환불안내</a></li>
					<li class="cmenu8"><a href="${pageContext.request.contextPath}/callcenter/legalguide">부정이용 규제안내</a></li>
					<li class="cmenu9"><a href="${pageContext.request.contextPath}/callcenter/ticketguide">티켓판매안내</a></li>
				</ul>
				<div class="call_cont">
					<h3>부정이용 규제안내</h3>
					<div class="reserve_guide">
						<div class="p_reative">
							<h4 class="illegal">
								주말뭐해는
								<br>
								<em>부정이용관리 시스템</em>
								을 통해 티켓의 부정이용을 
								<br>
								엄격히 규제합니다.
							</h4>
							<p class="guide_dsc">
								<em>공정</em>
								하고
								<em>안전</em>
								하게 공연/축제를 즐기실 수 있도록
								<br>
								각종 부적절한 이용과 개인 간 이루어지는 판매, 양도 등의 부정 거래를
								<br>
								약관 제9조(회원 탈퇴 및 자격 상실), 제 32조(허위 구매에 대한 규제)를 바탕으로 규제하고 있습니다.
							</p>
							<span class="illegal_img"></span>
							<p class="btn_terms"><a href="${pageContext.request.contextPath}/footer/use">약관 바로가기</a><p>
						</div>
					</div>
					
					<div class="reserve_guide">
						<p class="ill_p"><em class="illegal_tit">암표 부정거래</em>는</p>
						<p class="guide_dsc">
						* 공연/축제 문화를 해치는
						<em>범죄행위</em>
						입니다.
						<br>
						부정거래 관리 시스템을 통한 모니터링 과정에서 비정상적인 프로세스의 예매내역(매크로, 개인 간 거래 등) 적발 시
						<br>
						예매취소.회원정지/회원자격상실 등의 적절한 조치 및 법적 제재를 가할 수 있습니다.
						</p>
						<p class="guide_dsc">
						<em>사기의 위험</em>
						에서 보호받지 못합니다.
						<br>
						개인 간의 거래로 인한 피해에 대한 책임은 전적으로 거래 당사자에게 있으며,
						<span>피해 발생 시 주최.주관/주말뭐해에서 책임지지 않습니다.</span>
						</p>
						<p class="guide_dsc">
						개인간 판매/구매 시 공유된
						<em>개인 신상정보가 외부로 유출</em>
						될 수 있습니다.
						<br>
						티켓을 타인에게 재 판매하거나 양도받는 과정에서 개인 신상정보를 공유할 경우, 판매자와 구매자 모두 피해를 입을 수 있습니다.
						</p>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.JPG"></a>
	<div id="footer">
		<c:import url="../inc/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>