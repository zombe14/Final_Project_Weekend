<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>유저 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../../temp/adminBoot.jsp" />
<c:import url="../../../../resources/css/adminBoard.css" />
</head>
<body>
	<c:import url="../../inc/admin_header.jsp" />
	<!-- left bar 시작 -->
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- side bar -->
			<c:import url="../../inc/admin_left_bar.jsp" />
			<div class="col-sm-9">
				<h4>
					<small>${board} 관리</small>
				</h4>
				<hr>
				<div>
					<form class="form-inline" action="./${board}List">
						<div class="form-group col-xs-2">
							<select class="form-control" name="kind">
								<option class="k" value="1">Title</option>
								<option class="k" value="2">Writer</option>
								<option class="k" value="3">Contents</option>
							</select>
						</div>

						<div class="form-group col-xs-2">
							<input type="text" class="form-control" value="${pager.search}"
								name="search">
						</div>

						<div class="form-group col-xs-2">
							<button class="form-control">Search</button>
						</div>

					</form>
				</div>
				<div class="container">
					<table class="table table-hover">
						<tr>
							<td>ID</td>
							<td>NICKNAME</td>
							<td>NAME</td>
							<td>AGE</td>
							<td>EMAIL</td>
							<td>PHONE</td>
							<td>GRADE</td>
							<td>권한 수정</td>
							<td>유저 삭제</td>
						</tr>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.id}</td>
								<td>${dto.nickname}</td>
								<td>${dto.name}</td>
								<td>${dto.age}</td>
								<td>${dto.email}</td>
								<td>${dto.phone}</td>
								<td>${dto.grade}</td>
								<td><input id="uBtn" type="button" value="권한수정"></td>
								<td><input id="dBtn" type="button" value="유저삭제"></td>
							</tr>
						</c:forEach>
					</table>
					<!-- Pageing -->
					<ul class="pagination">
						<c:if test="${pager.curBlock>1}">
							<li><a href="./a${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">BACK</a></li>
						</c:if>

						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i">
							<li><a href="./a${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>

						<c:if test="${pager.curBlock<pager.totalBlock}">
							<li><a href="./a${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">NEXT</a></li>
						</c:if>
					</ul>
					<%-- 					<ul class="pagination">
						<c:choose>
							<c:when test="${pager.curBlock>1}">
								<li><a
									href="a${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
							</c:when>
							<c:otherwise>
								<li><a>이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i">
							<li><a
								href="a${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pager.curBlock < pager.totalBlock}">
								<li><a
									href="a${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
							</c:when>
							<c:otherwise>
								<li><a>다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul> --%>
				</div>
			</div>
		</div>
	</div>
	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>
</body>
</html>