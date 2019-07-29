<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<c:import url="../temp/summernote.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${boardTitle} Write</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="inner">
  	      	
      		 <form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
	
				<div>
					<label for="title">제목<span>*</span></label>
					<input type="text" name="title">
				</div>
				<div>
					<label for="writer">작성자<span>*</span></label>
					<input type="text" name="writer" placeholder="session nickname (Admin) + readonly">
				</div>
				<div>
					<label for="contents">내용<span>*</span></label>
					<textarea rows="" cols="" name="contents" id="contents"></textarea>
				</div>
				<div>
					<label for="files">첨부파일</label>
					<a id="addFiles">파일추가</a>
					<div id="files">
						<div>
							<input type="file" class="filelist" name="filelist" style="display: inline-block">
							<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>
						</div>
					</div>
				</div>
				
				<div>
				<%-- <c:if test="${member.grade eq 3}"> --%>
					상단에 등록 하기 <input type="checkbox" id="top" name="top" value="0">
				<%-- </c:if> --%>
				</div>
				
				<c:if test="${sort eq 'festi'}">
					<div>
						<div>
							<label for="category">대분류</label>
							<c:choose>
								<c:when test="${board eq 'festival'}">
									<input type="radio" checked="checked"> 축제
									<div>
										<label for="writer">소분류<span>*</span></label>
										<input type="radio" name="category" value="1" checked="checked"> 전시
										<input type="radio" name="category" value="2"> 행사	
										<input type="radio" name="category" value="3"> 레저
									</div>
								</c:when>
								<c:when test="${board eq 'show'}">
									<input type="radio" checked="checked"> 공연
									<div>
										<label for="writer">소분류<span>*</span></label>
										<input type="radio" name="category" value="4" checked="checked"> 지방 연극
										<input type="radio" name="category" value="5"> 대학로 연극
										<input type="radio" name="category" value="6"> 콘서트
									</div>
								</c:when>
							</c:choose>
						</div>
						<div>
							<label for="startDate">시작일<span>*</span></label>
							<input type="date" name="startDate">
						</div>
						<div>
							<label for="endDate">종료일<span>*</span></label>
							<input type="date" name="endDate">
						</div>
						<div>
							<label for="price">가격</label>
							<input type="number" name="price" value="0"><span>원</span>
						</div>
						<div>
							<label for="total">좌석 </label>
							<input type="number" name="total" value="0"><span>개</span>
						</div>
						<div>
							<label for="local">지역<span>*</span></label>
							<input type="text" name="local">
						</div>
					</div>
				</c:if>
				
				
				<input type="button" id="write" value="등록">
			</form> 
			
      	</div>
      </div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
   
<!-- script -->
<script src="../resources/js/summernote.js"></script>
<script type="text/javascript">
//상단 배치 체크박스에 값 주기 ( 1: 등록하기 / 0: 등록안함)
$('#top').click(function(){
	if($(this).is(':checked')){
		$(this).val(1);
	} else {
		$(this).val(0);
	}
});

/* 첨부 파일 관리 */
// 개수 제한. 최대 5개까지.
var limit = 1;
// 파일 추가
$('#addFiles').click(function() {
	var addFiles = '<div>'
						+'<input type="file" class="filelist" name="filelist" style="display: inline-block"> '
						+'<span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span>'
					+'</div>';
	if(limit<5){
		$('#files').append(addFiles);
		limit++
	} else {
		alert("최대 5개까지 첨부가능합니다.");
	}
});

// 정적인 input 파일 제거
$('.deleteFile').click(function() {
	$(this).parent().remove();
	limit--
});

// 동적으로 그려진 input file 제거
$('#files').on('click','.deleteFile',function(){
	$(this).parent().remove();
	limit--
});
/* 첨부 파일 관리 끝 */
	
</script>
</body>
</html>