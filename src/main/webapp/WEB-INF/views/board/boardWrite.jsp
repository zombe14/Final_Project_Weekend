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
<!-- date picker -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- date picker -->
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
				
				<!-- 축제/공연 작성시에만 보이게 -->
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
							<input type="date" name="startDate" class="date">  
						</div>
						<div>
							<label for="endDate">종료일<span>*</span></label>
							<input type="date" name="endDate" class="date">
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
							<input type="text" name="local" id="local" onclick="openMap()">
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none">
							</div>
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
   
<!-- 지도 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services"></script>	
<!-- 썸머노트 -->
<script src="../resources/js/summernote.js"></script>
<!-- script -->
<script type="text/javascript">

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


//상단 배치 체크박스에 값 주기 ( 1: 등록하기 / 0: 등록안함)
$('#top').click(function(){
	if($(this).is(':checked')){
		$(this).val(1);
	} else {
		$(this).val(0);
	}
});

/* 첨부 파일 관리 끝 */


// date picker

/* date picker 끝 */

// 주소API
// kakao javascript 키 : a0490863a01534a71d43148be8c27866
// kakao rest api 키 :  1fed67e3c9e7106ca669a3f4c7350837
 //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
      center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
      level: 5 // 지도의 확대 레벨
  };
  
  //지도를 미리 생성
  var map = new daum.maps.Map(mapContainer, mapOption);
  //주소-좌표 변환 객체를 생성
  var geocoder = new daum.maps.services.Geocoder();
  //마커를 미리 생성
  var marker = new daum.maps.Marker({
      position: new daum.maps.LatLng(37.537187, 127.005476),
      map: map
  });
  
  function openMap() {
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = data.address; // 최종 주소 변수

              // 주소 정보를 해당 필드에 넣는다.
              document.getElementById("local").value = addr;
              // 주소로 상세 정보를 검색
              geocoder.addressSearch(data.address, function(results, status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                      var result = results[0]; //첫번째 결과의 값을 활용

                      // 해당 주소에 대한 좌표를 받아서
                      var coords = new daum.maps.LatLng(result.y, result.x);
                      // 지도를 보여준다.
                      mapContainer.style.display = "block";
                      map.relayout();
                      // 지도 중심을 변경한다.
                      map.setCenter(coords);
                      // 마커를 결과값으로 받은 위치로 옮긴다.
                      marker.setPosition(coords)
                  }
              });
          }
      }).open();
  }
    
 
// 주소API 끝-----------------



</script>
</body>
</html>