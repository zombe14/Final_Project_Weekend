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
			<!-- side bar -->
			<c:import url="../inc/admin_left_bar.jsp" />
			<!-- body 시작 -->
				<div class="container">
					<table class="table table-hover">
						<tr>
							<td>NUM</td>
							<td>TITLE</td>
							<td>WRITER</td>
							<td>DATE</td>
							<td>HIT</td>
						</tr>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.num}</td>
								<td>${dto.title}</td>
								<td>${dto.writer}</td>
								<td>${dto.reg_date}</td>
								<td>${dto.hit}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			<!-- body 끝 -->
		</div>
	</div>


	<footer class="container-fluid text-center">
		<p>Footer</p>
	</footer>

</body>
</html>