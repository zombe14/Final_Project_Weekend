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
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services"></script>	
<!-- date picker -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- date picker -->
<style type="text/css">
	#preview-img{
		width: 300px;
		height: auto;
		border-radius: 4px;
	}
	.r{
		color:red;
	}
</style>
</head>
<body>
   <div id="wrap">
      <div id="header">
      <c:import url="../inc/header.jsp"></c:import>
      </div>
      <div id="container">
      	<div class="conta">
  	      	
      		 <form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
				
				<div>
					<label for="title">제목<span class="r">*</span></label>
					<input type="text" name="title" id="title">
				</div>
				<div>
					<label for="writer">작성자<span class="r">*</span></label>
					<input type="text" name="writer" value="${member.nickname}memberNick" readonly="readonly" id="writer">
				</div>
			
				<div>
					<label for="contents">내용<span class="r">*</span></label>
					<textarea rows="" cols="" name="contents" id="contents"></textarea>
				</div>
				<div>
				<label for="files">썸네일</label><span>&nbsp; &nbsp; ※  jpg, png, gif, jpeg 확장자만 업로드 가능합니다.</span>
					<div id="thumbnailDiv">
						<div id="thumbnailSelectDiv">
							<input type="file" class="filelist" id="thumbnail" name="filelist" style="display: inline-block" accept=".jpg, .png, .gif, .jpeg">
							
						</div>
						<!-- 이미지 미리보기 -->
						<div id="preview">
							<img id="preview-img" src="#">
						</div>
					</div>
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
					<label for="category">대분류<span class="r">*</span></label>
					<input type="radio" name="firstCategory" class="mainFesti" id="show" checked="checked" > 공연
					<input type="radio" name="firstCategory" class="mainFesti" id="festival"> 축제							

					<div class="subShow">
						<label for="writer">소분류<span class="r">*</span></label>
						<input type="radio" name="subFesti" class="t" value="4" id="showFirst"> 지방 연극
						<input type="radio" name="subFesti" class="t" value="5"> 대학로 연극
						<input type="radio" name="subFesti" class="t" value="6"> 콘서트
					</div>
					
					<div class="subFestival">
						<label for="writer">소분류<span class="r">*</span></label>
						<input type="radio" name="subFesti" class="t" value="1" id="festiFirst">전시
						<input type="radio" name="subFesti" class="t" value="2"> 행사	
						<input type="radio" name="subFesti" class="t" value="3"> 레저
					</div>
					<input type="hidden" id="category" name="category" value="4">
				</div>
				<div>
					<label for="startDate">시작일<span class="r">*</span></label>
					<input type="date" name="startDate" class="date">  
				</div>
				<div>
					<label for="endDate">종료일<span class="r">*</span></label>
					<input type="date" name="endDate" class="date">
				</div>
				<div>
					<label for="price">가격</label>
					<input type="number" name="price" value="0"><span>원</span>
				</div>
				<div id="totalDiv">
					<label for="total">좌석 </label>
					<input type="number" name="total" value="0"><span>석</span>
				</div>
				<div id="ageDiv">
					<label for="age">연령제한<span class="r">*</span></label>
					<input type="radio" name="ageSel" class="age" id="all" value="1" checked="checked"> 전연령
					<input type="radio" name="ageSel" class="age" id="teen" value="2"> 청소년 이상
					<input type="radio" name="ageSel" class="age" id="adult" value="3"> 성인 이상
					<input type="radio" name="ageSel" class="age" id="etc" value="4"> 기타
					<input type="text" class="age" id="age" name="age" value="1">
				</div>
				<div>
					<label for="local">지역<span class="r">*</span></label>
					<input type="text" name="local1" id="local1" onclick="openMap()" style="width: 30%;">
					<input type="text" name="local2" id="local2" placeholder="상세주소를 입력해주세요" readonly="readonly"  style="width: 20%;" >
					<input type="text" name="local" id="local" readonly="readonly"  style="width: 30%;" >
					이 주소가 맞습니다. <input type="checkbox" id="localConfirm">
					<input type="hidden" name="region" id="region">
					<div id="map" style="width:100%;height:500px;margin-top:10px;display:none">
					</div>
				</div>
				<%-- <c:if test="${member.grade eq 3}">  추가하기 --%>
				<div>
					<label for="top">상단에 등록 하기</label>
					<input type="checkbox" id="top" name="top" value="0">
				</div>
				<%-- </c:if> --%>
				
      		 	<a id="write" class="btn btn-default">등록</a>
			</form> 
			
      	</div>
      </div>
      <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
      </div>
   </div>
   
<!-- 지도 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 	
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


//썸네일
	$("#preview").hide();
	function readURL(input) {
		 
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	 
	        reader.onload = function (e) {
	            $('#preview-img').attr('src', e.target.result);
	        }
	 
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	 
	$("#thumbnail").change(function(){
		$("#preview").show();
	    readURL(this);
	});
// 썸네일 끝

// date picker

/* date picker 끝 */

// 주소API
// kakao javascript 키 : a0490863a01534a71d43148be8c27866
// kakao rest api 키 :  1fed67e3c9e7106ca669a3f4c7350837
 //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
      center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
      level: 7 // 지도의 확대 레벨
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
              document.getElementById("local1").value = addr;
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
                      marker.setPosition(coords);
                  }
              });
          }
      }).open();
  }
  
  $('#local1').blur(function() {
	  $('#local2').val('')
	  $('#local').val('');
	  if($('#local1').val() != ''){
		  $('#local2').removeAttr('readonly');
		  $('#local').val($('#local1').val());
		  $('#region').val($('#local').val().substr(0,2));	  
	  } else {
		  $('#local2').attr('readonly','readonly');
	  }
  });
  
  $('#local2').blur(function() {
	$('#local').val('');
	if($('#local2').val() != ''){
		var local = $('#local1').val()+"   "+$('#local2').val();
		$('#local').val(local);
	}
  });
 
// 주소API 끝-----------------


	/* category */
	$('.subFestival').hide();
	$('#showFirst').prop('checked', true);

	$('.mainFesti').click(function() {
		if ($(this).attr('id') == 'show') {
			$('.subShow').show();
			$('.subFestival').hide();
			$('#showFirst').prop('checked', true);
			$('#category').val('4');
			$('#totalDiv').show();
		} else {
			$('.subShow').hide();
			$('.subFestival').show();
			$('#festiFirst').prop('checked', true);
			$('#category').val('1');
			$('#totalDiv').hide();
		}
	});

	$('.t').change(function() {
		$('#category').val($(this).val());
	});
	
	/* 연령제한 */
	$('#age').hide();
	$('.age').click(function() {
		$('#age').val($(this).val());
		if($('#etc').prop('checked')){
			$('#age').show();
			$('#age').val('');
		} else {
			$('#age').hide();
		}
	});
	
	/* 가격상세 */
	

	$('#write').click(function() {
		var title = $('#title').val() != '';
		var writer = $('#writer').val() != '';
		var contents = $('#contents').val() != '';
		var category = $('#category').val() != '';
		var age = $('#age').val() != '';
		var local = $('#localConfirm').is(':checked');
		if(title && writer && contents && category && age && local){
			console.log(title, writer, contents, category, age, local);
			//alert('ok');
			$('#frm').submit();
		} else {
			console.log(title, writer, contents, category, age, local);
			//alert('필수(*)를 모두 입력해주세요');
		}
	});
</script>
</body>
</html>