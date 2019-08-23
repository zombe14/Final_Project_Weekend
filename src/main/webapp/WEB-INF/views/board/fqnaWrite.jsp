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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiWrite.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
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
				<div class="fwrite_wrap">
					<div class="fwrite_title">
  	      				<h3>${board}글쓰기</h3>
  	      			</div>
				<form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
					<table class="table table-bordered">
      		 		<tbody>

					<tr>
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<c:if test="${board eq 'fqna'}">
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png">
							<input type="text" name="title" id="title" style="width: 95.6%"></td>							
						</c:if>
						<c:if test="${board eq 'fqnaReply'}">
							<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png">
							<input type="text" name="title" id="title" value="${origin.title} 답변입니다." style="width: 95.6%"></td>
						</c:if>
					</tr>
					<tr>
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}" readonly="readonly" id="writer" style="width: 40%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="contents">내용<span class="r">*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents">
							<c:if test="${board eq 'fqnaReply'}">
								<div class="textarea_fqna">
								<p>원글 제목 : ${origin.title}</p>
								<p>원글 글쓴이 : ${origin.writer}</p>
								<p>원글 내용 : ${origin.contents }</p>
								</div>
								<hr>
								<input type="hidden" name ="ref" value="${origin.qnum}">
							</c:if>
						</textarea></td>
					</tr>
					<tr>
						<td class="td1"><label for="files">첨부파일</label></td>
						<td>
							<a id="addFiles"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일추가</a>
							<div id="files">
								<input type="file" class="filelist" name="filelist" style="display: inline-block">
								<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
							</div>
						</td>
					</tr>
					<c:if test="${board eq 'fqna'}">
					<tr class="hide">
						<td class="td1">
							<label for="pw">비밀번호</label>
						</td>
						<td> 
							<input type="radio" class="pwSel" name="secret" id="nonSecret" checked="checked">
							<label for="nonSecret">공개글</label>
							<input type="radio" class="pwSel" name="secret" id="secret">
							<label for="secret">비밀글</label>
							<input type="password" name="pw" id="pw" placeholder="질문글과 답변을 볼 때 사용 할 비밀번호를 입력해주세요" class="pwpw">
						</td>
					</tr>
					</c:if>
					<c:if test="${board eq 'fqnaReply'}">
					<tr class="hide">
						<td class="td1">
							<label for="pw">비밀번호</label>
						</td>
						<td>
							<input type="radio" class="pwSel" name="secret" id="nonSecret" >
							<label for="nonSecret">공개글</label>
							<input type="radio" class="pwSel" name="secret" id="secret">
							<label for="secret">비밀글</label>
							<input type="password" name="pw" id="pw" >
						</td>
					</tr>
					</c:if>
					
							<input type="hidden" name="num" value="${origin.num}">
					
					</tbody>
					</table>
					<a class="festiWrite_btn" id="write">등록</a>
				</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
	<!-- 썸머노트 -->
	<script src="../resources/js/summernote.js"></script>
	<!-- script -->
	<script type="text/javascript">
	
	
	$('.hide').hide();
	
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
		if('${board}'=='fqna'){
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
		
		if('${board}'=='fqnaReply'){
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
