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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">
/*
Table Style - This is what you want
------------------------------------------------------------------ */
.table a:link {
	color: #666;
	font-weight: bold;
	text-decoration: none;
}
.table a:visited {
	color: #999999;
	font-weight: bold;
	text-decoration: none;
}
.table a:active,
.table a:hover {
	color: #bd5a35;
	text-decoration: underline;
}
.table {
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
.table > thead th {
	padding: 21px 25px 22px 25px;
	border-top: 1px solid #fafafa;
	border-bottom: 1px solid #e0e0e0;

	background: #ededed; /* Old browsers */
	background: -moz-linear-gradient(top,  #ededed 0%, #ebebeb 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ededed), color-stop(100%,#ebebeb)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #ededed 0%,#ebebeb 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #ededed 0%,#ebebeb 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #ededed 0%,#ebebeb 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #ededed 0%,#ebebeb 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ededed', endColorstr='#ebebeb',GradientType=0 ); /* IE6-9 */
}
.table > thead th:first-child{
	text-align: left;
	padding-left: 20px;
}
.table > thead > tr:first-child > th:first-child {
	-webkit-border-top-left-radius: 3px;
	border-top-left-radius: 3px;
}
.table > thead > tr:first-child > th:last-child {
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px;
}
.table > tbody > tr {
	text-align: center;
	padding-left: 20px;
}
.table > tbody > tr > td:first-child {
	text-align: left;
	padding-left: 20px;
	border-left: 0;
}
.table > tbody > tr > td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fbfbfb; /* Old browsers */
	background: -moz-linear-gradient(top,  #fbfbfb 0%, #fafafa 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fbfbfb), color-stop(100%,#fafafa)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #fbfbfb 0%,#fafafa 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fbfbfb', endColorstr='#fafafa',GradientType=0 ); /* IE6-9 */
}
.table > tbody > tr:nth-child(even) > td{
	background: #f8f8f8; /* Old browsers */
	background: -moz-linear-gradient(top,  #f8f8f8 0%, #f6f6f6 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f8f8f8), color-stop(100%,#f6f6f6)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #f8f8f8 0%,#f6f6f6 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #f8f8f8 0%,#f6f6f6 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #f8f8f8 0%,#f6f6f6 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #f8f8f8 0%,#f6f6f6 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
}
.table > tbody > tr:last-child > td{
	border-bottom: 0;
}
.table > tbody > tr:last-child > td:first-child {
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px;
}
.table > tbody > tr:last-child > td:last-child {
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px;
}
.table > tbody > tr:hover > td {
	background: #f2f2f2; /* Old browsers */
	background: -moz-linear-gradient(top,  #f2f2f2 0%, #f0f0f0 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f2f2), color-stop(100%,#f0f0f0)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #f2f2f2 0%,#f0f0f0 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f2f2', endColorstr='#f0f0f0',GradientType=0 ); /* IE6-9 */
}
#check li{
	width: 100%;
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
			<div>
			
				<table class="table">
					<thead>
						<tr>
							<td>상품정보</td>
							<td>수량</td>
							<td>상품가격</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="./show/selectOne?num =${vo.item_num}">${vo.item_name}</a><br>
							<span class="option">${vo.show_times}</span>
							</td>
							<td>${vo.quantity}</td>
							<td>${vo.total_amount}</td>
						</tr>
					</tbody>
				</table>
			</div>	
				<div>
					
					<div id="orderer">
						<div>주문자 정보</div>
						<table>
							<tr>
								<th>이름 *</th>
								<td>${member.name}</td>
							</tr>
							<tr>
								<th>휴대폰 번호 *</th>
								<td>${member.phone}</td>
							</tr>
							<tr>
								<th>이메일 *</th>
								<td>${member.email}</td>
							</tr>
						</table>
					</div>
					<div>
						<div>예매자 확인</div>
						<ul id="check">
							<li>
							<span><input type="checkbox" class="check" id="check1"></span>
							<span>주문 확인 및 예매처리를 위해 휴대폰번호, 이메일, (배송수령 시)주소, (입력필요 시)생년월일을 수집하며, 이용목적 달성 이후 파기합니다.</span>
							</li>
							<li>
							<span><input type="checkbox" class="check" id="check2"></span>
							<span>개인정보 제 3자 제공에 동의합니다. (고객응대 및 관람정보안내 등을 위함)<a href="#">상세보기</a></span>
							</li>
							<li>
							<span><input type="checkbox" class="check" id="check3"></span>
							<span>취소기한 및 취소수수료 동의<a href="#">상세보기</a></span>
							</li>
						</ul>
					</div>
				</div>
				<div>
				<button id="payment">결제하기</button>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
		
		<script type="text/javascript">
		var check = 0;
			$("#payment").click(function() {
				$(".check").each(function() {
					if($(this).prop("checked") == true){
						check++;
					}
				});
				
				if(check == 3){
					location.href = "./payment?item_name=${vo.item_name}&total_amount=${vo.total_amount}&quantity=${vo.quantity}&partner_user_id=${member.id}&item_num=${vo.item_num}&show_times=${show_times}";
				}else{
					$(".check").each(function() {
						if($(this).prop("checked") == false){
							if($(this).attr("id") == "check1"){
								alert("주문자 확인 및 휴대폰번호 수집을 확인하셔야 결제가 가능합니다.");
							}else if($(this).attr("id") == "check2"){
								alert("제 3자 정보 제공에 동의하셔야만 결제가 가능합니다. 내용을 확인하신 후, 동의하기를 체크해주세요.");
							}else{
								alert("취소 수수료 및 취소기한 내용에 동의하셔야만 결제가 가능합니다. 내용을 확인하신 후, 동의하기를 체크해주세요");
							}
						}
					});
				}
				check = 0;
			});
		</script>
	</div>
</body>
</html>