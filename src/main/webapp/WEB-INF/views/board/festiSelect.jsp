<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${boardTitle}]${dto.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiSelect.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />

<!-- 작은 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript" src="../resources/js/calendar.js"></script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<div class="festi_top">
				<!-- 축제 핵심 내용 -->
				<div class="festi_wrap">
					<div class="bx_title">
					<strong>${dto.title}</strong>
					<a href="./${board}List?category=${dto.category}"><img alt="리스트 아이콘" src="../resources/images/festi/list.png"> </a>
					</div>
					<div class="detail_info">
						<div class="bx_img">
							<img alt="${dto.fileDTOs[0].oname}" src="../resources/images/board/${dto.fileDTOs[0].fname}">
						</div>
						<div class="btc_info">
							<dl>
								<dt class="bit">장소</dt>
								<dd class="bid">${dto.local}</dd>
								<dt class="bit">기간</dt>
								<dd class="bid">${dto.startDate} ~ ${dto.endDate}</dd>
								<dt class="bit">가격</dt>
								<dd class="bid">${dto.price} 원</dd>
								<dt class="bit">총 좌석</dt>
								<dd class="bid">${dto.total} 좌석</dd>
							</dl>
							
							<div class="btc_file">
							<em>파일 다운로드 : </em>
							<c:forEach items="${dto.fileDTOs}" var="f">
								<input type="button" title="${f.fname}" class="down" value="${f.oname}"> 
							</c:forEach>
							</div>
						</div>
					</div>
					<!-- 날짜 정하는 div -->
					<div class="detail_info_right">
						<input type="text" name="date" id="date1" size="12" />
						<dl class="doline_x">
							<dt>예매가능 회차</dt>
							<dd>
								<select class="festi_select">
									<option>10:00</option>
									<option>11:00</option>
								</select>
							</dd>
						</dl>
						<div class="reserve_button"><a href="#">예매하기</a></div>
						<div class="admin_button">
							<a href="./${board}Update?num=${dto.num}">수정</a> 
							<a id="delete">삭제</a>
						</div>
					</div>
				</div>
			</div>
				<div class="festi_detail">
						<c:import url="../inc/festi_detail.jsp"></c:import>
				</div>
				<!-- 내용 끝 -->
				
					<!-- ajax 파일 다운로드 -->
							<div style="display:none;">
								<form action="../ajax/fileDownload" method="post" id="downForm">
									<input type="text" name="fname" id="fname">
									<input type="text" name="oname" id="oname">
									<input type="text" name="board" value="board">
								</form>
							</div>
				<!-- ajax 파일 다운로드 끝 -->
				
				
				<a href="../after/afterWrite?num=${dto.num}">후기 작성</a>
				<%-- <c:if test="${member.grade > 1}"> --%> 
				<%-- </c:if> --%>
				
				<!--  후기 -->
				<table>
					<thead>
						<th>NUM</th>
						<th>TITLE</th>
						<th>Writer</th>
						<th>DATE</th>
						<th>hit</th>
					</thead>
					<c:forEach items="${after}" var="i">
						<tr title="${i.anum}" class="afterSel">
							<td>${i.anum}</td>
							<td>${i.title}</td>
							<td>${i.writer}</td>
							<td>${i.reg_date}</td>
							<td>${i.hit}</td>
						</tr>					
					</c:forEach>
				</table>
   		</div>
	</div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>
	
	<!-- script -->
	<script type="text/javascript">
	/* 글 삭제 */
	$('#delete').click(function() {
		var check = confirm('삭제하시겠습니까?');
		if(check){
			
			location.href="./${board}Delete?num=${dto.num}";
		}
	});
	
	/* 첨부파일 다운로드 */
	$('.down').click(function() {
		var fname=$(this).attr('title');
		var oname=$(this).val();
		$('#fname').val(fname);
		$('#oname').val(oname);
		$('#downForm').submit();
	});
	
	/* 후기 보기 */
	$('.afterSel').click(function() {
		location.href="../after/afterSelect?num="+$(this).attr('title');
	});

</script>

</body>
</html>