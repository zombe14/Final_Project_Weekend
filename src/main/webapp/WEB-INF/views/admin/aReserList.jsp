<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${board}관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 관리자용 bootstrap -->
<c:import url="../temp/adminBoot.jsp" />
<!-- 관리자용 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
</head>
<body>
<div class="totalBody">
	<!-- header.jsp -->
	<c:import url="../inc/admin_header.jsp" />
	<div class="container-fluid">
		<div class="row content text-center">
			<!-- side bar -->
			<c:import url="../inc/admin_left_bar.jsp"/>
			<div class="col-sm-10">
				<h4>
					<small>${board} 관리</small>
				</h4>
				<hr>
				<div class="container col-sm-12">
					<table class="table table-hover">
						<tr>
							<td>NUM</td>
							<td>TITLE</td>
							<td>WRITER</td>
							<td>DATE</td>
							<td>HIT</td>
							<td>NUM</td>
							<td>TITLE</td>
							<td>WRITER</td>
							<td>DATE</td>
							<td>HIT</td>
						</tr>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.partner_order_id}</td>
								<td>${dto.partner_user_id}</td>
								<td>${dto.item_name}</td>
								<td>${dto.item_num}</td>
								<td>${dto.quantity}</td>
								<td>${dto.total_amount}</td>
								<td>${dto.tid}</td>
								<td>${dto.pg_token}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<footer class="container-fluid">
		<p>이곳엔 무엇을 넣어야 할 것인가?</p>
	</footer>
</div>
</body>
</html>
