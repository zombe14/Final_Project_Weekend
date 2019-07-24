<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<div id="h_container">
	<div class="h_top">
		<div class="h_wrap">
			<div class="user_menu">
				<div id="login">
					<a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a> <span class="log">|</span> <a href="#">예매확인/취소</a> <span class="log">|</span>
					<a href="${pageContext.request.contextPath}/member/memberAgree">회원가입</a> <span class="log">|</span> <a href="#">고객센터</a>
				</div>
				<div id="logout" style="display: none">
					<a href="#"></a> <span class="log">|</span> <a href="#">예매확인/취소</a> <span class="log">|</span>
					<a href="#">회원가입</a> <span class="log">|</span> <a href="#">고객센터</a>
				</div>
			</div>
		</div>
	</div>
	<div class="h_search">
		<div class="h_middle">
			<div class="logo">
				<!-- <h1>로고 자리</h1> -->
				<a href="#"><img alt="" src="./resources/images/home/logo.JPG"></a>
			</div>
			<div class="search_wrap">
				<input type="text" placeholder="검색어 입력" id="search">
				<a href="#" class="btn_search"><img src="./resources/images/home/h_search.png" style="width: 20px;"></a>
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
					<li id="navbar-page" class="navp"><a href="#"><i
							class="fa fa-home fa-fw"></i>내가 추천</a></li>
					<li class="dropdown navp"><a href="#"
						class="dropdown-caategory" id="dropdownCategoryMenu"
						data-toggle="dropdown"><i class="fa fa-folder-open"></i>공연<i
							class="caret"></i></a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownCategoryMenu">
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-folder"></i>지역별 콘서트</a></li>
							<li><a href="#"><i class="fa fa-folder"></i>소규모 연극</a></li>
							<li><a href="#"><i class="fa fa-folder"></i>대학로 연극</a></li>
						</ul></li>
					<li class="dropdown" class="navp"><a href="#"
						class="dropdown-caategory" id="dropdownCategoryMenu"
						data-toggle="dropdown"><i class="fa fa-folder-open"></i>축제<i
							class="caret"></i></a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownCategoryMenu">
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-folder"></i>전시</a></li>
							<li><a href="#"><i class="fa fa-folder"></i>행사</a></li>
							<li><a href="#"><i class="fa fa-folder"></i>레저</a></li>
						</ul></li>
					<li id="navbar-page" class="navp"><a href="#"><i
							class="fa fa-home fa-fw"></i>아동/가족</a></li>
					<li id="navbar-page" class="navp"><a href="#"><i
							class="fa fa-home fa-fw"></i>랭킹</a></li>
					<li id="navbar-page" class="navp"><a href="#"><i
							class="fa fa-home fa-fw"></i>빈칸</a></li>
					<li id="navbar-page" class="navp"><a href="./Mypage/MyPageBoard"><i
							class="fa fa-home fa-fw"></i>MyPage</a></li>
					<li id="navbar-page" class="navp"><a href="./admin/adminBoard"><i
							class="fa fa-home fa-fw"></i>adminPage</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>