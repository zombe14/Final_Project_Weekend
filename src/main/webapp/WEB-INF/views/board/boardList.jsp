<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
   <title> ${boardTitle} </title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
   <link rel="shortcut icon" type="image/x-icon" href="../resources/images/logo/logo.png" />
</head>
<body>
<div id="wrap">
   <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
   </div>
   <div id="container">
      <div class="inner">
			<!-- 검색창 -->
			<form action="./${board}List">
				<select name="kind">
					<option value="0">전체</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<c:if test="${board eq 'after' or board eq 'qna'}">
						<option value="3">작성자</option>
					</c:if>
				</select> <input type="text" placeholder="검색어를 입력하세요" name="search">
				<button id="search">검색</button>
			</form>

			<!-- notice list 테이블 -->
			<table class="table table-hover">
				<thead>
					<th style="width: 10%;">NUM</th>
					<th style="width: 60%;">TITLE</th>
					<th style="width: 10%;">WRITER</th>
					<th style="width: 10%;">DATE</th>
					<th style="width: 10%;">HIT</th>
				</thead>
				<!-- 관리자가 상단에 배치할 공지. pageMaker의 perPage에 영향 X. 밑에 중복. -->
				<c:if test="${board eq 'notice'}">
					<c:forEach items="${top}" var="top">
						<tr title="${top.num}" class="select" style="background-color: #41b40a17;">
							<td>중요</td>
							<td>${top.title}</td>
							<td>${top.writer}</td>
							<td>${top.reg_date}</td>
							<td>${top.hit}</td>
						</tr>
					</c:forEach>
				</c:if>


				<!-- 일반 공지 리스트 -->
				<c:forEach items="${list}" var="list">
					<tr class="select">
						<c:if test="${board eq 'notice' or board eq 'qna'}">
							<td class="selectRow" id="${list.num}">${list.num}</td>						
						</c:if>
						<c:if test="${board eq 'after' or board eq 'afterAll'}">
							<td class="selectRow" id="${list.anum}">${list.anum}</td>						
						</c:if>
						<td>${list.title}</td>
						<td>${list.writer}</td>
						<td>${list.reg_date}</td>
						<td>${list.hit}</td>
					</tr>
				</c:forEach>

			</table>			

			<c:if test="${list[0].reg_date eq null}">
				<ul class="pagination">
					<li><a href="${board}List">검색결과가 없습니다</a></li>
				</ul>
			</c:if>
			<c:if test="${list[0].reg_date ne null}">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pager.curBlock>1}">
						<li><a href="${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
					</c:when>
					<c:otherwise>
						<li><a>이전</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><a href="${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${pager.curBlock < pager.totalBlock}">
						<li><a href="${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
					</c:when>
					<c:otherwise>
						<li><a>다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</c:if>
			<a href="./${board}Write">${board}Write</a>
			
		   </div>
   </div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>

	<!-- ------script---------- -->
	<script type="text/javascript">
		$('.select').click(function() {
			var num = $(this).children('.selectRow').attr('id');
			location.href = "./${board}Select?num=" + num;
		});
	</script>
</body>
</html>