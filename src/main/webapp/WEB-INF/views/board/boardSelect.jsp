<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${boardTitle}]${dto.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="inner">
				num : ${dto.num} 
				<br> 
				title : ${dto.title} 
				<br> 
				writer : ${dto.writer} 
				<br> 
				reg_Date : ${dto.reg_date} 
				<br>
				contents : ${dto.contents} 
				<br> hit : ${dto.hit} 
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

				<form action="./${board}Delete" id="deleteFrm" method="post">
					<c:if test="${board eq 'notice' or board eq 'qna'}">
						<input type="hidden" class="num" id = "${dto.num}" name="num" value="${dto.num}">
					</c:if>
					<c:if test="${board eq 'after'}">
						<input type="hidden" class="anum" id = "${dto.anum}" name="anum" value="${dto.anum}">
					</c:if>					
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
		var check = confirm('삭제하시겠습니까?');		
		if(check){
			$('#deleteFrm').submit();
		}
	});
	
	/* 글 수정 */
	$('#update').click(function() {
		var board = $(this).attr('class');
		var num = 0;
		
		if(board == 'notice' || board == 'qna'){
			num = $('.num').attr('id');
			location.href="./${board}Update?num="+num;
		} else if (board == 'after') {
			num = $('.anum').attr('id');
			location.href="./${board}Update?anum="+num;
		}
		
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
		if(board == 'after'){
			list = "../festi/festiSelect?num="+num;		
		} else if (board == 'notice'||'qna'){
			list = "./"+board+"List";
		}
		location.href = list;
	});
	
</script>
</body>
</html>