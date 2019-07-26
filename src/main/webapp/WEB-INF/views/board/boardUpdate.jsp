<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/board/boardWrite.js"></script>
<title>${boardTitle} Update</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="inner">
      		<form action="./${board}Write" method="post" enctype="multipart/form-data">
	
		<div>
			<label for="title">제목<span>*</span></label>
			<input type="text" name="title" value="${dto.title}">
		</div>
		<div>
			<label for="writer">작성자<span>*</span></label>
			<input type="text" name="writer" value="${dto.writer}" readonly="readonly">
		</div>
		<div>
			<label for="contents">내용<span>*</span></label>
			<textarea rows="" cols="" name="contents" id="contents">${dto.contents}</textarea>
		</div>
		<div>
			<label for="files">첨부파일</label>
			<a id="addFiles">파일추가</a>
			<div id="files">
				<div>
					<input type="file" class="files" name="files" style="display: inline-block">
					<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
				</div>
			</div>
		</div>
		<div>
		<%-- <c:if test="${member.grade eq 3}"> --%>
			상단에 등록 <input type="checkbox">
		<%-- </c:if> --%>
		</div>
		<input type="button" id="write" value="등록">
	</form>
      	</div>
      </div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
<!-- script -->
<script src="../resources/js/summernote.js"></script>
</body>
</html>