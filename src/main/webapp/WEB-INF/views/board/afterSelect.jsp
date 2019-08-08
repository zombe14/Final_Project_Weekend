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
	#commentsContents{
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
				title : ${dto.title} 
				<br> 
				writer : ${dto.writer} 
				<br> 
				reg_Date : ${dto.reg_date} 
				<br>
				hit : ${dto.hit} 
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
				

				<form action="./${board}Delete" id="deleteFrm" method="post">
					
						<input type="hidden" class="anum" id = "${dto.anum}" name="anum" value="${dto.anum}">
							
				</form>
				<hr>
				<p>까지는까악</p>
				<p>내용콘텐츠집가고싶다핵더움</p>
				<p>2019.08.07. 19:10</p>
				<a id="commentsUpdate">수정</a> 
				<a id="commentsDelete">삭제</a>
				<a id="recommentsWrite">댓글등록</a>
				<c:forEach items="${commentsDTO}" var="r">
					<p>${r.writer}</p>
					<p>${r.contents}</p>
					<p>${r.reg_date}</p>
					<a id="commentsUpdate">수정</a>
					<a id="commentsDelete">삭제</a>
					<a id="recommentsWrite">댓글등록</a>
				</c:forEach>
				<hr>

				<div id="commentsDiv">
					<form action="./${board}commentsWrite" method="post" id="commentsFrm">
						<p>${member.nickname}memberNickname</p>
						<input type="hidden" name="writer" id="writer" value="${member.nickname}임시">
						<textarea rows="3" cols="100" id="commentsContents"></textarea>
						<a class="btn btn-default" id="commentsWrite">댓글등록</a>
					</form>
				</div>

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
	
	$('#commentsWrite').click(function() {
		var writer = $('#writer').val();
		var contents = $('#commentsContents').val();
		$.ajax({
			type:'post',
			url:'./commentsWrite',
			data:{
				writer:writer,
				contents:contents
			},
			success:function(data){
				data = data.trim();
				if(data == '1'){
					alert('성공');
				} else {
					alert('실패');
				}
			},
		});
	});
	
	
</script>
</body>
</html>