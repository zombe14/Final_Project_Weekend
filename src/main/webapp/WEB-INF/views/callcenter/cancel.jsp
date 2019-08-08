<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Weekend - 환불안내 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cancel.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="../inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<div class="conta">
			<div class="cancel_wrap">
			<div class="call_quick">
				<div class="title">
					<h2>고객센터</h2>
				</div>
				<ul>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/infosearch"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call1.png">아이디/<br>패스워드 찾기</a></li>
					<li class="qmenu"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call2.png">상담내역<br>확인</a></li>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/reservation"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call3.png">티켓<br>예매문의</a></li>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/cancel"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call4.png">티켓<br>환불문의</a></li>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/receive"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call5.png">티켓<br>수령문의</a></li>
				</ul>
			</div>
			<div class="call_container">
				<ul class="call_menu">
					<li class="cmenu1"><a href="${pageContext.request.contextPath}/callcenter/main">고객센터 홈</a></li>
					<li class="cmenu2"><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
					<li class="cmenu3"><a href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
					<li class="cmenu4"><a href="${pageContext.request.contextPath}/callcenter/reservation">예매안내</a></li>
					<li class="cmenu5"><a href="${pageContext.request.contextPath}/callcenter/payment">결제수단안내</a></li>
					<li class="cmenu6"><a href="${pageContext.request.contextPath}/callcenter/cancel">환불안내</a></li>
					<li class="cmenu7"><a href="${pageContext.request.contextPath}/callcenter/legalguide">부정이용 규제안내</a></li>
					<li class="cmenu8"><a href="${pageContext.request.contextPath}/callcenter/ticketguide">티켓판매안내</a></li>
				</ul>
				<div class="call_cont">
					<h3>환불 안내</h3>
					<div class="cancel_wrap">
					<strong>[예매 취소 마감 시간]</strong><br>
					<p>
					구단/기획사 정책에 따라 특정 상품의 예매/취소 마감시간이 다를 수 있습니다. (예매 시 확인 가능)
					</p>
					<div class="info_memlist_block">
                                <strong>[예매 취소시 유의사항]</strong><br>
                                <dl class="dsc">
                                    <dt>수수료 부과</dt>
                                    <dd>
                                        <ul class="inner_lst">
                                            <li>- 상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다. (예매 시 확인 가능)</li>
                                            <li>- 예매수수료는 예매 당일 밤 12시 이전까지만 환불됩니다.</li>
                                            <li>- 취소수수료는 취소시점에 따라 다르게 부과됩니다. 자세한 내용은 <a href="http://www.ticketlink.co.kr/help/guide/charge">고객센터 &gt;
                                                수수료 안내</a>에서 확인하실 수 있습니다.
                                            </li>
                                        </ul>
                                    </dd>
                                    <dt>부분 취소</dt>
                                    <dd>
                                        <ul class="inner_lst">
                                            <li>- 신용카드로 단일 결제하신 경우, 티켓의 부분 취소가 가능합니다.</li>
                                            <li>- 기획사/구단의 정책으로 일부 상품의 경우 부분 취소가 불가할 수 있습니다.</li>
                                        </ul>
                                    </dd>
                                    <dt>예매 후 예매내역에 대한 변경 불가</dt>
                                    <dd>
                                        <ul class="inner_lst">
                                            <li>- 예매된 건에 대한 일부 변경(날짜/시간/좌석/결제 등)은 불가하여, 기존 예매건을 취소하시고 다시 예매를 하셔야 합니다.<br>단, 취소 시점에 따라 예매수수료가 환불되지 않거나
                                                취소수수료가 부과될 수 있습니다.
                                            </li>
                                            <li>- 재예매를 하실 경우, 기존에 예매하셨던 좌석이 보장되지 않을 수 있습니다.</li>
                                        </ul>
                                    </dd>
                                    <dt>일괄 취소</dt>
                                    <dd>
                                        <ul class="inner_lst">
                                            <li>- 일부 상품의 경우, 우천 취소 등의 상황에 따라 일괄 취소가 발생할 수 있으며 일괄 취소 시 취소수수료가 부과되지 않습니다.<br>단, 일괄 취소 공지 이전에 직접 예매를 취소하신
                                                경우에는 취소수수료가 반환되지 않습니다.
                                            </li>
                                            <li>- 행사 상의 문제로 인해 환불을 받으실 경우 별도의 수수료를 공제하지 않으며, 환불 주체가 티켓링크가 아닌 행사 주최사가<br>될 수 있습니다.</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
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