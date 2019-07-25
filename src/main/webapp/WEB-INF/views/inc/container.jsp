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
				<img src="./resources/images/home/닭갈비축제.png"
					style="height: 50%;" class="img-responsive center-block"
					alt="festival1">
				<div class="carousel-caption">
					<h3>닭갈비 축제</h3>
					<p>LA is always so much fun!</p>
				</div>
			</div>

			<div class="item">
				<img src="./resources/images/home/신촌물총축제.jpg"
					style="height: 50%;" class="img-responsive center-block"
					alt="festival2">
				<div class="carousel-caption">
					<h3>신촌 물총 축제</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>

			<div class="item">
				<img src="./resources/images/home/냉이축제.jpg"
					style="height: 50%;" class="img-responsive center-block"
					alt="festival3">
				<div class="carousel-caption">
					<h3>냉이 축제</h3>
					<p>We love the Big Apple!</p>
				</div>
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

<div class="section_top">
	<div class="inner">
		<%@ include file="./container/ticket_open.jsp"%>
	</div>
</div>
<div class="section_rank">
	<div class="inner">
		<%@ include file="./container/ticket_rank.jsp"%>
	</div>
</div>
<div class="section_best">
	<div class="inner">
		<%@ include file="./container/ticket_best.jsp"%>
	</div>
</div>



<!-- <div class="main_right" id="wingright">
	<ul>
		<li><a href="#"><img alt="포스터  작게" src="./resources/images/home/wing/c_wing.jpeg" width="98" height="125"></a></li>
		
	</ul>
</div> -->



