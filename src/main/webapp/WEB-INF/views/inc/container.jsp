<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 반응형 이미지 -->
<div id="main_banner">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="./resources/images/home/banner1.jpg"
					class="img-responsive center-block"
					alt="festival1">
			</div>

			<div class="item">
				<img src="./resources/images/home/banner2.jpg"
					class="img-responsive center-block"
					alt="festival2">
			</div>

			<div class="item">
				<img src="./resources/images/home/banner3.jpg"
					class="img-responsive center-block"
					alt="festival3">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>
<div class="inner">
<div class="section_top">
	<%@ include file="./container/ticket_open.jsp"%>
</div>
<div class="section_rank">
	<%@ include file="./container/ticket_rank.jsp"%>
</div>
<div class="section_best">
	<%@ include file="./container/ticket_best.jsp"%>
</div>
<div class="main_right" id="wingright">
	<ul class="push">
		<!-- <li><a href="#"><img alt="포스터  작게" src="./resources/images/home/wing/임시날씨.JPG" width="98" height="125"></a></li> -->
		<li class="weathericon"><a href="http://weather.amcharts.com/"><img alt="" src="" id="weather" width="40" height="50"></a></li>
		<li><input type="text" class="a" value="" readOnly></li>
		<li><input type="text" class="b" value="" readOnly></li>
		<li onclick="window.open('${pageContext.request.contextPath}/calendar/calendar','달력','width=1000, height=850, scrollbars=yes')"><a href="#"><img alt="포스터  작게" src="./resources/images/home/wing/8월달력.jpeg" width="98" height="125"></a></li>
	</ul>
</div>
</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="./resources/images/home/위로.png"></a>
