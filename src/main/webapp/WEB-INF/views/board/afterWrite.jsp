<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle} Write</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />

<style type="text/css">
	.r{
		color: red;
	}
</style>
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="inner">
  	      	
      		 <form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
				
					<div>
						<p>${originTitle} ${boardTitle}</p>
					</div>
      		 	
				<div>
					<label for="title">제목<span class="r">*</span></label>
					<input type="text" name="title" id="title">
				</div>
				<div>
					<label for="writer">작성자<span class="r">*</span></label>
					<input type="text" name="writer" value="${member.id}memberId" id="writer">
				</div>
				
				<div>
					<label for="contents">내용<span class="r">*</span></label>
					<textarea rows="" cols="" name="contents" id="contents"></textarea>
				</div>
				<div>
					<label for="files">첨부파일</label>
					<a id="addFiles">파일추가</a>
					<div id="files">
						<div>
							<input type="file" class="filelist" name="filelist" style="display: inline-block">
							<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
						</div>
					</div>
				</div>
				
					<div>
	      		 		<input type="hidden" name="num" value="${originNum}">
					</div>
					<div>
						<label for="point">별점<span class="r">*</span></label>
						<input type="radio" name="point" value="1" class="point"> 1점
						<input type="radio" name="point" value="2" class="point"> 2점
						<input type="radio" name="point" value="3" class="point"> 3점
						<input type="radio" name="point" value="4" class="point"> 4점
						<input type="radio" name="point" value="5" class="point"> 5점
					</div>
      		 	
				<a id="write" class="btn btn-default">등록</a>
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
		$(this).parent().remove();
		limit--
	});
	
	// 동적으로 그려진 input file 제거
	$('#files').on('click','.deleteFile',function(){
		$(this).parent().remove();
		limit--
	});
	/* 첨부 파일 관리 끝 */
	
	$('#write').click(function() {
		$('.point').each(function() {
			var point = $('.point').prop('checked',true);	
			console.log(point);
		});
		
		if($('#title').val() != '' && $('#writer').val() != '' && $('#contents').val() != ''){
			//$('#frm').submit();
		} else {
			
			//alert('필수(*)가 비었어요');
		}
	});
	

</script>
</body>
</html>