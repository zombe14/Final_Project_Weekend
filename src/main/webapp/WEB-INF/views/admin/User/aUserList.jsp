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
				<div>
					<form class="form-inline" action="./${board}List">
						<div class="form-group col-xs-2">
							<select class="form-control" name="kind">
								<option class="k" value="1">ID</option>
								<option class="k" value="2">NAME</option>
								<option class="k" value="3">GRADE</option>
								<option class="k" value="4">가입일</option>
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
				<div class="container col-sm-12">
					<table class="table table-hover">
						<tr>
							<td>ID</td>
							<td>NICKNAME</td>
							<td>NAME</td>
							<td>AGE</td>
							<td>EMAIL</td>
							<td>GRADE</td>
							<td>등급</td>
							<td></td>
							<td>유저 삭제</td>
						</tr>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.id}</td>
								<td>${dto.nickname}</td>
								<td>${dto.name}</td>
								<td>${dto.age}</td>
								<td>${dto.email}</td>
								<td>${dto.grade}</td>
								<td><input id="pBtn" type="button" value="U  P" title='${dto.grade}' name='${dto.id}'></td>
								<td><input id="mBtn" type="button" value="DOWN"></td>
								<td><input id="dBtn" type="button" value="유저삭제" name='${dto.id}'></td>
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
				</div>
			</div>
		</div>
	</div>
	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>
</div>
<script type="text/javascript">
/* 	$("#pBtn").click(function(){
		var check = confirm("등급을 올리시겠습니까?");
		if(check){
			var id = $(this).attr("name");
				alert(id);
				success:function(data){
					location.href="../admin/aUserUpdateP="+id
					data=data.trim();
					if(data=='1'){
						alert("성공");
					}else{
						alert("실패");
					}
				}
		}
	}); */
	$("#dBtn").click(function () {
		var id = $(this).attr('name');
		alert(id)
		var check = confirm("해당 유저를 정말 삭제하시겠습니까?");
			if(check){
				alert("if 온")
				location.href="../admin/aUserDelete";
				}
	});
</script>
</body>
</html>