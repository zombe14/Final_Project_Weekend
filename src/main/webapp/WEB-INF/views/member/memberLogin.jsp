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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberLogin.js?ver=2"></script>
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div class="container">
      		<h1>로그인 페이지</h1>
      		<form action="./memberLogin" id="frm" method="POST">
	      		<div>
	      			<input id="id" name="id" type="text" placeholder="아이디" value="">
	      		</div>
	      		<div>
	      			<input id="pw" name="pw" type="password" placeholder="비밀번호" value="">
	      		</div>
	      		<button type="submit" id="Login">
						로그인
				</button>
      		</form>
      		<div>
      			<a href="./memberJoin">회원가입</a><span class="log">|</span>
      		</div>
      		
      		
      </div>
      <div id="footer" style="margin-top: 500px;">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
</body>
</html>