<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-2 sidenav">
	<ul class="nav nav-pills nav-stacked">
		<c:choose>
			<c:when test="${board eq 'User'}">
				<li><a href="${pageContext.request.contextPath}/admin/aUserList">모든 유저</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aUserList">관계자</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aUserList">일반</a></li>
			</c:when>
			<c:when test="${board eq 'Notice'}">
				<li><a href="${pageContext.request.contextPath}/admin/aNoticeList">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aWeekRecoList">W 추천</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aFestiAfterList?category=1">공연 후기??</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aShowAfterList?category=2">축제 후기??</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aShowAfterList?category=3">대학로 후기??</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aFestiList">유저 추천</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aQnaList">QnA</a></li>
			</c:when>
			<c:when test="${board eq 'Festi'}">
				<li><a href="${pageContext.request.contextPath}/admin/aFestiList">공연</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aFestiList">축제</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aFestiList">대학로</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/admin/aReserList">전체 예약</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aReserList">공연 예약</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/aReserList">대학로 예약</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	<br>
</div>
<br>
