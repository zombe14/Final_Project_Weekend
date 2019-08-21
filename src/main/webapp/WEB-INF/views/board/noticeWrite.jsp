<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle} 글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/noticeWrite.css">
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
					<img alt="" src="${pageContext.request.contextPath}/resources/images/reco.png" class="titleimg"><h3>${boardTitle} 글쓰기</h3>
					<div class="call_wrap">
				<form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
					<table class="table table-bordered">
							<tr class="write_title">
								<td class="td1"><label for="title">제목 <span class="r"> *</span></label></td>
								<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="title" class="required" id="title"></td>
							</tr>
							<tr class="write_writer">
								<td  class="td1"><label for="writer">작성자 <span class="r"> *</span></label></td>
								<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}" readonly="readonly" class="required" id="writer"></td>
							</tr>
							<tr>
								<td  class="td1"><label for="contents">내용 <span class="r"> *</span></label></td>
								<td><textarea rows="" cols="" name="contents" id="contents" class="required"></textarea></td>
							</tr>
							<c:if test="${board eq 'notice'}">
							<tr>
								<td  class="td1">
								<label for="check">상단 등록</label></td>
								<td>
									<div class="iCheckbox">
									<input type="checkbox" id="check" name="top" value="0">
									<label for="check">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 현재 개수 : </label><span id="topCount" title="${topCount}">${topCount} / 7 개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 상단에는 최대 7개까지 등록 가능합니다.</span>
									</div>
								</td>
							</tr>
							</c:if>
							<tr>
								<td class="td1"><label for="files">첨부파일</label></td>
								<td>
									<button type="button" id="addFiles" value="파일 추가"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일 추가 </button>
									<div id="filesDiv">
										<div>
											<input type="file" class="filelist" name="filelist" style="display: inline-block;">
											<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block;"></span>
										</div>
									</div>
								</td>
							</tr>
							
						</table>
							<input type="hidden" id="board" name="${board}">
							<a id="write" class="noticeWrite_btn">등록하기</a>
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

	<!-- 지도 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services"></script>
	<!-- 썸머노트 -->
	<script src="../resources/js/summernote.js"></script>
	<!-- script -->
	<script type="text/javascript">
		/* 첨부 파일 관리 */
		// 개수 제한. 최대 5개까지.
		var limit = 1;
		// 파일 추가
		$('#addFiles').click(function() {
			var addFiles = '<div>'
							+ '<input type="file" class="filelist" name="filelist" style="display: inline-block"> '
							+ '<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>'
						+ '</div>';
			if (limit < 5) {
				$('#filesDiv').append(addFiles);
				limit++
			} else {
				alert("최대 5개까지 첨부가능합니다.");
			}
		});
		/* 첨부 파일 관리 끝 */

		// 정적인 input 파일 제거
		$('.deleteFile').click(function() {
			$(this).parent().remove();
			limit--
		});

		// 동적으로 그려진 input file 제거
		$('#filesDiv').on('click', '.deleteFile', function() {
			$(this).parent().remove();
			limit--
		});

		//상단 배치 체크박스에 값 주기 ( 1: 등록하기 / 0: 등록안함)
		$('#check').click(function() {
			if ($(this).is(':checked')) {
				$(this).val(1);
			} else {
				$(this).val(0);
			}
		});
		
		// 조건
		$('#write').click(function() {
			if(
					$('#contents').val() != "" && 
					$('#title').val()!="" &&
					$('#writer').val()!=""
			  ){
				$('#frm').submit();
			} else {
				alert('필수(*)가 비었어요');
			}
		});
		
		// 상단 배치 개수 제한
		
			var topC = $('#topCount').attr('title');
			$('#top').hide();
			if(topC < 7){
				$('#top').show();
			}
		
		

	</script>
</body>
</html>