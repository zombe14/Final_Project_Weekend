<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp"/>
<title>[${boardTitle}]${dto.title}</title>
</head>
<body>

	${dto.title}
	<hr>
	${dto.writer}
	${dto.reg_date}
	<hr>
	${dto.contents}
	<hr>
	${dto.hit}
	${dto.top}
	<hr>
	
	
	<a href="./${board}List">목록</a>
	<a href="./${board}Update?num=${dto.num}">수정</a>
	<a id = "delete">삭제</a>
	
<script type="text/javascript">
	$('#delete').click(function() {
		var check = confirm('삭제하시겠습니까?');
		if(check){
			location.href="./${board}Delete?num=${dto.num}";
		}
	});
</script>
</body>
</html>