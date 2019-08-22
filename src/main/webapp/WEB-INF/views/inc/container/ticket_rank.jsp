<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<div class="rank_main">
	<div class="rank_left">
		<div class="rank_header">
			<strong class="ranktitle">축제 랭킹</strong> 
			<a href="${pageContext.request.contextPath}/rank/rank_festi?category=2" class="title"><img src="./resources/images/home/plus.png" 
			style="width: 20px; height: auto"></a>
		</div>
		<div class="rank_cont">
		<ul>
			<li class="first first2"><a href="#" ><img alt="" src="${pageContext.request.contextPath}/resources/images/board/${rank2[0].fileDTOs[0].fname}" width="180" height="218"></a></li>
						<c:forEach items="${rank2 }" var="rank2" varStatus="status">
							<li class="rankingItem${status.count }"><a href="${pageContext.request.contextPath}/festi/festiSelect?num=${rank2.num}">
										<span class="num${status.count }">${status.count }</span>
							${rank2.title }
							</a></li>
							
						</c:forEach>
							<input type="hidden" id="img11" value="${rank2[0].fileDTOs[0].fname}">
						
		</ul>
		
		<!-- <ul>
			<li class="first first2"><a href="#" ><img alt="" src="./resources/images/home/대박워터파크.jpg" width="180" height="218"></a></li>
			<li class="rankingItem1">
				<a href="#" >
					<span class="num1" style="color:#41b40a;">1</span>
					대팍! 물놀이 페스티벌
				</a>
			</li>
			<li class="rankingItem2">
				<a href="#" >
					<span class="num2" style="color:#41b40a;">2</span>
					2019 옐로우리버비치 시즌5 특가!
				</a>
			</li>
			<li class="rankingItem3">
				<a href="#" >
					<span class="num3" style="color:#41b40a;">3</span>
					그리스 보물전
				</a>
			</li>
			<li class="rankingItem4">
				<a href="#" >
					<span class="num4">4</span>
					신통방통 미술탐험대 이집트 미술여행
				</a>
			</li>
			<li class="rankingItem5">
				<a href="#" >
					<span class="num5">5</span>
					2019 CJ대한통운 슈퍼레이스 챔피언십 Round.5
				</a>
			</li>
		</ul> -->
	</div>
</div>

<div class="rank_right">
		<div class="rank_header">
			<strong class="ranktitle">공연 랭킹</strong> 
			<a href="${pageContext.request.contextPath}/rank/rank_festi?category=1" class="title"><img src="./resources/images/home/plus.png" 
			style="width: 20px; height: auto"></a>
		</div>
		<div class="rank_cont">
			<ul>
			<li class="first first3"><a href="#" ><img alt="" src="${pageContext.request.contextPath}/resources/images/board/${rank1[0].fileDTOs[0].fname}" width="180" height="218"></a></li>
					<c:forEach items="${rank1 }" var="rank1" varStatus="status">
						<li class="ranking${status.count }"><a href="${pageContext.request.contextPath}/board/festiSelect?num=${rank1.num}">
						<c:choose>
							<c:when test="${status.count<4} ">
								<span class="num${status.count }" style="color:#41b40a;">${status.count }</span>
							</c:when>
							<c:otherwise>
								<span class="num${status.count }">${status.count }</span>
							</c:otherwise>
						</c:choose>
							${rank1.title }
						</a></li>
					</c:forEach>

		</ul>
		
		
		<!-- <ul>
			<li class="first first3"><a href="#" ><img alt="" src="./resources/images/Rrank/블루레인.jpg" width="180" height="218"></a></li>
			<li class="ranking1">
				<a href="#" >
					<span class="num1" style="color:#41b40a;">1</span>
					뮤지컬 - 블루레인
				</a>
			</li>
			<li class="ranking2">
				<a href="#" >
					<span class="num2" style="color:#41b40a;">2</span>
					2019 10cm X 소란 콘서트
				</a>
			</li>
			<li class="ranking3">
				<a href="#" >
					<span class="num3" style="color:#41b40a;">3</span>
					뮤지컬 - 테레즈 라캥
				</a>
			</li>
			<li class="ranking4">
				<a href="#" >
					<span class="num4">4</span>
					뮤지컬 - 정글라이프
				</a>
			</li>
			<li class="ranking5">
				<a href="#" >
					<span class="num5">5</span>
					2019 푸에르자 부르타 웨이라 인 서울
				</a>
			</li>
		</ul> -->
	</div>
</div>

</div>