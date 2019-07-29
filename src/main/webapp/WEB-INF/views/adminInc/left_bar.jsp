<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-3 sidenav">
	<ul class="nav nav-pills nav-stacked">
		<c:choose>
			<c:when test="${board eq 'Notice'}">
				<li><a href="./adminBoardNoticeList">공지사항</a></li>
				<li><a href="./adminBoardFestiList">페스티벌</a></li>
				<li><a href="./adminBoardShowList">공연</a></li>
				<li><a href="./adminBoardFestiAfterList">페스티벌 후기</a></li>
				<li><a href="./adminBoardShowAfterList">공연 후기</a></li>
				<li><a href="./adminBoardRecommendList">관리자 추천</a></li>
				<li><a href="./adminBoardQnaList">QnA</a></li>
			</c:when>
			<c:when test="${board eq 'User'}">
				<li><a href="#">모든 유저</a></li>
				<li><a href="#">Level no.1</a></li>
				<li><a href="#">Level no.2</a></li>
			</c:when>
			<c:when test="${board eq 'Reser'}">
				<li><a href="#">예약 현황</a></li>
				<li><a href="#">몰라</a></li>
				<li><a href="#">뭐넣지?</a></li>
			</c:when>
		</c:choose>
	</ul>
	<br>
	<div class="input-group">
		<input type="text" class="form-control" placeholder="이걸 쓸까 말까..">
		<span class="input-group-btn">
			<button class="btn btn-default" type="button">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</span>
	</div>
</div>
<br>
