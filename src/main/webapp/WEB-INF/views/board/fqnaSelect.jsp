<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${boardTitle}]${dto.title}</title>
<c:import url="../temp/boot.jsp"></c:import>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<style type="text/css">
	#replyContents{
		resize: none;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				num : ${dto.num}
				<br>
				qnum : ${dto.qnum}
				<br> 
				title : ${dto.title} 
				<br> 
				writer : ${dto.writer} 
				<br> 
				reg_Date : ${dto.reg_date} 
				<br>
				
				<br>
				contents : ${dto.contents} 
				<br> 
				<br> 
				
				<c:forEach items="${dto.fileDTOs}" var="f">
					<input type="button" title="${f.fname}" class="down" value="${f.oname}"> 
				</c:forEach>
				
				<div style="display:none;">
					<form action="../ajax/fileDownload" method="post" id="downForm">
						<input type="text" name="fname" id="fname">
						<input type="text" name="oname" id="oname">
						<input type="text" name="board" value="board">
					</form>
				</div>			
				
				<a id="list" title="${board}" class="${dto.num}">목록</a>
				<a id="update" class="${board}">수정</a> 
				<a id="delete" class="${board}">삭제</a>
				<c:if test="${dto.answer eq 0}"> <!-- and member.grade == 3  : qna 뒤에 추가하기 -->
					<a id="replyBtn" class="btn btn-default">답변달기</a>
				</c:if>

				
				<!-- 원글일때 -->
				<form action="./fqnaDelete" id="deleteOriginFrm" method="post">
					<input type="hidden" name="ref" value="${dto.ref}">
				</form>
				<!-- 답글일때 -->
				<form action="./fqnaReplyDelete" id="deleteReplyFrm" method="post">
					<input type="hidden" name="qnum" value="${dto.qnum}">
				</form>
			</div>
   </div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>
	
	<!-- script -->
	<script type="text/javascript">
	/* 글 삭제 */
	$('#delete').click(function() {
		
		/* 질문 원글일 때 */
		if('${dto.step}' == '0'){
			var check = confirm('삭제하시겠습니까? 답변도 모두 삭제됩니다.');		
			if(check){
				$('#deleteOriginFrm').submit();
			}
		} 
		/* 답글일때 */
		else{
			var check = confirm('삭제하시겠습니까?');		
			if(check){
				$('#deleteReplyFrm').submit();
			}
		}
		
	});
	
	/* 글 수정 */
	$('#update').click(function() {
		var board = $(this).attr('class');
		var num = 0;
		
			location.href = "./${board}Update?qnum=${dto.qnum}";
		
		
	});
	
	/* 첨부파일 다운로드 */
	$('.down').click(function() {
		var fname=$(this).attr('title');
		var oname=$(this).val();
		$('#fname').val(fname);
		$('#oname').val(oname);
		$('#downForm').submit();
	});
	
	/* 목록 */
	$('#list').click(function() {
		var list = "";
		var board = $(this).attr('title');
		var num = $(this).attr('class');
		if(board == 'qna'){
			list = "../qna/qnaList";		
		} else if (board == 'fqna'){
			list = "../festi/festiSelect?num=${dto.num}";
		}
		location.href = list;
	});
	/* 
	if('${board}' == 'qna'){
		$('#replyWrite').click(function() {
			if($('#replyContents').val() == ""){
				alert('내용을 입력해주세요');
			} else {
				$.ajax({
					url:'./${board}ReplyWrite'
				});
			}
		});
	} */
	
		$('#replyBtn').click(function() {
			console.log('click');
			location.href = "./${board}ReplyWrite?qnum=${dto.qnum}";
		});
	
	
</script>
</body>
</html>