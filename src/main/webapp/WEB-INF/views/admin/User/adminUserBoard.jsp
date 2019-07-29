<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>유저 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../../temp/adminBoot.jsp" />
<c:import url="../../../../resources/css/adminBoard.css" />
</head>
<body>
	<c:import url="../../adminInc/header.jsp" />
	<!-- left bar 시작 -->
	<div class="container-fluid">
		<div class="row content">
			<!-- side bar -->
			<c:import url="../../adminInc/left_bar.jsp" />
			<div class="col-sm-9">
				<h4>
					<small>${board} 관리</small>
				</h4>
				<hr>
				<div class="container">
					<table class="table table-hover">
						<tr>
							<td>ID</td>
							<td>NAME</td>
							<td>AGE</td>
							<td>EMAIL</td>
							<td>PHONE</td>
							<td>GRADE</td>
							<td>NICKNAME</td>
						</tr>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.age}</td>
								<td>${dto.email}</td>
								<td>${dto.phone}</td>
								<td>${dto.grade}</td>
								<td>${dto.nickname}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>

</body>
</html>