<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR PAGE</title>
</head>

<body>
	<div class="login_logo">
		<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo111.png"></a>
	</div>
	<div>
		<h2>에러 페이지입니다.</h2>
	</div>


<%--     <c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
        <center><p>400 에러가 발생했습니다.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
        <center><p>403 에러가 발생했습니다.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
        <center><p>존재하지 않는 주소입니다.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
        <center><p>405 에러가 발생했습니다.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
        <center><p>500 에러가 발생했습니다.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
        <center><p>503 에러가 발생했습니다.</p></center>
    </c:if> --%>
</body>
</html>