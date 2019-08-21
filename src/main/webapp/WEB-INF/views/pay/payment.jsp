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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/payment.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<div class="payment_wrap">
					<div class="payment_left">
						<div id="orderer">
							<div class="order_title">
								<strong>주문자 정보</strong>
							</div>
								<table class="order_table">
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
							<div class="checkbox_title">예매자 확인</div>
							<ul id="check" class="checkbox_info">
								<li>
									<input type="checkbox" class="check" id="check1">
									<label for="check1">주문 확인 및 예매처리를 위해 휴대폰번호, 이메일, (배송수령 시)주소, (입력필요 시)생년월일을 수집하며,<br> 이용목적 달성 이후 파기합니다.</label>
								</li>
								<li>
									<input type="checkbox" class="check" id="check2">
									<label for="check2">개인정보 제 3자 제공에 동의합니다. (고객응대 및 관람정보안내 등을 위함)<a href="#">상세보기</a></label>
								</li>
								<li>
									<input type="checkbox" class="check" id="check3">
									<label for="check3">취소기한 및 취소수수료 동의<a href="#">상세보기</a></label>
								</li>
							</ul>
						</div>
					</div>
					<div class="payment_right">
						<div class="order_title">
								<strong>예매정보</strong>
							</div>
						<table class="table">
							
							<tbody>
								<tr>
									<td>상품정보</td>
									<td><a href="./show/selectOne?num =${vo.item_num}">${vo.item_name}</a><br>
										<span class="option">${vo.show_times}</span>
									</td>
								<tr>
									<td>수량</td>
									<td>${vo.quantity}</td>
								</tr>
								<tr>							
									<td>상품가격</td>
									<td>${vo.total_amount}</td>							
								</tr>
							</tbody>
						</table>
						<div class="btn_wrap">
							<a id="payment" class="payment_btn">결제하기</a>
						</div>
					</div>
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
					location.href = "./payment?item_name=${vo.item_name}&total_amount=${vo.total_amount}&quantity=${vo.quantity}&partner_user_id=${member.id}&item_num=${vo.item_num}&show_times=${vo.show_times}";
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