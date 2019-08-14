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
				<!-- ------------------------------------------ 댓글 ------------------------------------------ -->
				<hr>
				<div id="commentsWriteDiv">
					<form action="./${board}commentsWrite" method="post" id="commentsFrm">
						<input type="hidden" id="num" name="num" value="${dto.anum}">
						<strong><span>댓글(</span><span id="cCnt">${cCnt}</span>)</strong>
						<div>				
							<input type="text" name="writer" id="writer" value="${member.nickname}memberNick" readonly="readonly" style="border: 0;background-color:transparent;">
						</div>
						<div style="display: inline-block;">
							<textarea rows="3" cols="100" id="commentsContents" style="resize: none;"></textarea>
						</div>
						<div style="display: inline-block;">
							<a class="btn" id="commentsWrite">댓글등록</a>
						</div>
					</form>
				</div>
				<hr>
				<div id="commentsList">
					
				</div>
					
			</div>
   </div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>
	
	<!-- script -->
	<script type="text/javascript">
	 getCommentsList();
	/* 댓글 등록하기 - ajax */
	$('#commentsWrite').click(function() {
		var writer = $('#writer').val();
		var contents = $('#commentsContents').val();
		var num = '${dto.anum}';
		if(contents == ''){
			alert('내용을 입력해주세요');
		} else {
			$.ajax({
				type:'POST',
				url:'./commentsWrite',
				data:{
					writer:writer,
					contents:contents,
					num:num
				},
				success:function(data){
	
					if(data == '1'){
						getCommentsList();
						$('#commentsContents').val('');
					} else {
						alert('다시 작성해주세요');
					}
				},
				error:function(data){
					console.log(data);
				}
			});
		}
	});
	
	$('.update').click(function() {
		var num = $(this).attr('class');
	 });
	 
	
	function getCommentsList(){
		$.ajax({
			type:'GET',
			url:'./commentsList',
			data:{
				num:'${dto.anum}'
			},
			success:function(data){
				data = data.trim();    	
				$('#commentsList').html(data);
					
			}
		});
	}
	
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
		var num = $('.anum').attr('id');
		location.href="./${board}Update?anum="+num;
	
		
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