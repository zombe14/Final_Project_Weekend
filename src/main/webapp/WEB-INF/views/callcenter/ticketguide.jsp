<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Weekend - 티켓판매안내 </title>
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
							<span><img src="${pageContext.request.contextPath}/resources/images/callcenter/tkg1.png"></span>
							<h4>다양하고 편리한 예매서비스</h4>
							<p>인터넷,모바일,콜센터,유/무인 예매 채널에서 판매가 가능합니다.</p>
							</li>
							<li class="pe2">
							<span><img src="${pageContext.request.contextPath}/resources/images/callcenter/tkg2.png"></span>
							<h4>마케팅 및 고객분석 서비스 제공</h4>
							<p>통계 시스템을 활용한 고객 티켓 예매 현황을 수집/분석하여 마케팅 솔루션을 제공합니다.</p>
							</li>
							<li class="pe3">
							<span><img src="${pageContext.request.contextPath}/resources/images/callcenter/tkg3.png"></span>
							<h4>판매자 보호</h4>
							<p>Weekend는 판매자를 보호하며 지불을 보장하는 신뢰할 수 있는 기업입니다.</p>
							</li>
						</ul>
					</div>
					<h4>판매 서비스 절차</h4>
					<div class="salecont">
						<ul class="salesdetail_lst">
                            <li class="sd1">
                                <h5><span>판매상담 및 계약</span></h5>
                                <p>담당자와 상품 판매 대행관련 상담을 합니다. 만약 행사의 취지가 당사와 맞지 않다고 판단될 경우 판매가 진행되지 않을 수 있습니다.<br>
                                    연간계약과 단일계약 중 선택하여 계약하고 관련 서류 작업을 완료합니다.<br>
                                    상담과 계약이 완료되었으면 필요 서류를 접수합니다. 계약서/ 사업자등록증 사본/ 통장사본은 필수로 제출하셔야 합니다.
                                </p>
                            </li>
                            <li class="sd2">
                                <h5><span>상품등록</span></h5>
                                <p>판매할 상품의 소개 자료 및 판매대행의뢰서를 접수합니다.<br>
                                    - 판매대행의뢰서, 상품 포스터, 상품 소개 자료가 필요합니다.<br>
                                    - 지정석일 경우 좌석배치도가 필요합니다. (위켄드에서 판매할 좌석 표기 필수)<br>
                                    통상 의뢰서 수신일로부터 영업일 기준 3-4일 이내에 등록이 완료됩니다.<br>
                                    단, 연말 등 특수한 경우에는 그 기간이 좀 더 길어질 수 있습니다.
                                </p>
                            </li>
                            <li class="sd3">
                                <h5><span>판매</span></h5>
                                <p>등록 작업이 완료되면, 원하는 시점에 맞춰 상품 판매가 시작됩니다. 단, 연말 성수기 등 특정 시점에는 협의가 필요할 수 있습니다. 티켓판매는 위켄드 인터넷 사이트, 공연/전시 앱, 스포츠 앱,
                                    고객센터에서 판매됩니다.<br>
                                    위켄드의 다양한 홍보 채널을 통해 상품이 홍보됩니다.
                                </p>
                            </li>
                            <li class="sd4">
                                <h5><span>정산</span></h5>
                                <p>상품 종료되면 3일 이내에 정산서를 보내드립니다.<br>
                                    7일 이내에 판매수수료를 제외한 정산금액을 입금하여 드립니다.
                                </p>
                            </li>
                        </ul>
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