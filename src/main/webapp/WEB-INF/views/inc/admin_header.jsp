<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header 시작 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="../">홈페이지로 이동</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav" class="active">
		<li id="navbar-page" class="navp"><a href="${pageContext.request.contextPath}/WeekReco/WeekRecoList"><i class="fa fa-home fa-fw"></i>W 추천</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/festi/festiList?category=1"><i class="fa fa-home fa-fw"></i>공연</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/festi/festiMain"><i class="fa fa-home fa-fw"></i>축제</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/festi/festiList?category=3"><i class="fa fa-home fa-fw"></i>대학로</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/rank/rank_festi?category=1"><i class="fa fa-home fa-fw"></i>랭킹</a></li>
		<li id="navbar-page" class="navp"><a href="${pageContext.request.contextPath}/UserReco/UserRecoList"><i class="fa fa-home fa-fw"></i>유저추천</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<!-- 관리자 로그아웃 -->
        <li><a href="${pageContext.request.contextPath}/member/memberLogout?id=${member.id}"><span class="glyphicon glyphicon-log-in"></span>LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>
