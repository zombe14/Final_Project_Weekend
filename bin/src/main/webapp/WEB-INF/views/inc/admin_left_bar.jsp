<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-2 sidenav">
	<ul class="nav nav-pills nav-stacked">
		<c:choose>
			<c:when test="${board eq 'User'}">
				<li><a href="${pageContext.request.contextPath}/admin/aUserList">모든 유저</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aUserList?kind=2&search=2">관계자</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aUserList?kind=1&search=1">일반</a></li>
			</c:when>
			<c:when test="${board eq 'Reser'}">
				<li><a href="#">예약 현황</a></li>
				<li><a href="#">몰라</a></li>
				<li><a href="#">뭐넣지?</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/admin/aNoticeList">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aFestiList">페스티벌</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aShowList">공연</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aFestiAfterList">페스티벌 후기</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aShowAfterList">공연 후기</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aRecommendList">관리자 추천</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aQnaList">QnA</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	<br>
</div>
<br>
