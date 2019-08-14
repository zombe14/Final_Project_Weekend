<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title>${boardTitle} 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/logo/logo.png" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/callcenter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/boardList.css">
</head>
<body>
<div class="container">
<br><br>
	<div id="commentsDiv">
		<div id="commnetedDiv">
			<div class="comment">
				<c:forEach items="${list}" var="r">
					<p>${r.cnum} | ${r.writer}</p>

					<div id="${r.cnum}contentsDiv">
						<p class="contents" id="${r.cnum}Contents">${r.contents}</p>
						<%-- <form action="./commentsUpdate" method="post" id="${r.cnum}Frm">
							<a class="cnum" id="${r.cnum}" style="visibility: hidden;"></a>
							<textarea rows="3" cols="100" id="commentsContents" style="resize: none;">${r.contents}</textarea>
							<a class="comUpdateBtn">수정</a>
						</form> --%>
					</div>
					${r.reg_date}
					<a class="recommentsWrite" class="btn btn-default">댓글등록</a>
					<%--추가하기 <c:if test="${r.writer eq member.nickname}"> --%>
						<a class="commentsUpdate" id="${r.cnum}" class="btn btn-default" title="${r.contents}">수정</a>
						<a class="commentsDelete" id="${r.cnum}" class="btn btn-default">삭제</a>
					<%-- </c:if> --%>
					<hr>
				</c:forEach>
			</div>
			<div id="paging">
				<c:if test="${list[0].reg_date ne null}">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pager.curBlock>1}">
								<li class="pagingClick"><a href="${board2}List?num=${dto.num}&curPage=${pager.startNum-1}">이전</a></li> 
								<!-- <li class="pagingClick"><a id="prev">이전</a></li> -->
							</c:when>
							<c:otherwise>
								<li class="pagingo"><a>이전</a></li>
							</c:otherwise>
						</c:choose>
	
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li class="pagingClick"><a href="${board2}List?num=${dto.num}&curPage=${i}" class="page" id="${i}">${i}</a></li>
						</c:forEach>
	
						<c:choose>
							<c:when test="${pager.curBlock < pager.totalBlock}">
								<li class="pagingClick"><a href="${board2}List?num=${dto.num}&curPage=${pager.lastNum+1}">다음</a></li>
								<!-- <li class="pagingClick"><a id="next">다음</a></li> -->
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
				<textarea rows="3" cols="100" id="commentsContents" style="resize: none;"></textarea>
				<a class="btn btn-default" id="commentsWrite">댓글등록</a>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#commentsWrite').click(function() {
		var writer = $('#writer').val();
		var contents = $('#commentsContents').val();
		var num = '${dto.anum}a24';
		$.ajax({
			type : 'POST',
			url : './commentsWrite',
			data : {
				writer : writer,
				contents : contents,
				num : num
			},
			success : function(data) {
				data = data.trim();
				if (data == '1') {
					getCommentList();
				} else {
					alert('실패');
				}
			},
			error : function(d) {
				console.log(d);
			}
		});
	});

	function loadComments() {

	}
	
	$('#next').click(function() {
		
		var curPage = "${pager.lastNum+1}";
		var num = "${list[0].num}";
		$.ajax({
			type:'GET',
			url:'./commentsList',
			data:{
				curPage:curPage,
				num:num
			},
			success:function(data){
				data = data.trim();
				if(data == '1'){
					alert('d');
				} else {
					alert('n');
				}
			}
		});
	});
	
	$('.commentsDelete').click(function() {
		var check = confirm('삭제하시겠습니까?');
		var selector = $(this);
		if(check){
			var cnum = $(this).attr('id');
			$.ajax({
				type:'POST',
				url:'./commentsDelete',
				data:{cnum:cnum},
				success:function(data){
					data = data.trim();
					if(data == '1'){
						location.href="./afterSelect?num=${list[0].num}";
					} else {
						alert('삭제 실패');
					}
				},
				error:function(d){
					console.log(d);
				}
			});
		}
	});
	
	$('.commentsUpdate').click(function() {
		var sel = $(this)
		var id = sel.attr('id'); // = r.cnum
		var contents = sel.attr('title');
		$('#'+id+'Contents').hide();
		/* var update = '<form action="./commentsUpdate" method="post" id="'+id+'Frm">' + 
					 '<a class="cnum" id="'+id+'" style="visibility: hidden;"></a>'+
					 '<textarea rows="3" cols="100" id="commentsContents" style="resize: none;">'+contents+'</textarea>'+
					 '<a class="comUpdateBtn">수정</a>'+
					 '</form>';
		sel.parent().children('#'+id+'contentsDiv').append(update); */
		

	});
	
	$('#'+id+'contentsDiv').on('click','.comUpdateBtn',function(){
		var cnum = $(this).prev('.cnum').attr(id);
		console.log(cnum);
		console.log('g');
	});
		
</script>
</body>
</html>