<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<script type="text/javascript">
	</script>
</html>
<c:choose>
	<c:when test="${board eq '관리자메인'}">
		<div class="col-sm-2 sidenav">
			<p>
				<a href="#">공지사항</a>
			</p>
			<p>
				<a href="#">페스티벌</a>
			</p>
			<p>
				<a href="#">공연</a>
			</p>
			<p>
				<a href="#">페스티벌 후기</a>
			</p>
			<p>
				<a href="#">공연 후기</a>
			</p>
			<p>
				<a href="#">관리자 추천</a>
			</p>
			<p>
				<a href="#">QnA</a>
			</p>
		</div>
	</c:when>

</c:choose>
