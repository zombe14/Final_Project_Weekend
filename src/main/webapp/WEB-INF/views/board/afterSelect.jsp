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
				<div id="commentsDiv">
					<div id = "commnetedDiv">
						<c:forEach items="${list}" var="r">
							<p>${r.writer}</p>
							<p>${r.contents}</p>
							<p>${r.reg_date}</p>
							<a class="commentsUpdate">수정</a>
							<a class="commentsDelete">삭제</a>
							<a class="recommentsWrite">댓글등록</a>
						</c:forEach>
						<div id="paging">
							<c:if test="${list[0].reg_date ne null}">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pager.curBlock>1}">
											<li class="pagingClick"><a href="${board}select?num=${dto.num}&curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
										</c:when>
										<c:otherwise>
											<li class="pagingo"><a>이전</a></li>
										</c:otherwise>
									</c:choose>
			
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="pagingClick"><a href="${board}select?num=${dto.num}&curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
			
									<c:choose>
										<c:when test="${pager.curBlock < pager.totalBlock}">
											<li class="pagingClick"><a href="${board}select?num=${dto.num}&curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
										</c:when>
										<c:otherwise>
											<li class="pagingo"><a>다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</c:if>
						</div>
					</div>
					<hr>
					<div id="commentsWriteDiv">
						<form action="./${board}commentsWrite" method="post" id="commentsFrm">
							<p>${member.nickname}memberNickname</p>
							<input type="hidden" name="writer" id="writer" value="${member.nickname}임시">
							<textarea rows="3" cols="100" id="commentsContents"></textarea>
							<a class="btn btn-default" id="commentsWrite">댓글등록</a>
						</form>
					</div>
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
	console.log('${dto.anum}');
	$('#commentsWrite').click(function() {
		var writer = $('#writer').val();
		var contents = $('#commentsContents').val();
		var num = '${dto.anum}';
		$.ajax({
			type:'POST',
			url:'./commentsWrite',
			data:{
				writer:writer,
				contents:contents,
				num:num
			},
			success:function(data){
				data = data.trim();
				if(data == '1'){
					location.href="./afterSelect?anum=${dto.anum}"				
				} else {
					alert('실패');
				}
			},
			error:function(d){
				console.log(d);
			}
		});
	});
	
	function loadComments() {
		
	}
	
	
</script>
</body>
</html>