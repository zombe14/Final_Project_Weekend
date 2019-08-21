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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiWrite.css">
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
  	      			<h3>${board}글수정</h3>
  	      		</div>
      		 <form action="./${board}Update" method="post" enctype="multipart/form-data" id="frm">
			    <table class="table table-bordered">
      		 		<tbody>
					<tr>
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png">
							<input type="text" name="title" id="title" value="${dto.title}" style="width: 95.6%"></td>							
					</tr>
			    	<tr>
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}memberNick" readonly="readonly" id="writer" style="width: 40%"></td>
					</tr>
			     	<tr>
						<td class="td1"><label for="contents">내용<span class="r">*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents">
						${dto.contents}</textarea></td>
					</tr>
					<tr>
						<td class="td1"><label for="files">첨부파일</label></td>
						<td>
							<a id="addFiles"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일추가</a>
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
							<div id="files">
						
							</div>
						</td>
					</tr>
					<tr>
						<td class="td1">
							<label for="point">별점<span class="r">*</span></label>
						</td>
						<td>
							<input type="radio" name="point" value="1" class="point" id="p1"> 
							<label for="p1">싫어요</label>
							<input type="radio" name="point" value="2" class="point" id="p2"> 
							<label for="p2">별로에요</label>
							<input type="radio" name="point" value="3" class="point" id="p3">
							<label for="p3">보통이에요</label>
							<input type="radio" name="point" value="4" class="point" id="p4"> 
							<label for="p4">재미있어요</label>
							<input type="radio" name="point" value="5" class="point" id="p5"> 
							<label for="p5">훌륭해요</label>
						</td>
					</tr>
			
				
					<div>
	      		 		<input type="hidden" name="anum" value="${dto.anum}"> 
	      		 		<input type="hidden" name="num" value="${dto.num}">
					</div>
				</tbody>
      		 </table>
      		 	
				<a id="write" class="festiWrite_btn">등록</a>
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
	
	/* 별점 유지 */
	var point = ${dto.point};
	$('.point').each(function() {
		if($(this).val() == point){
			$(this).attr('checked','checked');
		}
	});
	
	/* 작성 조건 */
	$('#write').click(function() {
		var pointCheck=false;
		$('.point').each(function() {
			var point = $(this).is(':checked');
			if(point){
				pointCheck = true;
			}
		});
		
		if($('#title').val() != '' && $('#writer').val() != '' && $('#contents').val() != '' && pointCheck){
			$('#frm').submit();
		} else {
			alert('필수(*)가 비었어요');
		}
	});
	

</script>
</body>
</html>