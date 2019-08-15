<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle} Update</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="conta">
  	      	<div class="conta">
				<form action="./${board}Update" method="post" enctype="multipart/form-data" id="frm">
				
					<input type="hidden" name ="num" value="${dto.num}">

					<div>
						<label for="title">제목<span>*</span></label>
						<input type="text" name="title" id="title" value="${dto.title}">
					</div>
					<div>
						<label for="writer">작성자<span>*</span></label> 
						<input type="text" name="writer" value="${dto.writer}" readonly="readonly">
					</div>

					<div>
						<label for="contents">내용<span>*</span></label>
						<textarea rows="" cols="" name="contents" id="contents">${dto.contents}</textarea>
					</div>
					<div>
						<label for="files">첨부파일</label> <a id="addFiles">파일추가</a>
						<!-- 이미 있는 파일들 -->
						<div id="filed">
							<input type="hidden" id="fileCount" value="${dto.fileDTOs.size()}">
							<c:forEach items="${dto.fileDTOs}" var="f">
								<c:if test="${f.oname ne null}">
									<div class="fileDTOsDiv">
										<p style="display: inline-block;">${f.oname}</p>
										<span class="glyphicon glyphicon-remove deleteFile" id="${f.fnum}" title="${f.fname}" style="display: inline-block;"></span>
									</div> 
								</c:if>
							</c:forEach>
						</div>
						<hr>
						<div id="files">
							
						</div>
					</div>
					<c:if test="${board eq 'qna'}">
						<div>
							<label for="pw">비밀번호</label> 
							<input type="radio" class="pwSel" name="secret" id="nonSecret" checked="checked"> 공개글
							<input type="radio" class="pwSel" name="secret" id="secret"> 비밀글
							<input type="password" name="pw" id="pw" placeholder="질문글과 답변을 볼 때 사용 할 비밀번호를 입력해주세요">
						</div>
					</c:if>
					<c:if test="${board eq 'qnaReply'}">
						<div id="replyDiv">
							<label for="pw">비밀번호</label> 
							<input type="radio" class="pwSel" name="secret" id="nonSecret" > 공개글
							<input type="radio" class="pwSel" name="secret" id="secret"> 비밀글
							<input type="password" name="pw" id="pw">
						</div>
					</c:if>

					<a class="btn btn-default" id="write">등록</a>
				</form>

			</div>
		</div>
		</div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
   
<!-- script -->
<script src="../resources/js/summernote.js"></script>
<script type="text/javascript">
		
	/* 첨부 파일 관리 */
	// 개수 제한. 최대 5개까지.
	var limit = 1;
	// 파일 추가
	$('#addFiles').click(function() {
		var addFiles = '<div>'
							+'<input type="file" class="filelist" name="filelist" style="display: inline-block"> '
							+'<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>'
						+'</div>';
		if(limit<5){
			$('#files').append(addFiles);
			limit++
		} else {
			alert("최대 5개까지 첨부가능합니다.");
		}
	});
	
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
	$('#files').on('click','.deleteFile',function(){
		$(this).parent().remove();
		limit--
	});
	/* 첨부 파일 관리 끝 */
	// 오픈/비밀 유지
		if('${board}'== 'qna'){
			if($('#pw').val() == ""){
				$('#nonSecret').prop('checked',true);
				$('#pw').val('');
				$('#pw').hide();
			} else {
				$('#secret').prop('checked',true);
			}
			
			$('.pwSel').click(function(){
				if($('#nonSecret').prop('checked')==true){
					$('#pw').val('');
					$('#pw').hide();
				} 
				if($('#secret').prop('checked')==true){
					$('#pw').removeAttr('readonly');
					$('#pw').show();
				}
			});
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