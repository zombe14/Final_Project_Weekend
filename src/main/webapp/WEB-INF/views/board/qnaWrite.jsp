<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle}Write</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qnaWrite.css">
<!-- date picker -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- date picker -->
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
					<h3>${boardTitle} 글쓰기</h3>
					<div class="call_wrap">
				<form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
				 <c:if test="${board eq 'qnaReply'}">
				 
					<%-- <p>원글 제목 : ${qnaOrigin.title}</p>
					<p>원글 글쓴이 : ${qnaOrigin.writer}</p>
					<p>ref:${qnaOrigin.num}</p> --%>
					<input type="hidden" name ="ref" value="${qnaOrigin.num}">
				</c:if> 
				<table class="table table-bordered">
					<tr class="write_title">
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png">
						<c:if test="${board eq 'qna'}">
							<input type="text" name="title" id="title">
						</c:if>
						<c:if test="${board eq 'qnaReply'}">
							<input type="text" name="title" id="title" value="${qnaOrigin.title} 답변입니다.">
						</c:if>
						</td>
					</tr>
					<tr class="write_writer">
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.id}memberId" readonly="readonly"></td>
					</tr>
					<tr>
						<td  class="td1"><label for="contents">내용<span>*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents"></textarea></td>
					</tr>
					<tr>
						<td class="td1"><label for="files">첨부파일</label></td>
						<td>
							<button type="button" id="addFiles" value="파일 추가"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">항목 추가 </button>
						<div id="files">
							<div>
								<input type="file" class="filelist" name="filelist" style="display: inline-block"> 
								<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
							</div>
						</div>
						</td>
					</tr>
					<tr>
					<c:if test="${board eq 'qna'}">
						<td class="td1">
							<label for="pw">비밀번호</label> 
						</td>
						<td>
							<input type="radio" class="pwSel" name="secret" id="nonSecret" checked="checked"> <label>공개글</label>
							<input type="radio" class="pwSel" name="secret" id="secret"> <label>비밀글</label>
							<input type="password" name="pw" id="pw" class="pwpw" placeholder="질문글과 답변을 볼 때 사용 할 비밀번호를 입력해주세요">
						</td>
					</c:if>
					<c:if test="${board eq 'qnaReply'}">
						<td class="td1">
							<label for="pw">비밀번호</label> 
						</td>
						<td>
						<div id="replyDiv">
							<input type="radio" class="pwSel" name="secret" id="nonSecret" > <label>공개글</label>
							<input type="radio" class="pwSel" name="secret" id="secret"> <label>비밀글</label>
							<input type="password" name="pw" id="pw">
						</div>
						</td>
					</c:if>

				</table>
					<a class="qnaWrite_btn" id="write">등록</a>
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

	<!-- 썸머노트 -->
	<script src="../resources/js/summernote.js"></script>
	<!-- script -->
	<script type="text/javascript">
		/* 첨부 파일 관리 */
		// 개수 제한. 최대 5개까지.
		var limit = 1;
		// 파일 추가
		$('#addFiles')
				.click(
						function() {
							var addFiles = '<div>'
									+ '<input type="file" class="filelist" name="filelist" style="display: inline-block"> '
									+ '<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>'
									+ '</div>';
							if (limit < 5) {
								$('#files').append(addFiles);
								limit++
							} else {
								alert("최대 5개까지 첨부가능합니다.");
							}
						});

		// 정적인 input 파일 제거
		$('.deleteFile').click(function() {
			$(this).parent().remove();
			limit--
		});

		// 동적으로 그려진 input file 제거
		$('#files').on('click', '.deleteFile', function() {
			$(this).parent().remove();
			limit--
		});

		/* 첨부 파일 관리 끝 */

		/* 비밀글 */
		if('${board}'=='qna'){
			$('#pw').hide();
			$('.pwSel').click(function() {
				var secret = $('#secret').prop('checked');
				console.log(secret);
				if ($('#secret').prop('checked')) {
					$('#pw').show();
				} else {
					$('#pw').hide();
				}
			});	
			if ($('#nonSecret').prop('checked', true)) {
				$('#pw').val('');
				$('#pw').hide();
			}
			$('.pwSel').click(function() {
				if ($('#nonSecret').prop('checked') == true) {
					$('#pw').val('');
					$('#pw').hide();
				}
				if ($('#secret').prop('checked') == true) {
					$('#pw').removeAttr('readonly');
					$('#pw').show();
				}
			});
		}
		
		if('${board}'=='qnaReply'){
			$('#replyDiv').hide();
			if('${qnaOrigin.pw}' != ''){
				$('#pw').val('${qnaOrigin.pw}');
			}
		}
		
		$('#write').click(function() {
			var secretCheck = $('#secret').prop('checked');
			if($('#title').val()!='' && $('#writer').val() != '' && $('#contents').val() != ''){
				if(secretCheck == true && $('#pw').val() != ''){
					$('#frm').submit();	
				} else if(secretCheck == true && $('#pw').val() == '') {
					alert('비밀번호를 입력해주세요');
				} else {
					$('#frm').submit();
				}
			} else {
				alert('필수(*)를 모두 입력해주세요');
			}
		});
		
	</script>
</body>
</html>
