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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiWrite.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc046e4f4893e653801de407847c4b15&libraries=services"></script>	
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
      	<div class="conta">
  	      	<div class="fwrite_wrap">
  	      		<div class="fwrite_title">
  	      			<h3>${board}글쓰기</h3>
  	      		</div>

      		 <form action="./${board}Write" method="post" enctype="multipart/form-data" id="frm">
      		 	<table class="table table-bordered">
      		 	<tbody>
					<tr>
						<td class="td1"><label for="title">제목<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="title" id="title" style="width: 96%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="writer">작성자<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/pencil.png"><input type="text" name="writer" value="${member.nickname}memberNick" readonly="readonly" id="writer" style="width: 40%"></td>
					</tr>
					<tr>
						<td class="td1"><label for="contents">내용<span class="r">*</span></label></td>
						<td><textarea rows="" cols="" name="contents" id="contents"></textarea></td>
					</tr>
					<tr>
						<td class="td1"><label for="category">카테고리<span class="r">*</span></label></td>
						<td>
								<input type="radio" name="category" class="category" id="show" checked="checked" value="1">
								<label for="show">공연</label>
								<input type="radio" name="category" class="category" id="festival" value="2">
								<label for="festival">축제</label>						
								<input type="radio" name="category" class="category" id="daehakro" value="3">
								<label for="daehakro">대학로 연극</label>
						</td>
					</tr>
					<tr id="ageDiv">
						<td class="td1"><label for="age">연령제한<span class="r">*</span></label></td>
						<td>
							<input type="radio" name="ageSel" class="age" id="all" value="1" checked="checked"> 
							<label for="all">전연령</label>
							<input type="radio" name="ageSel" class="age" id="teen" value="2">
							<label for="teen">청소년 이상</label>
							<input type="radio" name="ageSel" class="age" id="adult" value="3">								<label for="adult">성인 이상</label>
							<input type="radio" name="ageSel" class="age" id="etc" value="4">
							<label for="etc">기타</label>
							<input type="text" class="age" id="age" name="age" value="1">
						</td>
					</tr>
					<tr>
						<td class="td1"><label for="startDate">시작일<span class="r">*</span></label></td>
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/calendar.png"><input type="date" name="startDate" class="date" id="startDate"></td>
					</tr>
					<tr>
						<td class="td1"><label for="endDate">종료일<span class="r">*</span></label></td>							
						<td><img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/calendar.png"><input type="date" name="endDate" class="date" id="endDate"></td>
					</tr>
					<tr class="daehakDiv">
						<td class="td1"><label for="price">가격</label></td>
						<td><input type="number" name="price" value="0"><span>&nbsp; &nbsp;원</span></td>
					</tr>
					<tr class="daehakDiv">
						<td class="td1"><label for="total">좌석 </label></td>
						<td><input type="number" name="total" value="0"><span>&nbsp; &nbsp;석</span></td>
					</tr>
					<tr>
						<td class="td1"><label for="local">지역<span class="r">*</span></label></td>
						<td>
							<img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/location.png">
							<input type="text" name="local1" id="local1" onclick="openMap()" style="width: 50%;">
							<input type="text" name="local2" id="local2" placeholder="상세주소를 입력해주세요" readonly="readonly"  style="width: 45%;" >
							<br>
							<img class="pencil" alt="" src="${pageContext.request.contextPath}/resources/images/location.png">								<input type="text" name="local" id="local" readonly="readonly"  style="width: 73%;" >
							<input type="checkbox" id="localConfirm">
							<label for="localConfirm" class="localConfirm">이 주소가 맞습니다.</label>
							<input type="hidden" name="region" id="region">
							<div id="map" style="width:100%;height:500px;margin-top:10px;display:none"></div>
						</td>
					</tr>
					<tr>
						<td class="td1"><label for="files">썸네일</label><span class="r">*</span></td>
						<td>
							<div id="thumbnailDiv">
								<div id="thumbnailSelectDiv">
									<input type="file" class="filelist" id="thumbnail" name="filelist" style="display: inline-block" accept=".jpg, .png, .gif, .jpeg">
									<span style="color: red">※  jpg, png, gif, jpeg 확장자만 업로드 가능합니다.</span>
								</div>
								<!-- 이미지 미리보기 -->
								<div id="preview">
									<img id="preview-img" src="#">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="td1"><label for="files">첨부파일</label></td>
						<td>
							<a id="addFiles"><img alt="" src="${pageContext.request.contextPath}/resources/images/cloud-computing.png">파일추가</a>
							<div id="files">
								<input type="file" class="filelist" name="filelist" style="display: inline-block">
								<!-- <span class="glyphicon glyphicon-remove deleteFile" style="display: inline-block"></span> -->
							</div>
						</td>
					</tr>
					<c:if test="${member.grade eq 3}">
					<tr>
						<td class="td1"><label for="top">상단 등록</label></td>
						<td><input type="checkbox" id="top" name="top" value="0">
						<label for="top">등록</label>
						</td>
					</tr>
					</c:if>
					
				</tbody>
				</table>

				
				<div id="datesOptionDiv"> <!-- 카테고리 3 -->
					<a class="btn btn-default" id="addOptions">옵션 추가하기</a>
					
					<div id="datesOption">
						<div id="option1">
							<div class="options">
								<div class="dateDiv">
									<label for="dates">날짜 </label>
									<input type="date" name="reg_date" class="dates">
								</div>
								<div class="timeDiv">
									<label for="time">시작시간</label>
									<input type="text" name="time" class="time">
								</div>		
								<div class="seatDiv">
									<label for="seat">좌석</label>
									<input type="number" name="seat" class="seat"><span> 석</span>
								</div>
								<div class="priceDiv">
									<label for="price">가격</label>
									<input type="number" name="price" class="price"><span> 원</span>
								</div>
							</div>
							<hr>
							
						</div>
					</div>
					
				</div>
				
				

				<a id="test">date test</a>
      		 	<a id="write" class="btn btn-default">등록</a>


				
			</form> 
  	      	</div>
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
/* 시작일, 종료일 비교 */
$('#endDate, #startDate').change(function(){
	var startDate = $( '#startDate' ).val();
    var startDateArr = startDate.split('-');
      
    var endDate = $( '#endDate' ).val();
    var endDateArr = endDate.split('-');
              
    var startDateCompare = new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);
    var endDateCompare = new Date(endDateArr[0], endDateArr[1]-1, endDateArr[2]);
      
    if(startDateCompare.getTime() > endDateCompare.getTime()) {          
        alert("시작날짜와 종료날짜를 확인해 주세요.");
        $('#endDate').val('');
        return;
    }
})


