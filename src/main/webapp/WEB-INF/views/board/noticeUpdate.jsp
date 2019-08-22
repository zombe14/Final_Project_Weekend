<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/summernote.jsp" />
<title>${boardTitle} 글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/noticeWrite.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />

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
						<li class="qmenu"><a
							href="${pageContext.request.contextPath}/callcenter/infosearch"><img
								src="${pageContext.request.contextPath}/resources/images/callcenter/call1.png">아이디/<br>패스워드
								찾기</a></li>
						<li class="qmenu"><a href="#"><img
								src="${pageContext.request.contextPath}/resources/images/callcenter/call2.png">상담내역<br>확인</a></li>
						<li class="qmenu"><a
							href="${pageContext.request.contextPath}/callcenter/reservation"><img
								src="${pageContext.request.contextPath}/resources/images/callcenter/call3.png">티켓<br>예매문의</a></li>
						<li class="qmenu"><a
							href="${pageContext.request.contextPath}/callcenter/cancel"><img
								src="${pageContext.request.contextPath}/resources/images/callcenter/call4.png">티켓<br>환불문의</a></li>
						<li class="qmenu"><a
							href="${pageContext.request.contextPath}/callcenter/receive"><img
								src="${pageContext.request.contextPath}/resources/images/callcenter/call5.png">티켓<br>수령문의</a></li>
					</ul>
				</div>
				<div class="call_container">
					<ul class="call_menu">
						<li class="cmenu1"><a
							href="${pageContext.request.contextPath}/callcenter/main">고객센터
								홈</a></li>
						<li class="cmenu2"><a
							href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
						<li class="cmenu3"><a
							href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
						<li class="cmenu4"><a
							href="${pageContext.request.contextPath}/callcenter/reservation">예매안내</a></li>
						<li class="cmenu5"><a
							href="${pageContext.request.contextPath}/callcenter/payment">결제수단안내</a></li>
						<li class="cmenu6"><a
							href="${pageContext.request.contextPath}/callcenter/cancel">환불안내</a></li>
						<li class="cmenu7"><a
							href="${pageContext.request.contextPath}/callcenter/legalguide">부정이용
								규제안내</a></li>
						<li class="cmenu8"><a
							href="${pageContext.request.contextPath}/callcenter/ticketguide">티켓판매안내</a></li>
					</ul>
					<div class="call_cont">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/reco.png" class="titleimg"><h3>${boardTitle}글 수정</h3>
						<div class="call_wrap">
							<form action="./${board}Update" method="post"
								enctype="multipart/form-data" id="frm">
								<table class="table table-bordered">
									<tr class="update_title">
										<td class="td1"><label for="title">제목 <span class="r">
													*</span></label></td>
										<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="title" class="required"
											id="title" value="${dto.title}"></td>
									</tr>
									<tr class="update_writer">
										<td class="td1"><label for="writer">작성자 <span class="r">
													*</span></label></td>
										<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer"
											value="${dto.writer}" readonly="readonly" class="required"
											id="writer"></td>
									</tr>
									<tr>
										<td class="td1"><label for="contents">내용 <span class="r">
													*</span></label></td>
										<td><textarea rows="" cols="" name="contents"
												id="contents" class="required">${dto.contents}</textarea></td>
									</tr>

									<tr>
										<td class="td1"><label for="check">상단 등록</label></td>
										<td><input type="checkbox" id="check" name="top"
											value="${dto.top}"> 
											<label for="check">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 현재 개수 : </label>
											<span id="topCount" title="${topCount}">${topCount}
												/ 7 개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 상단에는 최대 7개까지 등록 가능합니다.</span>
										</td>
									</tr>

									<tr>
										<td class="td1"><label for="files">첨부파일</label></td>
										<td>
											<!-- <hr> 추가 할 파일들 -->
											<button type="button" id="addFiles" value="파일 추가"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일 추가 </button>
											<!-- 이미 있는 파일들 -->
											<div id="filed">
												<input type="hidden" id="fileCount"
													value="${dto.fileDTOs.size()}">
												<c:forEach items="${dto.fileDTOs}" var="f">
													<c:if test="${f.oname ne null}">
														<div class="fileDTOsDiv">
															<p style="display: inline-block;">${f.oname}</p>
															<span class="glyphicon glyphicon-remove deleteFile"
																id="${f.fnum}" title="${f.fname}"
																style="display: inline-block;"></span>
														</div>
													</c:if>
												</c:forEach>
											</div>
											<div class="filesDiv"></div> 
										</td>
									</tr>

								</table>

								<input type="hidden" name="num" value="${dto.num}"> <a
									id="write" class="btn btn-default noticeUpdate_btn">등록하기</a>
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
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
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
		var fileCount = $('#fileCount').val();
		fileCount *= 1;		
		var limit = fileCount;
		
		// 파일 추가
		$('#addFiles').click(function() {
			var addFiles = '<div>'
							+ '<input type="file" class="filelist" name="filelist" style="display: inline-block"> '
							+ '<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>'
				 		 + '</div>';
			if (limit < 5) {
				$('.filesDiv').append(addFiles);
				limit++
				
			} else {
				alert("최대 5개까지 첨부가능합니다.");
			}
		});
		
		/* 첨부 파일 관리 끝 */

		// 정적인 input 파일 제거
		$('.deleteFile').click(function() {
			var con = confirm('삭제하시겠습니까? 복구가 불가능합니다.');
			if(con){
				var fnum = $(this).attr('id');
				var fname = $(this).attr('title');
				var selector = $(this);
				$.ajax({
					url:"../ajax/fileDelete",
					type:'post',
					data:{
						fnum:fnum,
						fname:fname,
						board:'board'
					},
					success:function(data){
						data = data.trim();
						if(data == '1'){
							selector.parent().remove();
							selector.prev().remove();
							selector.remove();
							limit--;
						} else {
							alert('삭제 할 수 없습니다.');
						}
					}
				});		
			}
		});

		// 동적으로 그려진 input file 제거
		$('.filesDiv').on('click', '.deleteFile', function() {
			$(this).parent().remove();
			limit--
		});

		//상단 배치 체크박스에 값 주기 ( 1: 등록하기 / 0: 등록안함)
		if($('#check').val() == 1){
			$('#check').attr('checked','checked')
		}
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
		if('${board}' == 'notice'){
			var topC = $('#topCount').attr('title');
			$('#top').hide();
			if(topC < 7){
				$('#top').show();
			}
		}
		
		
		
		
		

	</script>
</body>
</html>