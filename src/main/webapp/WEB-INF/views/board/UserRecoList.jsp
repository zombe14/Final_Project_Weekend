<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 유저추천 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/userRecoList.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardList.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
      		<div class="conta">
  	      		<div class="user_wrap">
  	      			<div class="user_title">
  	      				<img alt="" src="${pageContext.request.contextPath}/resources/images/chat.png"><strong> 유저추천 </strong>
  	      			</div>
  	      			<div class="user_box">
  	      				<ul>
  	      					<li>
  	      						<strong>유저 추천 게시판</strong>
  	      					</li>
  	      					<li>
  	      						<p>
  	      							▷ &nbsp;&nbsp;이곳에 소개되어 있지 않은 전국 방방곡곡 축제들을 유저들끼리 서로 정보 공유하는 커뮤니티 공간입니다.
  	      						</p>
  	      					</li>
  	      				</ul>
  	      			</div>
  	      			
  	      			<div id="tableDiv">
					<!-- notice list 테이블 -->
					<table class="table">
						<thead class="table_head">
							<th class="td10">번호</th>
							<th class="td60">제목</th>
							<th class="td10">작성자</th>
							<th class="td10">작성일</th>
							<th class="td10">조회수</th>
						</thead>
  	      				<c:forEach items="${list}" var="list">
							<tr class="select">
								<td class="selectRow td10" id="${list.num}"><p></p></td>
								<td>${list.title}</td>
								<td class="td10">${list.writer}</td>
								<td class="td10">${list.reg_date}</td>
								<td class="td10">${list.hit}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="paging">
					<c:if test="${list[0].reg_date ne null}">
						<ul class="pagination">
							<c:choose>
								<c:when test="${pager.curBlock>1}">
									<li class="pagingClick"><a href="${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="pagingo"><a>이전</a></li>
								</c:otherwise>
							</c:choose>
	
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
								var="i">
								<li class="pagingClick"><a href="${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							</c:forEach>
	
							<c:choose>
								<c:when test="${pager.curBlock < pager.totalBlock}">
									<li class="pagingClick"><a href="${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="pagingo"><a>다음</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:if>
				</div>
				
				
  	      						<!-- 검색창 -->
				<form action="./UserRecoList" class="search_form">
					<select name="kind" class="search_select">
						<option value="0">전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select> 
					<input type="text" placeholder="" name="search" class="search_input">
					<button id="searchButton">검색</button>
				</form>
				<c:if test="${member.grade eq 1 }">
				<div class="boardwrite">
						<a id="write" class="userRecoList_btn" href="./UserRecoWrite">글쓰기</a>
				</div>
				</c:if>
  	  	     	 </div>
      		</div>
    	</div>
		<div id="footer">
    		<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
<script type="text/javascript">
		/* 테이블의 num 앞에 구분 문자 안보이게 */
		$('.selectRow').each(function() {
			var num = $(this).attr('id');
			num = num.substring(1);
			$(this).children('p').append(num);
		});
		
		/* 각 행 선택 시 select 페이지 이동 */
		$('.select').click(function() {
			var num = $(this).children('.selectRow').attr('id');
			location.href = "./UserRecoSelect?num="+num;
		});
		
	
	</script>
</body>
</html>