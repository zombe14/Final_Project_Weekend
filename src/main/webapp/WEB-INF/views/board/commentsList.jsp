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
	<!-- commentsDiv : 여기부터 -->
	<div id="commentsDiv">
		
		<!-- 댓글작성 폼 -->
		<div id="commentsWriteDiv">
			<form action="./${board}commentsWrite" method="post" id="commentsFrm">
				<strong><span>댓글(</span><span id="cCnt"></span>)</strong>
				<div>				
					<input type="text" name="writer" id="writer" value="${member.nickname}memberNick" readonly="readonly" style="border: 0;background-color:transparent;">
				</div>
				<div>
					<textarea rows="3" cols="100" id="commentsContents" style="resize: none;"></textarea>
				</div>
				<div>
					<input type="hidden" id="num" name="num" value="${dto.anum}">
				</div>
				<a class="btn" id="commentsWrite">댓글등록</a>
			</form>
		</div>
		<!-- 댓글작성 폼 끝 -->
		<hr>
		<!-- 댓글리스트 -->
		<div id="commentsListDiv">
			<!-- 댓글 하나씩 -->
			<%-- <c:forEach items="${list}" var="list">
				<div class="commentsDiv">
					<strong>${list.writer}</strong>
					<p>${list.contents}</p>
					<p>${list.reg_date}
						 | <a id = "reComWriteBtn">댓글달기</a>
						<c:if test="${list.writer eq member.nickname}">  : 추가하기 
						 | <a id = "comUpdateBtn">수정</a> | <a id="comDeleteBtn">삭제</a>
						</c:if>
					</p>
				</div>
			</c:forEach> --%>
		</div>
		<div class="container">
		    <form id="commentListForm" name="commentListForm" method="post">
		        <div id="commentList">
		        </div>
		    </form>
		</div>
		<!-- 댓글리스트 끝 -->
		
	</div>
	<!-- commentsDiv : 여기까지만 살리기-->
	
	<!-- container 끝 -->
</div>
<script type="text/javascript">
	
	/* 처음에 페이지에서 댓글 불러오기 */
	getCommentsList();
	
	/* 댓글 등록하기 - ajax */
	$('#commentsWrite').click(function() {
		var writer = $('#writer').val();
		var contents = $('#commentsContents').val();
		var num = $('#num').val();
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
					data = data.trim();
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
	
	function getCommentsList(){
		$.ajax({
			type:'GET',
			url:'./commentsList',
			dataType:'json',
			data:{
				num:$('#num').val()
			},
			success:function(data){
				data = data.trim();
				if(data == '1'){
					var html = "";
		            var cCnt = data.length;
		            
		            if(data.length > 0){
		                
		                for(i=0; i<data.length; i++){
		                	html += '<div class="commentsDiv">';
		                    html += "<strong>data[i].writer</strong>";
		                    html += "<p>"+data[i].contents+"</p>";
		                    html += '<p>'+data[i].reg_date +'| <a id = "reComWriteBtn">댓글달기</a> ';
		                    html += '| <a id = "comUpdateBtn">수정</a> | <a id="comDeleteBtn">삭제</a>';
		                    html += "</p></div>";
		                }
		                
		            } else {
		                
		              		html += '<div class="commentsDiv"><p>댓글이 없습니다.</p></div>';
		                
		            }
		            
		            $("#cCnt").html(cCnt);
		            $("#commentList").html(html);
				} else {
					alert('댓글을 불러오지 못했어요');
				}
			}
		});
	}
		
</script>
</body>
</html>