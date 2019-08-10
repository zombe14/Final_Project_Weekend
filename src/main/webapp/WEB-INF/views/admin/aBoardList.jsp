<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 관리자용 bootstrap -->
<c:import url="../temp/adminBoot.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>${title}관리</title>
<!-- 그저 로고일뿐 -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<!-- 관리자 보드용 css 가져옴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
</head>
<body>
	<script type="text/javascript">
		/* -------------------------- 유저 관리 -------------------------- */
		$(function() {
			/* -------------------------- 유저 등급 UP --------------------------*/
			$(".pBtn").on(
					"click",
					function() {
						/* id 값을 세팅 */
						var id = $(this).attr("id");
						/* grade 값을 세팅 */
						var grade = $(this).attr("title");
						var check = confirm("아이디 : " + id + "\n" + "등급 : "
								+ grade + "\n" + "등급을 올리시겠습니까?");
						/* check=true 세팅 */
						if (check) {
							/* 최고 grade 3을 넘지 못하도록 세팅 */
							if (grade == 3) {
								alert("현재 최고 등급입니다.");
							} else {
								/* post형식으로 mapping한 주소로 id값을 보냄 */
								$.post("../admin/aUserUpdateP", {
									id : id
								}, function(data) {
									if (data = 1) {
										if (grade == 1) {
											grade = 2;
										} else {
											grade = 3;
										}
										alert("아이디 : " + id + "\n" + "현재 등급 : "
												+ grade + "\n" + "등급이 올라갔습니다.")
									} else {
										alert("실패")
									}
									/* 이후 최신 상태 유지를 위해 페이지를 새로부름 */
									location.href = "../admin/aUserList";
								});
							}
						} else {
							alert("실패 하였습니다.");
						}
						;
					});
			/* -------------------------- 유저 등급 DOWN --------------------------*/
			$(".mBtn").on(
					"click",
					function() {
						/* id 값을 세팅 */
						var id = $(this).attr("id");
						var grade = $(this).attr("title");
						var check = confirm("아이디 : " + id + "\n" + "등급 : "
								+ grade + "\n" + "등급을 내리시겠습니까?");
						if (check) {
							if (grade == 1) {
								alert("더 이상 등급을 내릴수 없습니다.");
							} else {
								$.post("../admin/aUserUpdateM", {
									id : id
								}, function(data) {
									if (grade == 3) {
										grade = 2;
									} else {
										grade = 1;
									}
									alert("아이디 : " + id + "\n" + "현재 등급 : "
											+ grade + "\n" + "등급이 내려갔습니다.")
									location.href = "../admin/aUserList";
								});
							}
						}
					});
			/* -------------------------- 유저 삭제 --------------------------*/
			$(".dBtn").on("click", function() {
				var id = $(this).attr("id");
				var check = confirm(id+"유저를 삭제하시겠습니까?");
				if (check) {
					$.post("../admin/aUserDelete", {
						id : id
					}, function() {
						alert(id+"유저가 삭제되었습니다.");
						location.href = "../admin/aUserList";
					})
				} else {
					alert(id+"유저 삭제에 실패하였습니다.")
				}
			});
			/* -------------------------- board 관리 -------------------------- */
			$(".ddBtn").on("click", function() {
				var id = $(this).attr("id");
				var check = confirm(id+"글을 삭제하시겠습니까?");
				if (check) {
					$.post("../admin/a${board}Delete", {
						num : id
					}, function() {
						alert(id+"글이 삭제되었습니다.");
						location.href = "../admin/a${board}List";
					})
				} else {
					alert(id+"글의 삭제 실패하였습니다.");
				}
			});
		});
	</script>
	<div class="totalBody">
		<!-- header 시작 -->
		<c:import url="../inc/admin_header.jsp" />
		<!-- left bar 시작 -->
		<div class="container-fluid text-center">
			<div class="row content">
				<!-- side bar -->
				<c:import url="../inc/admin_left_bar.jsp" />
				<div class="col-sm-10">
					<!-- 검색창 -->
					<div>
						<form class="form-inline" action="./a${board}List">
							<div class="form-group col-xs-2">
								<select class="form-control" name="kind">
									<c:choose>
										<c:when test="${board eq 'User'}">
											<option value="1">ID</option>
											<option value="2">NAME</option>
											<option value="3">GRADE</option>
										</c:when>
										<c:when test="${board eq 'Notice'}">
											<option class="k" value="1">제목</option>
											<option class="k" value="2">내용</option>
										</c:when>
										<c:otherwise>
											<option class="k" value="1">제목</option>
											<option class="k" value="2">내용</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
							<div class="form-group col-xs-2">
								<input type="text" class="form-control" value="${pager.search}"
									name="search">
							</div>
							<div class="form-group col-xs-2">
								<button class="form-control">Search</button>
							</div>
						</form>
						<!-- 테이블 -->
					</div>
					<div class="container col-sm-12">
						<table class="table table-hover">
							<c:choose>
								<c:when test="${board eq 'User'}">
									<tr>
										<td>아이디</td>
										<td>닉네임</td>
										<td>이름</td>
										<td>나이</td>
										<td>이메일</td>
										<td>등급</td>
										<td>가입일</td>
										<td>기능</td>
										<td>유저 삭제</td>
									</tr>
									<c:forEach items="${list}" var="dto">
										<tr>
											<td>${dto.id}</td>
											<td>${dto.nickname}</td>
											<td>${dto.name}</td>
											<td>${dto.age}</td>
											<td>${dto.email}</td>
											<c:choose>
												<c:when test="${dto.grade eq 1}">
													<td>일반 회원</td>
												</c:when>
												<c:when test="${dto.grade eq 2}">
													<td>공연 관계자</td>
												</c:when>
												<c:otherwise>
													<td>관리자</td>
												</c:otherwise>
											</c:choose>
											<td>${dto.reg_date}</td>
											<td><input class="pBtn" type="button" value="UP"
												title='${dto.grade}' id='${dto.id}'> <input
												class="mBtn" type="button" value="DOWN" title='${dto.grade}'
												id='${dto.id}'></td>
											<td><input class="dBtn" type="button" value="삭제"
												id='${dto.id}'></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="Reser">
									<tr>
										<td>번호</td>
										<td>지역</td>
										<td>공연 이름</td>
										<td>시작시간</td>
										<td>수량</td>
										<td>구매일</td>
										<td>주문자</td>
										<td>주문번호</td>
										<td>취소 시키기</td>
									</tr>
									<c:forEach items="${list}" var="dto">
										<tr>
											<td>${dto.num}</td>
											<td>${dto.state}</td>
											<td>${dto.item_name}</td>
											<td>${dto.show_time}</td>
											<td>${dto.amount}</td>
											<td>${dto.buy_date}</td>
											<td>${dto.partner_user_id}</td>
											<td>${dto.partner_order_id}</td>
											<td><input class="dddBtn" type="button" value="취소"></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>글 번호</td>
										<td>제목</td>
										<td>글쓴이(닉네임)</td>
										<td>게시일</td>
										<td>조회수</td>
										<td>기능</td>
									</tr>
									<c:forEach items="${list}" var="dto">
										<tr>
											<td>${dto.num}</td>
											<td>${dto.title}</td>
											<td>${dto.writer}</td>
											<td>${dto.reg_date}</td>
											<td>${dto.hit}</td>
											<td><input type="button" value="삭제" class="ddBtn"id="${dto.num}" />
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						<!-- 페이징 처리 -->
						<c:choose>
							<c:when test="${board eq 'User'}">
								<div id="paging">
									<c:if test="${list[0].id eq null}">
										<ul class="pagination">
											<li class="pagingClick"><a href="a${board}List">결과가
													없습니다</a></li>
										</ul>
									</c:if>
									<c:if test="${list[0].id ne null}">
										<ul class="pagination">
											<c:choose>
												<c:when test="${pager.curBlock>1}">
													<li class="pagingClick"><a
														href="a${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
												</c:when>
												<c:otherwise>
													<li><a>이전</a></li>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
												var="i">
												<li class="pagingClick"><a
													href="a${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
											</c:forEach>
											<c:choose>
												<c:when test="${pager.curBlock < pager.totalBlock}">
													<li class="pagingClick"><a
														href="a${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
												</c:when>
												<c:otherwise>
													<li><a>다음</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</c:if>
								</div>
							</c:when>
							
							<c:otherwise>
								<div id="paging">
									<c:if test="${list[0].num eq null}">
										<ul class="pagination">
											<li class="pagingClick"><a href="a${board}List">결과가
													없습니다</a></li>
										</ul>
									</c:if>
									<c:if test="${list[0].num ne null}">
										<ul class="pagination">
											<c:choose>
												<c:when test="${pager.curBlock>1}">
													<li class="pagingClick"><a
														href="a${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
												</c:when>
												<c:otherwise>
													<li><a>이전</a></li>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
												var="i">
												<li class="pagingClick"><a
													href="a${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
											</c:forEach>
											<c:choose>
												<c:when test="${pager.curBlock < pager.totalBlock}">
													<li class="pagingClick"><a
														href="a${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
												</c:when>
												<c:otherwise>
													<li><a>다음</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</c:if>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<c:import url="../inc/admin_footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>