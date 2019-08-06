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
				<form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
				<c:if test="${board eq 'qnaReply'}">
					<p>원글 제목 : ${qnaOrigin.title}</p>
					<p>원글 글쓴이 : ${qnaOrigin.writer}</p>
					<input type="hidden" name ="ref" value="${qnaOrigin.num}">
				</c:if>

					<div>
						<label for="title">제목<span>*</span></label>
						<input type="text" name="title" id="title">
					</div>
					<div>
						<label for="writer">작성자<span>*</span></label> 
						<input type="text" name="writer" placeholder="${member.id}memberId">
					</div>

					<div>
						<label for="contents">내용<span>*</span></label>
						<textarea rows="" cols="" name="contents" id="contents"></textarea>
					</div>
					<div>
						<label for="files">첨부파일</label> <a id="addFiles">파일추가</a>
						<div id="files">
							<div>
								<input type="file" class="filelist" name="filelist" style="display: inline-block"> 
								<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
							</div>
						</div>
					</div>
					
					<div>
						<label for="pw">비밀번호</label> 
						<input type="radio" class="pwSel" name="secret" id="nonSecret" checked="checked"> 공개 
						<input type="radio" class="pwSel" name="secret" id="secret"> 비밀글
						<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요">
					</div>

					<a class="btn btn-default" id="write">등록</a>
				</form>

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
		
		$('#write').click(function() {
			$('#frm').submit();				
		});
		
	</script>
</body>
</html>