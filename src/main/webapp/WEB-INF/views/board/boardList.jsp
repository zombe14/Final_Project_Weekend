<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
   <title> 자신이 작성할 JSP 명을 입력하세요 </title>
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
				</select> <input type="text" placeholder="검색어를 입력하세요" name="search">
				<button id="search">검색</button>
			</form>

			<!-- notice list 테이블 -->
			<table>
				<thead>
					<th>NUM</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</thead>
				<!-- 관리자가 상단에 배치할 공지. pageMaker의 perPage에 영향 X. 밑에 중복. -->
				<c:forEach items="${top}" var="top">
					<tr title="${top.num}" class="select">
						<td>중요</td>
						<td>${top.title}</td>
						<td>${top.writer}</td>
						<td>${top.reg_date}</td>
						<td>${top.hit}</td>
					</tr>
				</c:forEach>


				<!-- 일반 공지 리스트 -->
				<c:forEach items="${list}" var="list">
					<tr title="${list.num}" class="select">
						<td>${list.num}</td>
						<td>${list.title}</td>
						<td>${list.writer}</td>
						<td>${list.reg_date}</td>
						<td>${list.hit}</td>
					</tr>
				</c:forEach>

			</table>			

			<c:if test="${list[0].num eq null}">
				<ul class="pagination">
					<li><a href="${board}List">검색결과가 없습니다</a></li>
				</ul>
			</c:if>
			<c:if test="${list[0].num ne null}">
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
			location.href = "./${board}Select?num=" + $(this).attr('title');
		});
	</script>
</body>
</html>