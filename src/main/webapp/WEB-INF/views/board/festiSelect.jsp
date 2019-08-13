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
<!-- 지도 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/restaMap.css"> 

<!-- 작은 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript" src="../resources/js/calendar.js"></script>
<style type="text/css">
#menu_wrap3 {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    width: 250px;
    margin: 10px 0 30px 10px;
    padding: 5px;
    overflow-y: auto;
    background: rgba(255, 255, 255, 0.7);
    z-index: 1;
    font-size: 12px;
    border-radius: 10px;
}
#menu_wrap3 hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 2px solid #5F5F5F;
    margin: 3px 0;
}

#placesList3 .item .marker_1 {
    background-position: 0 -10px;
}

#placesList3 .item span {
    display: block;
    margin-top: 4px;
}

#placesList3 .item {
    position: relative;
    border-bottom: 1px solid #888;
    overflow: hidden;
    cursor: pointer;
    min-height: 65px;
}
#placesList3 li {
    list-style: none;
}

#placesList3 .item .info {
    padding: 10px 0 10px 10px;
}
#placesList3 .item h5, #placesList .item .info {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
#placesList3 .info .tel {
    color: #009900;
}

#placesList3 .item .markerbg {
    float: left;
    position: absolute;
    width: 36px;
    height: 37px;
    margin: 10px 0 0 10px;
    /* background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat; */
}
#placesList3 .info .jibun {
    padding-left: 26px;
    background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
}
#placesList3 .info .gray {
    color: #8a8a8a;
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
								<!-- ajax 파일 다운로드 -->
							<div style="display:none;">
								<form action="../ajax/fileDownload" method="post" id="downForm">
									<input type="text" name="fname" id="fname">
									<input type="text" name="oname" id="oname">
									<input type="text" name="board" value="board">
								</form>
							</div>
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
							<form action="./festiDelete" id="festiDeleteFrm" method="post">
								<input type="hidden" name="num" value="${dto.num}">
							</form>
						</div>
					</div>
				</div>
			</div>

				<div class="festi_detail">
						<c:import url="../inc/festi_detail.jsp"></c:import>
				</div>
		
		<!-- 테스트용-------------------------------------------------------------- -->
				
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
				
				<!-- 장소 지도 -->
				<div>
					<h2>공연장정보</h2>
					<br>
					<div>
						<h3>위치</h3>
						<div id="localMap" style="width: 100%; height: 500px;"></div>
					</div>
					<br>
					<!-- 주변 맛집 -->
					<div id="resta">
						<h3>주변 식당</h3>
						<div class="map_wrap">
						    <div id="map2" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>
							<!-- 리스트 -->
						    <div id="menu_wrap" class="bg_white">
						        <div class="option">
						            <div>
						                <form onsubmit="searchPlaces(); return false;">
						                   <input type="text" value="${dto.local} 맛집" id="keyword" size="10" readonly="readonly"> 
						                   <button type="submit">검색하기</button> 
						                </form>
						            </div>
						        </div>
						        <hr>
						        <ul id="placesList"></ul>
						        <div id="pagination"></div>
						    </div>
						</div>
					</div>
					<br>
					<!-- 주변 숙소 -->
					<div id="hotel">
						<h3>주변 숙소</h3>
						<div class="map_wrap">
						    <div id="map3" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>
							<!-- 리스트 -->
						    <div id="menu_wrap3" class="bg_white">
						        <div class="option">
						            <div>
						                <form onsubmit="searchPlaces3(); return false;">
						                   <input type="text" value="${dto.local} 숙소" id="keyword3" size="10" readonly="readonly"> 
						                   <button type="submit">검색하기</button> 
						                </form>
						            </div>
						        </div>
						        <hr>
						        <ul id="placesList3"></ul>
						        <div id="pagination3"></div>
						    </div>
						</div>
					</div>
				</div>
				<!-- 지도 끝 -->
				
				
				
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
				
				<!--  질문 -->
				<a href="../festiQna/fqnaWrite?num=${dto.num}">질문하기</a>
				<table class="table">
					<thead>
						<th>NUM</th>
						<th>TITLE</th>
						<th>Writer</th>
						<th>DATE</th>
						<th>상태</th>
					</thead>
					<c:forEach items="${qna}" var="i">
						<tr title="${i.qnum}" class="qnaSel">
							<td>${fn:substring(i.qnum, 1,8)}</td>
							<td><c:if test="${i.depth eq '1'}">&nbsp;&nbsp;&nbsp;&nbsp;답변 : </c:if>${i.title}</td>
							<td>${i.writer}</td>
							<td>${i.reg_date}</td>
							<td><c:if test="${i.answer eq '0'}">답변대기중</c:if>
								<c:if test="${i.answer eq '1'}">답변완료</c:if>
							</td>
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
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0490863a01534a71d43148be8c27866&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
	/* 글 삭제 */
	$('#delete').click(function() {
		var check = confirm('삭제하시겠습니까? 후기와 Q&A가 모두 삭제됩니다.');
		if(check){
			$('#festiDeleteFrm').submit();
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
	/* 질문 보기 */
	$('.qnaSel').click(function() {
		location.href="../festiQna/fqnaSelect?qnum="+$(this).attr('title');
	});
	
	
	
	/* 행사 위치 */
	var mapContainer1 = document.getElementById('localMap'), // 지도를 표시할 div 
    mapOption1 = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map1 = new kakao.maps.Map(mapContainer1, mapOption1); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder1 = new kakao.maps.services.Geocoder();
	var local = "${dto.local}";
	// 주소로 좌표를 검색합니다
	geocoder1.addressSearch(local, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map1,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+local+'</div>'
	        });
	        infowindow.open(map1, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map1.setCenter(coords);
	    } 
	}); 
		
	
	
	

	/* 행사주변 맛집 */
	// 마커를 담을 배열입니다
	var markers = [];
	var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	        $('#resta').show();
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	    	$('#resta').hide();
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	    	$('#resta').hide();
	        return;
	
	    }
	}
	
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

	 
	 
	 
	/* 근처 숙박업소 */

	var markers3 = [];
	var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div 
    mapOption3 = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	var map3 = new kakao.maps.Map(mapContainer3, mapOption3);
	var ps3 = new kakao.maps.services.Places();
	var infowindow3 = new kakao.maps.InfoWindow({zIndex:1});
	searchPlaces3();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces3() {
	
	    var keyword = document.getElementById('keyword3').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps3.keywordSearch( keyword, placesSearchCB3); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB3(data, status, pagination3) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces3(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination3(pagination);
	        $('#hotel').show();
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	    	 $('#hotel').hide();
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	    	$('#hotel').hide();
	        return;
	
	    }
	}
	
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces3(places) {
	
	    var listEl = document.getElementById('placesList3'),
	    menuEl = document.getElementById('menu_wrap3'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker3(placePosition, i), 
	            itemEl = getListItem3(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow3(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow3.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow3(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow3.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	  
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map3.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem3(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker3(position, idx, title) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map3); // 지도 위에 마커를 표출합니다
	    markers3.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers3.length; i++ ) {
	        markers3[i].setMap(null);
	    }   
	    markers3 = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination3(pagination) {
	    var paginationEl = document.getElementById('pagination3'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow3(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow3.setContent(content);
	    infowindow3.open(map3, marker);
	}
	
</script>

</body>
</html>