<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> W 추천 글수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiWrite.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
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
  	      			<img alt="" src="${pageContext.request.contextPath}/resources/images/chat.png" class="titleimg"><h3> W 추천 글 수정 </h3>
  	      		</div>
  	      		<form action="./WeekRecoUpdate" method="post" enctype="multipart/form-data" id="frm">
					<table class="table table-bordered">
						<tr class="update_title">
							<td class="td1"><label for="title">제목 <span class="r">*</span></label></td>
							<td>
								<img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png">
								<input type="text" name="title" class="required" id="title" value="${list.title}" style="width: 95.6%">
							</td>
						</tr>
						<tr class="update_writer">
							<td class="td1"><label for="writer">작성자 <span class="r">*</span></label></td>
							<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${list.writer}" readonly="readonly" id="writer" style="width: 40%"></td>
						</tr>
						<tr>
							<td class="td1"><label for="contents">내용 <span class="r">*</span></label></td>
							<td><textarea rows="" cols="" name="contents" id="contents" class="required">${list.contents}</textarea></td>
						</tr>
  	      			</table>

						<input type="hidden" name="num" value="${list.num}">
						<a id="write" class="festiWrite_btn">등록하기</a>
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
<script type="text/javascript">
//조건
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
</script>

</body>
</html>		