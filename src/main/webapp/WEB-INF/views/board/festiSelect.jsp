<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${boardTitle}]${dto.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiSelect.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />

<!-- 작은 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript" src="../resources/js/calendar.js"></script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<div class="festi_top">
				<!-- 축제 핵심 내용 -->
				<div class="festi_wrap">
					<div class="bx_title">
					<strong>${dto.title}</strong>
					<a href="./${board}List?category=${dto.category}"><img alt="리스트 아이콘" src="../resources/images/festi/list.png"> </a>
					</div>
					<div class="detail_info">
						<div class="bx_img">
							<img alt="${dto.fileDTOs[0].oname}" src="../resources/images/board/${dto.fileDTOs[0].fname}">
						</div>
						<div class="btc_info">
							<dl>
								<dt class="bit">장소</dt>
								<dd class="bid">${dto.local}</dd>
								<dt class="bit">기간</dt>
								<dd class="bid">${dto.startDate} ~ ${dto.endDate}</dd>
								<dt class="bit">가격</dt>
								<dd class="bid">${dto.price} 원</dd>
								<dt class="bit">총 좌석</dt>
								<dd class="bid">${dto.total} 좌석</dd>
							</dl>
							
							<div class="btc_file">
							<em>파일 다운로드 : </em>
							<c:forEach items="${dto.fileDTOs}" var="f">
								<input type="button" title="${f.fname}" class="down" value="${f.oname}"> 
							</c:forEach>
							</div>
						</div>
					</div>
					<!-- 날짜 정하는 div -->
					<div class="detail_info_right">
						<input type="text" name="date" id="date1" size="12" />
						<dl class="doline_x">
							<dt>예매가능 회차</dt>
							<dd>
								<select class="festi_select">
									<option>10:00</option>
									<option>11:00</option>
								</select>
							</dd>
						</dl>
						<div class="reserve_button"><a href="#">예매하기</a></div>
						<div class="admin_button">
							<a href="./${board}Update?num=${dto.num}">수정</a> 
							<a id="delete">삭제</a>
						</div>
					</div>
				</div>
			</div>

						<p class="festi_contents">${dto.contents}</p>
					<c:forEach items="${dto.fileDTOs}" var="f">
						<input type="button" title="${f.fname}" class="down" value="${f.oname}"> 
					</c:forEach>
					
				<!-- 내용 끝 -->
				<!-- ajax 파일 다운로드 -->
				<div style="display:none;">
					<form action="../ajax/fileDownload" method="post" id="downForm">
						<input type="text" name="fname" id="fname">
						<input type="text" name="oname" id="oname">
						<input type="text" name="board" value="board">
					</form>

				<div class="festi_detail">
						<c:import url="../inc/festi_detail.jsp"></c:import>
				</div>
				<!-- 내용 끝 -->
				
					<!-- ajax 파일 다운로드 -->
							<div style="display:none;">
								<form action="../ajax/fileDownload" method="post" id="downForm">
									<input type="text" name="fname" id="fname">
									<input type="text" name="oname" id="oname">
									<input type="text" name="board" value="board">
								</form>
							</div>
				<!-- ajax 파일 다운로드 끝 -->
				
				<!-- 지우기 -->
				<div>
					<ol>
						<li>${dto.category}</li>
						<li>${dto.price}</li>
						<li>${dto.total}</li>
						<li>${dto.startDate}</li>
						<li>${dto.endDate}</li>
						<li>${dto.local}</li>
						<li>${dto.num}</li>
						<li>${dto.title}</li>
						<li>${dto.writer}</li>
						<li>${dto.contents}</li>
						<li>${dto.reg_date}</li>
						<li>${dto.hit}</li>
						<li>${dto.top}</li>
						<li>${dto.age}</li>
						<li>${dto.region}</li>						
					</ol>
				</div>
				
				<!-- 지우기 끝 -->
				<!-- 위치 지도 -->
				<div id="localMap" style="width: 100%; height: 500px;">
				
				</div>
				
				<a href="../after/afterWrite?num=${dto.num}">후기 작성</a>
				<%-- <c:if test="${member.grade > 1}"> --%> 
				<%-- </c:if> --%>
				
				<!--  후기 -->
				<table class="table">
					<thead>
						<th>NUM</th>
						<th>TITLE</th>
						<th>Writer</th>
						<th>DATE</th>
						<th>hit</th>
					</thead>
					<c:forEach items="${after}" var="i">
						<tr title="${i.anum}" class="afterSel">
							<td>${fn:substring(i.anum, 1,8)}</td>
							<td>${i.title}</td>
							<td>${i.writer}</td>
							<td>${i.reg_date}</td>
							<td>${i.hit}</td>
						</tr>					
					</c:forEach>
				</table>
   		</div>
	</div>
   <div id="footer">
      <c:import url="../inc/footer.jsp"></c:import>
   </div>
</div>
	
	<!-- script -->
	<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services"></script>	
	<script type="text/javascript">
	/* 글 삭제 */
	$('#delete').click(function() {
		var check = confirm('삭제하시겠습니까? 후기와 Q&A가 모두 삭제됩니다.');
		if(check){
			
			location.href="./${board}Delete?num=${dto.num}";
		}
	});
	
	/* 첨부파일 다운로드 */
	$('.down').click(function() {
		var fname=$(this).attr('title');
		var oname=$(this).val();
		$('#fname').val(fname);
		$('#oname').val(oname);
		$('#downForm').submit();
	});
	
	/* 후기 보기 */
	$('.afterSel').click(function() {
		location.href="../after/afterSelect?num="+$(this).attr('title');
	});
	
	var mapContainer = document.getElementById('localMap'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${dto.local}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.local}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
	
	
	
	geocoder.addressSearch('${dto.local}',function(result, status) {
		var y = result[0].y;
		var x = result[0].x;
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow(
		{
			zIndex : 1
		});
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(y,x), // 지도의 중심좌표
			level : 5 // 지도의 확대 레벨
		}; 
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);
		
		// 카테고리로 은행을 검색합니다
		ps.categorySearch('FD6',placesSearchCB,
		{
			useMapBounds : true
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data,status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
				}
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker(
			{
				map : map,
				position : new kakao.maps.LatLng(place.y,place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker,'click',function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
					+ place.place_name + '</div>');
				infowindow.open(map,marker);
			});
		}
	});

</script>

</body>
</html>