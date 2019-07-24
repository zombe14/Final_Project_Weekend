<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp"/>
<c:import url="../temp/summernote.jsp"/>
<script src="../resources/js/board/boardWrite.js"></script>


<title>${boardTitle} Write</title>
</head>
<body>
	<h3>${boardTitle} Write</h3>
	<form action="./${board}Write" method="post" enctype="multipart/form-data">
	
		<div>
			<label for="title">제목<span>*</span></label>
			<input type="text" name="title">
		</div>
		<div>
			<label for="writer">작성자<span>*</span></label>
			<input type="text" name="writer" value="세션에서 아이디나 닉네임으로 'ADMIN' 받기 + readOnly추가">
		</div>
		<div>
			<label for="contents">내용<span>*</span></label>
			<textarea rows="" cols="" name="contents" id="contents"></textarea>
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
		<input type="button" id="write" value="등록">
	</form>
	
<!-- script import section -->
<script src="../resources/js/summernote.js"></script>
</body>
</html>