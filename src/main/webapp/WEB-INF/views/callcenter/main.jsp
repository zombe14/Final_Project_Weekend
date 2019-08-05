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
					<li class="cmenu3"><a href="">FAQ</a></li>
					<li class="cmenu4"><a href="">예매안내</a></li>
					<li class="cmenu5"><a href="">결제수단안내</a></li>
					<li class="cmenu6"><a href="">회원정보안내</a></li>
					<li class="cmenu7"><a href="${pageContext.request.contextPath}/callcenter/cancel">환불안내</a></li>
					<li class="cmenu8"><a href="">부정이용 규제안내</a></li>
					<li class="cmenu9"><a href="${pageContext.request.contextPath}/callcenter/ticketguide">티켓판매안내</a></li>
				</ul>
				<div class="call_cont">
					<ul class="help_link">
						<li class="first">
							<a href="">
								<h4><i>예매 도움</i> 받기</h4>
								<p>예매 안내를 통해서<br>편리한 예매방법을<br>알아보세요.</p>
								<img alt="" src="${pageContext.request.contextPath}/resources/images/callcenter/help1.png">
							</a>
						</li>
						<li>
							<a href="">
								<h4><i>1:1 상담</i> 받기</h4>
								<p>빠르고 간편한<br>온라인 1:1문의를<br>이용해보세요.</p>
								<img alt="" src="${pageContext.request.contextPath}/resources/images/callcenter/help2.png">
							</a>
						</li>
						<li>
							<a href="">
								<h4><i>FAQ</i> 보기</h4>
								<p>궁금한 질문들을<br>쉽고 편하게<br>한번에 알아보세요.</p>
								<img alt="" src="${pageContext.request.contextPath}/resources/images/callcenter/help3.png">
							</a>
						</li>
						<li>
							<a href="">
								<h4><i>티켓 소식</i> 알아보기</h4>
								<p>티켓링크의<br>새로운 소식들을<br>빠르게 접해보세요.</p>
								<img alt="" src="${pageContext.request.contextPath}/resources/images/callcenter/help4.png">
							</a>
						</li>
						<li class="h1">
							<a href="">
								<h4><i>예매 상담</i> 하기</h4>
								<p>1588-0000</p>
								<br>
								<p>09:00 ~ 18:00(월-금)</p>
								<img alt="" src="${pageContext.request.contextPath}/resources/images/callcenter/help5.png">
							</a>
						</li>
						<li class="h1">
							<a href="">
								<h4><i>문의</i> 하기</h4>
								<p>1588-0001</p>
								<br>
								<p>09:00 ~ 18:00(월-금)</p>
								<img alt="" src="${pageContext.request.contextPath}/resources/images/callcenter/help5.png">
							</a>
						</li>
					</ul>
					<div class="helpmain_list">
						<div class="helpmain_question">
							<strong>자주 묻는 질문</strong>
							<ul>
								<li>
									<a href="#">비밀번호을 변경하고 싶어요.</a>
								</li>
								<li>
									<a href="#">내 정보를 변경하고 싶어요.</a>
								</li>
								<li>
									<a href="#">예매 취소하는 방법을 알고 싶어요.</a>
								</li>
								<li>
									<a href="#">결제수단을 알고 싶어요.</a>
								</li>
								<li>
									<a href="#">회원 탈퇴하는 방법을 알고 싶어요.</a>
								</li>
							</ul>
						</div>
						<div class="helpmain_notice">
							<strong>최근 공지 사항</strong>
							<ul>
								<li>
									<a href="#">공지1</a>
								</li>
								<li>
									<a href="#">공지2</a>
								</li>
								<li>
									<a href="#">공지3</a>
								</li>
								<li>
									<a href="#">공지4</a>
								</li>
								<li>
									<a href="#">공지5</a>
								</li>
							</ul>
						</div>
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