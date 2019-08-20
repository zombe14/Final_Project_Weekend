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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardSelect.css">
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
				<div class="fqna_wrap">
					<div class="fqna_title">
  	      				<h3> 유저추천 글 내용 </h3>
  	      			</div>
				<div class="tableDiv">
						<table class="table" style="width: 100%">
							<thead class="table_head">
								<tr>
									<th class="td1">
										<div>${list.num}</div>
									</th>
									<th class="td2">
										<div>${list.title}</div>
									</th>
									<th class="td1">
										<div>${list.writer}</div>
									</th>
									<th class="td1">
										<div>${list.reg_date}</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">
										<div class="dt1">								
											${list.contents}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						
				<!-- ------------------------------------------ 댓글 ------------------------------------------ -->
				
				
				<div id="commentsList">
					
				</div>
				<div id="commentsWriteDiv">
					<form action="./${board}commentsWrite" method="post" id="commentsFrm">
						<input type="hidden" id="num" name="num" value="${dto.anum}">
						<strong><span>댓글(</span><span id="cCnt">${cCnt}</span>)</strong>
						<div class="comments_name">				
							<input type="text" name="writer" id="writer" value="${member.nickname}memberNick" readonly="readonly" style="border: 0;background-color:transparent;">
						</div>
						<div style="display: inline-block;">
							<textarea rows="3" cols="120" id="commentsContents" style="resize: none;"></textarea>
						</div>
						<div style="display: inline-block;">
							<a class="btn" id="commentsWrite">댓글등록</a>
						</div>
					</form>
				</div>		
					
				
				<a id="list" title="${board}" class="${list.num} fqnaSelect_btn">목록</a>
				<a id="update" class="${board} fqnaSelect_btn">수정</a> 
				<a id="delete" class="${board} fqnaSelect_btn">삭제</a>
				
				<form action="./UserRecoDelete" id="deleteFrm" method="post">
				
					<input type="hidden" class="num" id = "${list.num}" name="num" value="${list.num}">
				
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
	

	
	/* 목록 */
	$('#list').click(function() {
		location.href = "./UserRecoList";
	});
	
	
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
	
</script>
</body>
</html>