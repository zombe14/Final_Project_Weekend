<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>예약 관리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/adminBoot.jsp"/>
<c:import url="../../../resources/css/adminBoard.css"/>
</head>
<body>
<c:import url="../adminInc/header.jsp"/>
<!-- left bar 시작 -->
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">예약 현황</a></p>
      <p><a href="#">몰라</a></p>
      <p><a href="#">뭐넣지</a></p>
    </div>
<!-- left bar 끝 -->
<!-- body 시작 -->
    <div class="col-sm-8 text-left"> 
      <h1>Table form이 들어갈 곳</h1>
    </div>
<!-- body 끝 -->
<!-- right bar 시작 -->
    <div class="col-sm-2 sidenav">
    </div>
<!-- right bar 끝 -->
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer</p>
</footer>

</body>
</html>