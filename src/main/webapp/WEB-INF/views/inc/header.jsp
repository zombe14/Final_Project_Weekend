<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
 
<div id="h_container">
	<div class="h_top">
		<div class="h_wrap">
			<div class="user_menu">
			<input type="hidden" value="${member.id }" id="memberId">
				<c:choose>
					<c:when test="${member.grade eq '3'}">
							<div id="admin">
								<a href="${pageContext.request.contextPath}/admin/adminMain?id=${member.id}">관리자 페이지</a> <span class="log">|</span> <a href="#">예매확인/취소</a> <span class="log">|</span>
								<a href="${pageContext.request.contextPath}/member/memberLogout?id=${member.id}" class="memberLogout">로그아웃</a> <span class="log">|</span> <a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
							</div>
					</c:when>
					<c:when test="${member.grade eq '2'}">
							<div id="logout">
								<a href="${pageContext.request.contextPath}/myPage/myMain">마이페이지</a> <span class="log">|</span> <a href="#">예매확인/취소</a> <span class="log">|</span>
								<a href="${pageContext.request.contextPath}/member/memberLogout?id=${member.id}" class="memberLogout">로그아웃</a> <span class="log">|</span> <a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
							</div>
					</c:when>
					<c:when test="${member.grade eq '1'}">
							<div id="logout">
								<a href="${pageContext.request.contextPath}/myPage/myMain">마이페이지</a> <span class="log">|</span> <a href="#">예매확인/취소</a> <span class="log">|</span>
								<a href="${pageContext.request.contextPath}/member/memberLogout?id=${member.id}" class="memberLogout">로그아웃</a> <span class="log">|</span> <a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
							</div>
					</c:when>
					<c:otherwise>
						<div id="login">
							<a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a> <span class="log">|</span> <a href="#">예매확인/취소</a> <span class="log">|</span>
							<a href="${pageContext.request.contextPath}/member/memberAgree">회원가입</a> <span class="log">|</span> <a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="h_search">
		<div class="h_middle">
			<div class="logo">
				<!-- <h1>로고 자리</h1> -->
				<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo1.png"></a>
			</div>
			<div class="search_wrap">
				<input type="text" placeholder="" id="search">
				<a href="#" class="btn_search"><img src="${pageContext.request.contextPath}/resources/images/home/h_search.png" style="width: 15px;"></a>
			</div>
			<!-- <div class="search">
		</div> -->
		</div>
	</div>
	<!-- <div class="h_menu">
		<ul class="h_inner">
			<li class="menu_list" id="menu1">관리자 추천</li>
			<li class="menu_list" id="menu2">공연</li>
			<li class="menu_list" id="menu3">전시/축제</li>
			<li class="menu_list" id="menu4">레저/체험</li>
			<li class="menu_list" id="menu5">아동/가족</li>
		</ul>
		<ul>
			<li>랭킹</li>
			<li>지역</li>
		</ul>
	</div> -->
	<!-- <hr class="a"> -->
	<div id="menulist" class="h_menu">
		<div class="collapse navbar-collapse">
			<div class="nav_wrap">
				<ul class="nav navbar-nav">
					<li id="navbar-page" class="navp"><a href="${pageContext.request.contextPath}/WeekReco/WeekRecoList"><i class="fa fa-home fa-fw"></i>W 추천</a></li>
					<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/festi/festiList?category=1"><i class="fa fa-home fa-fw"></i>공연</a></li>
					<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/festi/festiMain"><i class="fa fa-home fa-fw"></i>축제</a></li>
					<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/festi/festiList?category=3"><i class="fa fa-home fa-fw"></i>대학로</a></li>
					<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/rank/rank_festi1"><i
							class="fa fa-home fa-fw"></i>랭킹</a></li>
					<li id="navbar-page" class="navp"><a href="${pageContext.request.contextPath}/UserReco/UserRecoList"><i
							class="fa fa-home fa-fw"></i>유저추천</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>