$('#hiddenDiv').hide();
//$('#datesOptionDiv').hide();
$('.category').click(function() {
	if($(this).val() != 3){
		$('#festiDatesDIV').show();
		$('#datesOptionDiv').hide();
	} else {
		$('#festiDatesDIV').show();
		$('#datesOptionDiv').show();
	}
});

$('#addOptions').click(function() {
	var option = $('#option1').html();
	var html = option
	$('#datesOption').append(html);
});
	
	
	//$(this).last().val()
	var min='';
	var max='';
	var endDate;
	var startDate;
	$('#datesOption').on('change','.dates',function(){
		var dates = [];
		var datesCompare = [];
		
		$('.dates').each(function(){
			dates.push($(this).val());
		})
		for(var i = 0; i<dates.length;i++){
			var dates2 = [];
			dates2 = dates[i].split('-');
			dates2 = new Date(dates2[0], dates2[1]-1, dates2[2]);
			datesCompare.push(dates2);
		}
		//console.log(datesCompare);
		/* endDate */
		var tmp1='';
		var tmp2 = '';
	
		if(datesCompare.length>1){
			for(var i = 0;i<datesCompare.length;i++){
				if(datesCompare[i]>max){
					max = datesCompare[i];
					endDate = dates[i];
				} 
				
				if(datesCompare[i]<min){
					min = datesCompare[i];
					startDate = dates[i];
				}

			}
		} else {
			startDate = dates[0];
			endDate = dates[0];
			max = datesCompare[0];
			min = datesCompare[0];
		}
		$('#endDate').val(endDate);
		$('#startDate').val(startDate);
		
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
	if($('#local2').val() != ''){
		var local = $('#local1').val()+"  "+$('#local2').val();
		$('#local').val(local);
	}
  });
 
// 주소API 끝-----------------


	

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
		$('#frm').submit();
		/* var title = $('#title').val() != '';
		var writer = $('#writer').val() != '';
		var contents = $('#contents').val() != '';
		var category = $('#category').val() != '';
		var age = $('#age').val() != '';
		var local = $('#local').val()!== '' && $('#localConfirm').is(':checked');
		if(title && writer && contents && category && age && local){
			$('#frm').submit();
		} else {
			alert('필수(*)를 모두 입력해주세요');
		} */
	});
</script>
</body>
</html>