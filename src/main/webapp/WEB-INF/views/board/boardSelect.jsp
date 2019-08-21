<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${boardTitle}]${dto.title}</title>
<c:import url="../temp/boot.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardSelect.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
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
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/infosearch"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call1.png">아이디/<br>패스워드 찾기</a></li>
					<li class="qmenu"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call2.png">상담내역<br>확인</a></li>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/reservation"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call3.png">티켓<br>예매문의</a></li>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/cancel"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call4.png">티켓<br>환불문의</a></li>
					<li class="qmenu"><a href="${pageContext.request.contextPath}/callcenter/receive"><img src="${pageContext.request.contextPath}/resources/images/callcenter/call5.png">티켓<br>수령문의</a></li>
				</ul>
			</div>
			<div class="call_container">
				<ul class="call_menu">
					<li class="cmenu1"><a href="${pageContext.request.contextPath}/callcenter/main">고객센터 홈</a></li>
					<li class="cmenu2"><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
					<li class="cmenu3"><a href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
					<li class="cmenu4"><a href="${pageContext.request.contextPath}/callcenter/reservation">예매안내</a></li>
					<li class="cmenu5"><a href="${pageContext.request.contextPath}/callcenter/payment">결제수단안내</a></li>
					<li class="cmenu6"><a href="${pageContext.request.contextPath}/callcenter/cancel">환불안내</a></li>
					<li class="cmenu7"><a href="${pageContext.request.contextPath}/callcenter/legalguide">부정이용 규제안내</a></li>
					<li class="cmenu8"><a href="${pageContext.request.contextPath}/callcenter/ticketguide">티켓판매안내</a></li>
				</ul>
				<div class="call_cont">
					<div class="board_h3">
						<h3>${boardTitle} 게시판</h3>
					</div>
					<div class="call_wrap">
						<div class="tableDiv">
						<table class="table" style="width: 100%">
							<thead class="table_head">
								<tr>
									<th class="td1">
										<div>${fn:substring(dto.num, 1,9)}</div>
									</th>
									<th class="td2">
										<div>${dto.title}</div>
									</th>
									<th class="td1">
										<div>${dto.writer}</div>
									</th>
									<th class="td1">
										<div>${dto.reg_date}</div>
									</th>
									<th class="td1">
										<div>조회 : ${dto.hit}</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">
										<div class="dt1">								
											${dto.contents}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
				
				<c:forEach items="${dto.fileDTOs}" var="f">
					<input type="button" title="${f.fname}" class="down" value="${f.oname}"> 
				</c:forEach>
				
				<div style="display:none;">
					<form action="../ajax/fileDownload" method="post" id="downForm">
						<input type="text" name="fname" id="fname">
						<input type="text" name="oname" id="oname">
						<input type="text" name="board" value="board">
					</form>
				</div>			
				
				<a id="list" class="boardSelect_btn"title="${board}" class="${dto.num}">목록</a>
				<c:if test="${member.grade eq '3'}">
					<a id="update" class="${board} boardSelect_btn">수정</a> 
					<a id="delete" class="${board} boardSelect_btn">삭제</a>
				</c:if>


				<form action="./${board}Delete" id="deleteFrm" method="post">
				
					<input type="hidden" class="num" id = "${dto.num}" name="num" value="${dto.num}">
				
				</form>
				
			</div>
		</div>
		</div>
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
			$('#deleteFrm').submit();
		}
	});
	
	/* 글 수정 */
	$('#update').click(function() {
		var board = $(this).attr('class');
		var num = $('.num').attr('id');
		location.href="./${board}Update?num="+num;
	});
	
	/* 첨부파일 다운로드 */
	$('.down').click(function() {
		var fname=$(this).attr('title');
		var oname=$(this).val();
		$('#fname').val(fname);
		$('#oname').val(oname);
		$('#downForm').submit();
	});
	
	/* 목록 */
	$('#list').click(function() {
		var list = "";
		var board = $(this).attr('title');
		var num = $(this).attr('class');
		if(board == 'after'){
			list = "../festi/festiSelect?num="+num;		
		} else if (board == 'notice'||'qna'){
			list = "./"+board+"List";
		}
		location.href = list;
	});
	/* 
	if('${board}' == 'qna'){
		$('#replyWrite').click(function() {
			if($('#replyContents').val() == ""){
				alert('내용을 입력해주세요');
			} else {
				$.ajax({
					url:'./${board}ReplyWrite'
				});
			}
		});
	} */
	if('${board}' == 'qna'){
		$('#replyBtn').click(function() {
			console.log('click');
			location.href = "./${board}ReplyWrite?num=${dto.num}";
		});
	}
	
</script>
</body>
</html>