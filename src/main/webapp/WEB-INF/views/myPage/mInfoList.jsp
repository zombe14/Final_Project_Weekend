<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - 마이페이지 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<script type="text/javascript">
	$(function () {
		$(".nc").on("click", function () {
			var nick = $(this).attr("nc");
			alert(nick);
		});
	});
</script>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<!-- body 전부를 감쌈  -->
		<div id="container">
			<div class="conta">
				<div class="call_quick mypage_quick">
					<table class="table table-hover">
						<tr>
							<td>아이디</td>
							<td>${member.id}</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="pw"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" id="pwc"></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" value="${member.nickname}" class="nc"></td>
							<td><button class="nc">변경하기</button></td>
						</tr>
						<tr>
							<td>이름</td>
							<td>${member.name}</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" value="${member.phone}"><button id="pc">변경하기</button></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" value="${member.email}"><button id="ec">변경하기</button></td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${member.reg_date}</td>
						<tr>
					</table>
					<a type="button" href="./myMain">수정 완료</a>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>
