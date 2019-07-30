<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="./resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<!-- body 전부를 감쌈  -->
		<div class="container">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked">
					<h3>내 정보</h4>
					<li><a href="#">내 정보</a></li>
					<h3>내 글</h3>
					<li><a href="#">Notice</a></li>
					<li><a href="#">Show</a></li>
					<li><a href="#">Festi</a></li>
					<li><a href="#">After Show</a></li>
					<li><a href="#">After Festi</a></li>
					<li><a href="#">Admin Recommend</a></li>
					<li><a href="#">Rank</a></li>
					<li><a href="#">QnA</a></li>
					<h3>예약</h3>
					<li><a href="#">예약 현황</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<table class="table table-hover">
					<tr>
						<td>ID</td>
						<td>NAME</td>
						<td>AGE</td>
						<td>EMAIL</td>
						<td>PHONE</td>
					</tr>
					<tr>
						<td>test</td>
						<td>test</td>
						<td>test</td>
						<td>test</td>
						<td>test</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>
