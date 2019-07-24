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
	${dto.writer}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	${dto.reg_date}
	<hr>
	${dto.contents}
	<hr>
	${dto.hit}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	${dto.top}
	
	<a href="./${board}List">뒤로가기</a>
</body>
</html>