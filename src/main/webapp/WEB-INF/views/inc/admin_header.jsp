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
		<li id="navbar-page" class="navp"><a href="${pageContext.request.contextPath}/admin/aUserList"><i class="fa fa-home fa-fw"></i>유저 관리</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/admin/aNoticeList"><i class="fa fa-home fa-fw"></i>게시글 관리</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/admin/aEnjoyList"><i class="fa fa-home fa-fw"></i>공연 관리</a></li>
		<li id="navbar-page" class="navp navp1"><a href="${pageContext.request.contextPath}/admin/aReserList"><i class="fa fa-home fa-fw"></i>티켓 관리</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<!-- 관리자 로그아웃 -->
        <li><a href="${pageContext.request.contextPath}/member/memberLogout?id=${member.id}"><span class="glyphicon glyphicon-log-in"></span>LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>
