<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title>${boardTitle} 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/logo/logo.png" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardList.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
			<div class="call_quick">
				<div class="title">
					<h2>고객센터</h2>
				</div>
				<ul>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call1.png">아이디/<br>패스워드 찾기</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call2.png">상담내역<br>확인</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call3.png">티켓<br>예매문의</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call4.png">티켓<br>환불문의</a></li>
					<li class="qmenu"><a href=""><img src="${pageContext.request.contextPath}/resources/images/callcenter/call5.png">티켓<br>수령문의</a></li>
				</ul>
			</div>
			<div class="call_container">
				<ul class="call_menu">
					<li class="cmenu1"><a href="${pageContext.request.contextPath}/callcenter/main">고객센터 홈</a></li>
					<li class="cmenu2"><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
					<li class="cmenu3"><a href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
					<li class="cmenu4"><a href="">예매안내</a></li>
					<li class="cmenu5"><a href="">결제수단안내</a></li>
					<li class="cmenu6"><a href="${pageContext.request.contextPath}/callcenter/cancel">환불안내</a></li>
					<li class="cmenu7"><a href="${pageContext.request.contextPath}/callcenter/legalguide">부정이용 규제안내</a></li>
					<li class="cmenu8"><a href="${pageContext.request.contextPath}/callcenter/ticketguide">티켓판매안내</a></li>
				</ul>
				<div class="call_cont">
				<div class="board_h3">
				<div class="boardwrite">
					<c:if test="${member.grade eq '3'}">
						<button id="boardWrite" value="${board}">${boardTitle} 글쓰기</button>
					</c:if>
				</div>
				<img alt="" src="${pageContext.request.contextPath}/resources/images/reco.png" class="titleimg"><h3>${boardTitle} 게시판</h3>
				</div>
				
				<%-- </c:if> --%>
				
		
				
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

						<!-- 관리자가 상단에 배치할 공지. pageMaker의 perPage에 영향 X. 밑에 중복. -->
						<c:if test="${board eq 'notice'}">
							<c:forEach items="${top}" var="top">
								<tr title="${top.num}" class="select mark">
									<td class="td10 selectRow" id="${top.num}">중요</td>
									<td style="text-overflow: ellipsis;">${top.title}</td>
									<td class="td10">${top.writer}</td>
									<td class="td10">${top.reg_date}</td>
									<td class="td10">${top.hit}</td>
								</tr>
							</c:forEach>
						</c:if>


						<!-- 일반 공지 리스트 -->
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
					<%-- <c:if test="${list[0].reg_date eq null}">
						<ul class="pagination">
							<li class="pagingClick"><a href="${board}List">검색결과가 없습니다</a></li>
						</ul>
					</c:if> --%>
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
				<form action="./${board}List" class="search_form">
					<select name="kind" class="search_select">
						<option value="0">전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<c:if test="${board eq 'after' or board eq 'qna'}">
							<option value="3">작성자</option>
						</c:if>
					</select> 
					<input type="text" placeholder="" name="search" class="search_input">
					<button id="searchButton">검색</button>
				</form>
				<%-- <c:if test="${member.grade eq 3}"> --%>
					
				</div>
			</div>
		</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
	<!-- ------script---------- -->
	<script type="text/javascript">
		/* 각 행 선택 시 select 페이지 이동 */
		$('.select').click(function() {
			var num = $(this).children('.selectRow').attr('id');
			location.href = "./${board}Select?num=" + num;
		});

		/* board 글쓰기 이동 */
		$('#boardWrite').click(function() {
			var board = $(this).val();
			location.href = "./" + board + "Write"
		});

		/* 테이블의 num 앞에 구분 문자 안보이게 */
		$('.selectRow').each(function() {
			var num = $(this).attr('id');
			num = num.substring(1);
			$(this).children('p').append(num);
		});
		
	</script>

</body>
</html>