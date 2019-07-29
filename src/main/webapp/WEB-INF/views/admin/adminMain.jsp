<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${boardTitle}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 관리자용 bootstrap -->
<c:import url="../temp/adminBoot.jsp" />
<!-- 관리자용 css -->
<c:import url="../../../resources/css/adminBoard.css" />
</head>
<body>
	<!-- header.jsp -->
	<c:import url="../inc/admin_header.jsp" />
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- left_bar -->
			<div class="col-sm-2 sidenav">
				<p>
					<a href="#">공지사항</a>
				</p>
				<p>
					<a href="#">페스티벌</a>
				</p>
				<p>
					<a href="#">공연</a>
				</p>
				<p>
					<a href="#">페스티벌 후기</a>
				</p>
				<p>
					<a href="#">공연 후기</a>
				</p>
				<p>
					<a href="#">관리자 추천</a>
				</p>
				<p>
					<a href="#">QnA</a>
				</p>
			</div>
			<!-- left bar 끝 -->
			<!-- body 시작 -->
			<div class="mainBody">
				<h1>Table form이 들어갈 곳</h1>
			</div>
			<!-- body 끝 -->
		</div>
	</div>


	<footer class="container-fluid text-center">
		<p>Footer</p>
	</footer>

</body>
</html>