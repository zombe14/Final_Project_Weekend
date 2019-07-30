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
			
				<!-- 내용 -->
				<div>
					<p>${dto.title}</p>
					<p>${dto.contents}</p>
					<p>${dto.category}</p>
					
					<c:forEach items="${dto.fileDTOs}" var="f">
						<input type="button" title="${f.fname}" class="down" value="${f.oname}"> 
					</c:forEach>
				</div>
				<!-- 내용 끝 -->
				<!-- ajax 파일 다운로드 -->
				<div style="display:none;">
					<form action="../ajax/fileDownload" method="post" id="downForm">
						<input type="text" name="fname" id="fname">
						<input type="text" name="oname" id="oname">
						<input type="text" name="board" value="board">
					</form>
				</div>
				<!-- ajax 파일 다운로드 끝 -->
				
				<a href="./${board}List">목록</a> 
				<a href="./${board}Update?num=${dto.num}">수정</a> 
				<a id="delete">삭제</a>
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
			
			location.href="./${board}Delete?num=${dto.num}";
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
	
</script>
</body>
</html>