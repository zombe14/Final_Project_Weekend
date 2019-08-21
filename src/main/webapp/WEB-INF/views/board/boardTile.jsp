<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title>${boardTitle} List</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardTile.css">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<%-- <!-- 검색창 -->
				<div>
					<form action="./${board}List">
						<select name="kind">
							<option value="0">전체</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">지역</option>
						</select> 
						<input type="text" placeholder="검색어를 입력하세요" name="search">
						<button id="search">검색</button>
					</form>
				</div> --%>
				<div class="festi_header">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/festi1.png"><strong><c:if test="${category ne 2}">전체</c:if><c:if test="${category eq 2}">${region}</c:if></strong>
					<div class="boardTile_write">
						<a href="./${board}Write" class="festiList_btn">${boardTitle} 글쓰기</a>
					</div>
				</div>
				<div class="col-12">
					<c:forEach items="${list}" var="i">
						<div class="col-sm-3">
						<a href="./${board}Select?num=${i.num}">
							<div class="board_img">
								<div>
									<img alt="${i.fileDTOs[0].oname}" src="../resources/images/board/${i.fileDTOs[0].fname}">
								</div>
								<p>${i.title}</p>
								<p>${i.startDate}</p>
								<p>${i.endDate}</p>
								<p>${i.local}</p>
							</div>
						</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>