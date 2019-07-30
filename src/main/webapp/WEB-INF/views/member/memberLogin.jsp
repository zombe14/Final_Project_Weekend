<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> memberJoin </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberLogin.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberLogin.js?ver=2"></script>
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="conta">
      		<div class="login_wrap">
      		<form action="./memberLogin" id="frm" method="POST">
	      		<div class="ps_box">
	      			<input id="id" class="idbtn" name="id" type="text" placeholder="아이디를 입력하세요" value="">
	      		</div>
	      		<div class="ps_box">
	      			<input id="pw" class="pwbtn" name="pw" type="password" placeholder="비밀번호를 입력하세요" value="">
	      		</div>
	      		<button type="submit" id="Login" class="lgbtn">
						로그인
				</button>
      		</form>
      		<div class="login_bot">
      			<a href="./memberJoin" class="lob">회원가입</a>
      			<span class="log lob">|</span>
      			<a href="#" class="lob">비밀번호 찾기</a>
      			<span class="log lob">|</span>
      			<a href="#" class="lob">아이디 찾기</a>
      			
      			
      			
      		</div>
      		</div>
      	</div>
      	</div>
      		
      		
      </div>
      <div id="footer" style="margin-top: 500px;">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
</body>
</html>