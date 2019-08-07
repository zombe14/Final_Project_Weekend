<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${board}관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 관리자용 bootstrap -->
<c:import url="../temp/adminBoot.jsp" />
<!-- 관리자용 css -->
<c:import url="../../../resources/css/adminBoard.css" />
</head>
<body>
<script type="text/javascript">
	$(function () {
		$(".dBtn").on("click",function(){
			var id = $(this).attr("id");
			var check = confirm("이 글을 삭제하시겠습니까?");
			if(check){
				$.post("../admin/aNoticeDelete",
						{num:id},
						function () {
							alert("삭제되었습니다.");
							location.href="../admin/aNoticeList";
						})
			}else{
				alert("삭제 실패하였습니다.");
			}
		});
	});
</script>
	<div class="totalBody">
		<!-- header.jsp -->
		<c:import url="../inc/admin_header.jsp" />
		<div class="container-fluid text-center">
			<div class="row content">
				<!-- side bar -->
				<c:import url="../inc/admin_left_bar.jsp" />
				<div class="col-sm-10">
					<h4>
						<small>${board} 관리</small>
					</h4>
					<hr>
					<div>
						<form class="form-inline" action="./a${board}List">
							<div class="form-group col-xs-2">
								<select class="form-control" name="kind">
									<option class="k" value="1">제목</option>
									<option class="k" value="2">내용</option>
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
								<td>NUM</td>
								<td>TITLE</td>
								<td>WRITER</td>
								<td>DATE</td>
								<td>HIT</td>
								<td>기능</td>
							</tr>
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.num}</td>
									<td>${dto.title}</td>
									<td>${dto.writer}</td>
									<td>${dto.reg_date}</td>
									<td>${dto.hit}</td>
									<td><input type="button" value="삭제" class="dBtn" id="${dto.num}"/>
								</tr>
							</c:forEach>
						</table>
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
			<p>이곳엔 무엇을 넣어야 할 것인가?</p>
		</footer>
	</div>
</body>
</html>