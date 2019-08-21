<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/error.css">
<title>ERROR PAGE</title>
</head>

<body>
<div id="wrap">
      <div id="container">
      	<div class="conta">
			<div class="error_wrap">
				<div class="error_logo">
					<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/error.png"></a>
				</div>
				<div class="error_title">
					<strong>고객님, 불편을 드려 죄송합니다.</strong>
					<div class="error_p">
					<p>페이지 주소가 정확하지 않거나 <b>페이지에 오류</b>가 있어</p>
					<p>요청하신 내용을 찾을 수 없습니다.</p>
					</div>
				</div>	

				<div class="btn">
				<a href="./" class="home_btn">Go Home</a>
				</div>
				
			</div>
      	</div>
    </div>	
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