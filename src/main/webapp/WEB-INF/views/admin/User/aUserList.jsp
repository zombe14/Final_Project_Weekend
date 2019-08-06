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
	<script type="text/javascript">
		$(function() {
			$(".pBtn").on("click", function() {
						var id = $(this).attr("id");
						var grade = $(this).attr("title");
						var check = confirm("아이디 : " + id + "\n" + "등급 : "
								+ grade + "\n" + "등급을 올리시겠습니까?");
						if (check) {
							if (grade == 3) {
								alert("더 이상 등급을 올릴수 없습니다.");
							} else {
								location.href = "../admin/aUserUpdateP?id="+id;
							}
						}
					});
			$(".mBtn").on("click", function() {
						var id = $(this).attr("id");
						var grade = $(this).attr("title");
						var check = confirm("아이디 : " + id + "\n" + "등급 : "
								+ grade + "\n" + "등급을 내리시겠습니까?");
						if (check) {
							if (grade == 1) {
								alert("더 이상 등급을 내릴수 없습니다.");
							} else {
								location.href = "../admin/aUserUpdateM?id="+id;
							}
						}
					});
			$(".dBtn").on("click", function() {
				var id = $(this).attr("id");
				var check = confirm("해당 유저를 삭제하시겠습니까?");
				if (check) {
					location.href = "../admin/aUserDelete?id="+id;
				}
			});
		});
	</script>
	<div class="totalBody">
		<c:import url="../../inc/admin_header.jsp" />
		<!-- left bar 시작 -->
		<div class="container-fluid text-center">
			<div class="row content">
				<!-- side bar -->
				<c:import url="../../inc/admin_left_bar.jsp" />
				<div class="col-sm-10">
					<h4>
						<small>${board} 관리</small>
					</h4>
					<hr>
					<!-- 검색창 -->
					<div>
						<form class="form-inline" action="./a${board}List">
							<div class="form-group col-xs-2">
								<select class="form-control" name="kind">
									<option value="1">ID</option>
									<option value="2">NAME</option>
									<option value="3">GRADE</option>
								</select>
							</div>
							<div class="form-group col-xs-2">
								<input type="text" class="form-control" value="${pager.search}" name="search">
							</div>
							<div class="form-group col-xs-2">
								<button class="form-control">Search</button>
							</div>

						</form>
					</div>
					<div class="container col-sm-12">
						<table class="table table-hover">
							<tr>
								<td>ID</td>
								<td>NICKNAME</td>
								<td>NAME</td>
								<td>AGE</td>
								<td>EMAIL</td>
								<td>GRADE</td>
								<td>가입일</td>
								<td>기능</td>
								<td>유저 삭제</td>
							</tr>
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.id}</td>
									<td>${dto.nickname}</td>
									<td>${dto.name}</td>
									<td>${dto.age}</td>
									<td>${dto.email}</td>
									<c:choose>
										<c:when test="${dto.grade eq 1}">
											<td>일반 회원</td>
										</c:when>
										<c:when test="${dto.grade eq 2}">
											<td>공연 관계자</td>
										</c:when>
										<c:otherwise>
											<td>관리자</td>
										</c:otherwise>
									</c:choose>
									<td>${dto.reg_date}</td>
									<td><input class="pBtn" type="button" value="UP" title='${dto.grade}' id='${dto.id}'></td>
									<td><input class="mBtn" type="button" value="DOWN" title='${dto.grade}' id='${dto.id}'></td>
									<td><input class="dBtn" type="button" value="삭제" id='${dto.id}'></td>
								</tr>
							</c:forEach>
						</table>
						<div id="paging">
							<c:if test="${list[0].id eq null}">
								<ul class="pagination">
									<li class="pagingClick"><a href="a${board}List">결과가 없습니다</a></li>
								</ul>
							</c:if>
							<c:if test="${list[0].id ne null}">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pager.curBlock>1}">
											<li class="pagingClick"><a href="a${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
										</c:when>
										<c:otherwise>
											<li><a>이전</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="pagingClick"><a href="a${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:choose>
										<c:when test="${pager.curBlock < pager.totalBlock}">
											<li class="pagingClick"><a href="a${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
										</c:when>
										<c:otherwise>
											<li><a>다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</c:if>
						</div>

					</div>
				</div>
			</div>
		</div>
		<footer class="container-fluid">
			<p>Footer Text</p>
		</footer>
	</div>
</body>
</html>