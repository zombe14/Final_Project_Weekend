<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">
            <div class="img_area">
                <ul class="img_box">
                    <li style="background-image:url(//tketlink.dn.toastoven.net/markup_resources/2019071801/web/img/company/main_img.jpg)">
                        <strong>주말 뭐해</strong>
                        <p class="txt">
                            고객을 위한 최고의<br>티켓예매 서비스를 제공하기 위해<br>앞장서는 사람들이 모인 곳
                        </p>
                    </li>
                </ul>
            </div>

            <div class="co_info">
                <div class="layout">
                    <div class="co_info_01">
                        <img src="//tketlink.dn.toastoven.net/markup_resources/2019071801/web/img/company/co_info_01.png" alt="">
                        <p>
                            <strong>국내 최초의 티켓팅 업체로, <br>모든 장르의 티켓예매 서비스</strong>
                            인터넷, 모바일, 콜센터, 유/무인 예매처까지 다양한 <br>예매채널을 운영하며, 대/소규모 공연과 <br>각종 전시 및 체험 프로그램, 국내 최다수의 <br>프로야구 구단 티켓 예매 서비스 제공
                        </p>
                    </div>
                    <div class="co_info_02">
                        <img src="//tketlink.dn.toastoven.net/markup_resources/2019071801/web/img/company/co_info_02.png" alt="">
                        <p>
                            <strong>문화 선진화에 앞장서는 <br>입장권 표준 전산망 시스템 구축</strong>
                            국내 문화산업의 선진화를 위해 공연장, 관광시설, <br>경기장 등 현장 매표소에 표준화된 전산발매 시스템을 <br>설치하고, 온라인과 더불어 통합네트워크로 연결하는 <br>인프라 구축
                        </p>
                    </div>
                    <div class="co_info_03">
                        <img src="//tketlink.dn.toastoven.net/markup_resources/2019071801/web/img/company/co_info_03.png" alt="">
                        <p>
                            <strong>다년간 축적된 노하우로 마케팅 및 <br>고객 분석 서비스 제공</strong>
                            통계 시스템을 활용한 고객 티켓 예매 현황을 <br>수집/분석하여 기획사 및 구단에 <br>최고의 마케팅 솔루션을 제공
                        </p>
                    </div>
                </div>
            </div>

            <div class="map" id="mapContainer">
                <%-- <img src="${pageContext.request.contextPath}/resources/images/home/지도.JPG" alt="" style="width: 1000px;"> --%>
				<!-- 구글 맵 api -->
				<div id="map_ma"></div>
				<script type="text/javascript">
					$(document).ready(function() {
						var myLatlng = new google.maps.LatLng(37.556806,126.919570); // 위치값 위도 경도
						var Y_point			= 37.556806;		// Y 좌표
						var X_point			= 126.919570;		// X 좌표
						var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
						var markerTitle		= "주말뭐해";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
						var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

						// 말풍선 내용
						var contentString	= '<div>' + '<h3>주말뭐해</h3>'+ '<br>' +'<p> 전국 소규모 축제를 알리기 위해 앞장서는 사람들이 모인 곳</p>' + '</div>';
						var myLatlng = new google.maps.LatLng(Y_point, X_point);
						var mapOptions = {
								zoom: zoomLevel,
								center: myLatlng,
								mapTypeId: google.maps.MapTypeId.ROADMAP
							}
						var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
						var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
						});
						var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
						);
						google.maps.event.addListener(marker, 'click', function() {
							infowindow.open(map, marker);
						});
					});
		</script>                
            </div>
			
        </div>

