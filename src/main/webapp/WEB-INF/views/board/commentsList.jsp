<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div id="commentsListDiv">
			<c:forEach items="${clist}" var="c">
				<div>
			    	${c.writer} | ${c.reg_date}<br>
			    	${c.contents}
		    	</div>		    	
		    </c:forEach>
		</div>
		
		<div id="paging">			
				<c:if test="${clist[0].reg_date ne null}">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pager.curBlock>1}">
								<li class="pagingClick"><a href="afterSelect?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="pagingo"><a>이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i">
							<li class="pagingClick"><a href="afterSelect?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pager.curBlock < pager.totalBlock}">
								<li class="pagingClick"><a href="${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="pagingo"><a>다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:if>
			</div>


</body>
</html>