<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본 폼</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<style type="text/css">
/*
Table Style - This is what you want
------------------------------------------------------------------ */
table a:link {
	color: #666;
	font-weight: bold;
	text-decoration: none;
}

table a:visited {
	color: #999999;
	font-weight: bold;
	text-decoration: none;
}

table a:active, table a:hover {
	color: #bd5a35;
	text-decoration: underline;
}

table {
	font-family: Arial, Helvetica, sans-serif;
	color: #666;
	font-size: 12px;
	text-shadow: 1px 1px 0px #fff;
	background: #eaebec;
	margin: 20px;
	border: #ccc 1px solid;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}

table>thead th {
	padding: 21px 25px 22px 25px;
	border-top: 1px solid #fafafa;
	border-bottom: 1px solid #e0e0e0;
	background: #ededed; /* Old browsers */
	background: -moz-linear-gradient(top, #ededed 0%, #ebebeb 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #ededed),
		color-stop(100%, #ebebeb)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #ededed 0%, #ebebeb 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #ededed 0%, #ebebeb 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #ededed 0%, #ebebeb 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #ededed 0%, #ebebeb 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ededed',
		endColorstr='#ebebeb', GradientType=0); /* IE6-9 */
}

table>thead th:first-child {
	text-align: left;
	padding-left: 20px;
}

table>thead>tr:first-child>th:first-child {
	-webkit-border-top-left-radius: 3px;
	border-top-left-radius: 3px;
}

table>thead>tr:first-child>th:last-child {
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px;
}

table>tbody>tr {
	text-align: center;
	padding-left: 20px;
}

table>tbody>tr>td:first-child {
	text-align: left;
	padding-left: 20px;
	border-left: 0;
}

table>tbody>tr>td {
	padding: 18px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #fbfbfb; /* Old browsers */
	background: -moz-linear-gradient(top, #fbfbfb 0%, #fafafa 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fbfbfb),
		color-stop(100%, #fafafa)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #fbfbfb 0%, #fafafa 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #fbfbfb 0%, #fafafa 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #fbfbfb 0%, #fafafa 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #fbfbfb 0%, #fafafa 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fbfbfb',
		endColorstr='#fafafa', GradientType=0); /* IE6-9 */
}

table>tbody>tr:nth-child(even)>td {
	background: #f8f8f8; /* Old browsers */
	background: -moz-linear-gradient(top, #f8f8f8 0%, #f6f6f6 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f8f8f8),
		color-stop(100%, #f6f6f6)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #f8f8f8 0%, #f6f6f6 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #f8f8f8 0%, #f6f6f6 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #f8f8f8 0%, #f6f6f6 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #f8f8f8 0%, #f6f6f6 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8',
		endColorstr='#f6f6f6', GradientType=0); /* IE6-9 */
}

table>tbody>tr:last-child>td {
	border-bottom: 0;
}

table>tbody>tr:last-child>td:first-child {
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

table>tbody>tr:last-child>td:last-child {
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

table>tbody>tr:hover>td {
	background: #f2f2f2; /* Old browsers */
	background: -moz-linear-gradient(top, #f2f2f2 0%, #f0f0f0 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f2f2f2),
		color-stop(100%, #f0f0f0)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #f2f2f2 0%, #f0f0f0 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #f2f2f2 0%, #f0f0f0 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #f2f2f2 0%, #f0f0f0 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #f2f2f2 0%, #f0f0f0 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f2f2',
		endColorstr='#f0f0f0', GradientType=0); /* IE6-9 */
}

.conta{
	height: 700px;
	overflow: scroll;
}

.conta > tbofy{
	
	height: 100%;
}
</style>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<table>
					<thead>
						<tr>
							<th>결제 정보</th>
							<th>주문 정보</th>
							<th>구매자</th>
							<th>pg_token</th>
							<th>총액</th>
							<th>환불가능금액</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="i">
							<tr class="payment">
								<td>${i.tid }</td>
								<td class="order">${i.partner_order_id }</td>
								<td>${i.partner_user_id }</td>
								<td>${i.pg_token }</td>
								<td>${i.total_amount }</td>
								<td>${i.cancel_available_amount }</td>
								<c:choose>
									<c:when test="${i.state eq 0}">
										<td class="state">환불 완료</td>
									</c:when>
									<c:when test="${i.state eq 2}">
										<td class="state">실패</td>
									</c:when>
									<c:otherwise>
										<td class="state">정상</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp" />
		</div>
	</div>
	
	<script type="text/javascript">
		$(".payment").click(function() {
			var state = $(this).children().filter(".state").html();
			var order = $(this).children().filter(".order").html();
			if(state == "정상"){
				location.href="./paymentCancel?partner_order_id="+order;
			}else if(state == "실패"){
				alert("처리되지 않은 결제입니다.");
			}else{
				alert("환불완료");
			}
		});
	</script>
</body>
</html>