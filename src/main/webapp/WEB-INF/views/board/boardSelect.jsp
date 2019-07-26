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
				<br> top : ${dto.top}
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
	$('#delete').click(function() {
		var check = confirm('삭제하시겠습니까?');
		if(check){
			location.href="./${board}Delete?num=${dto.num}";
		}
	});
	
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