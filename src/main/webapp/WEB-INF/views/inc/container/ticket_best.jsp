<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="best_main">
	<div class="best_header">
		<strong class="besttitle">베스트 공연ㆍ축제</strong>
	</div>
	<div class="best_cont">
		<ul class="best_list">
			<c:forEach items="${best }" var="best" varStatus="status">
			<li>
				<a href="${pageContext.request.contextPath}/festi/festiSelect?num=${best.num}">
				<p>
					<img src="${pageContext.request.contextPath}/resources/images/board/${best.fileDTOs[0].fname}">
				</p>
				<div class="list_info">
					<h4>${best.title }</h4>
					<dl>
						<dt>기간</dt>
						<dd>${best.startDate} ~	${best.endDate}</dd>
						<dt>장소</dt>
						<dd>${best.local}</dd>
					</dl>
				</div>
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>