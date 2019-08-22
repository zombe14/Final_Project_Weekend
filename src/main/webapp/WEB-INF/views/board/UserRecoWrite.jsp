<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 유저추천 글쓰기 </title>
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
  	      			<img alt="" src="${pageContext.request.contextPath}/resources/images/chat.png" class="titleimg"><h3> 유저추천 글쓰기 </h3>
  	      		</div>
      		 <form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
      		 	<table class="table table-bordered">
      		 	<tbody>
					<tr>
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="title" id="title" style="width: 95.6%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}" readonly="readonly" id="writer" style="width: 40%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="contents">내용<span class="r">*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents" class="required"></textarea></td>
					</tr>
					<%-- <tr>
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
					</tr> --%>
				</tbody>
				</table>
				<input type="hidden" id ="num" name="num" value="${num}">
      		 	<a id="write" class="userRecoWrite_btn">등록</a>
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
	$(function () {
		$(".userRecoWrite_btn").on("click", function () {
			var num = $("#num").val();
			var writer = $("#writer").val();
			var title = $("#title").val();
			var contents = $("#contents").val();
			$.post("./UserRecoWrite", {
					num : num,
					writer : writer,
					title : title,
					contents : contents
					}, function (data) {
						if(data == 1){
							alert("글이 등록되었습니다.");							
							location.href="./UserRecoList";
						}else{
							alert("글 등록이 실패했습니다. 다시 확인해주세요.");
							location.href="./UserRecoList";
						}
					} //function 끝;
					) // .post 끝;
		}) //.festiWrite_btn 종료;
		
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
		
	})// sc 종료;
</script>

</body>
</html>