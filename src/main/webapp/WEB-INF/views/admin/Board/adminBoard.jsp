<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시판 관리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../../temp/adminBoot.jsp"/>
<c:import url="../../../../resources/css/adminBoard.css"/>
</head>
<body>
<!-- header.jsp -->
<c:import url="../../adminInc/header.jsp"/>
<div class="container-fluid text-center">    
  <div class="row content">
<!-- left_bar.jsp -->
<c:import url="../../adminInc/left_bar.jsp"/>
<!-- body 시작 -->
    <div class="mainBody">
      <h1>Table form이 들어갈 곳</h1>
    </div>
<!-- body 끝 -->
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer</p>
</footer>

</body>
</html>