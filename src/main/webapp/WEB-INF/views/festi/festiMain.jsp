<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카카오 지도</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/festiMain.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="../inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<div class="conta">
			<div class="map_wrap">
				<div class="festimap_title">
  	      			<img alt="" src="${pageContext.request.contextPath}/resources/images/worldwide.png"><strong> 전국 시도 선택 </strong>
  	      		</div>
				<div id="map" class="map" style="width:100%;height:100%; position: relative; overflow:hidden;"></div>
				<!-- 지도타입 컨트롤 div 입니다 -->
    			<div class="custom_typecontrol radius_border">
        			<span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        			<span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
   				</div>
    			<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    			<div class="custom_zoomcontrol radius_border"> 
        			<span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        			<span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    			</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<c:import url="../inc/footer.jsp"></c:import>
	</div>
</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc046e4f4893e653801de407847c4b15"></script>
<script>
	$('#map').on('click','#daum-maps-shape-0',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=제주';
	});
	$('#map').on('click','#daum-maps-shape-3',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=전남';
	});
	$('#map').on('click','#daum-maps-shape-12',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=광주';
	});
	$('#map').on('click','#daum-maps-shape-4',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=전북';
	});
	$('#map').on('click','#daum-maps-shape-1',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=경남';
	});
	$('#map').on('click','#daum-maps-shape-16',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=부산';
	});
	$('#map').on('click','#daum-maps-shape-10',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=울산';
	});
	$('#map').on('click','#daum-maps-shape-15',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=대구';
	});
	$('#map').on('click','#daum-maps-shape-2',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=경북';
	});
	$('#map').on('click','#daum-maps-shape-6',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=충북';
	});
	$('#map').on('click','#daum-maps-shape-9',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=세종';
	});
	$('#map').on('click','#daum-maps-shape-11',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=대전';
	});
	$('#map').on('click','#daum-maps-shape-5',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=충남';
	});
	$('#map').on('click','#daum-maps-shape-14',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=인천';
	});
	$('#map').on('click','#daum-maps-shape-17',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=서울';
	});
	$('#map').on('click','#daum-maps-shape-8',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=경기';
	});
	$('#map').on('click','#daum-maps-shape-7',function(){
		location.href = '${pageContext.request.contextPath}/festi/festiList?category=2&region=강원';
	});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
    		center: new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
    		level: 13 // 지도의 확대 레벨
		};

	var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true});
	
	
	//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'btn';
	    } else {
	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'btn';
	    }
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}


   //행정구역 구분
   $.getJSON("${pageContext.request.contextPath}/resources/json/map.geojson", function(json) {
       var data = json.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = "";            //행정 구 이름
       var type = "";
 
       $.each(data, function(index, val) {
 
           coordinates = val.geometry.coordinates;
           
           name = val.properties.name;
           
           type = val.geometry.type;
    if(type=="Polygon"){
             displayArea2(coordinates, name);
   }else{
        displayArea(coordinates, name);
   }
           
           
           
       })
   })
 
 
   var polygons=[];                //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
    

   /* // 지도에 영역데이터를 폴리곤으로 표시합니다 
   for (var i = 0, len = areas.length; i < len; i++) {
       displayArea(areas[i]);
   } */

   // 다각형을 생상하고 이벤트를 등록하는 함수입니다
   function displayArea2(coordinates, name) {
      var path = [];            //폴리곤 그려줄 path
       var points = [];        //중심좌표 구하기 위한 지역구 좌표들
       console.log("polygon");
       console.log(name);
       $.each(coordinates, function(index, coordinate) {        //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
          console.log(coordinate);
          for(var i=0; i<coordinate.length; i++){
             console.log(coordinate[i]);
             var point = new Object(); 
             $.each(coordinate[i], function(index, cc) {
                console.log(index);
                if(index == 1){
                   point.x = cc;
                }else{
                   point.y = cc;
                }
            });
              points.push(point);
               path.push(new kakao.maps.LatLng(point.x, point.y));
          }
       });

       // 다각형을 생성합니다 
       var polygon = new kakao.maps.Polygon({
           map: map, // 다각형을 표시할 지도 객체
           path: path,
           strokeWeight: 2,
           strokeColor: '#004c80',
           strokeOpacity: 0.8,
           fillColor: '#fff',
           fillOpacity: 0.7 
       });

       // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
       // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
       kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
           polygon.setOptions({fillColor: '#09f'});
   
           customOverlay.setContent('<div class="area">' + name + '</div>');
           
           customOverlay.setPosition(mouseEvent.latLng); 
           customOverlay.setMap(map);
       });

       // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
       kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
           customOverlay.setPosition(mouseEvent.latLng); 
       });

       // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
       // 커스텀 오버레이를 지도에서 제거합니다 
       kakao.maps.event.addListener(polygon, 'mouseout', function() {
           polygon.setOptions({fillColor: '#fff'});
           customOverlay.setMap(null);
       }); 

       // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
         /* kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        	//location.href = '${pageContext.request.contextPath}/festi/festiList?category=1';
             var content = '<div class="info">' + 
                       '   <div class="title">' + name + '</div>' +
                       '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>' +
                       '</div>';

           infowindow.setContent(content); 
           infowindow.setPosition(mouseEvent.latLng); 
           infowindow.setMap(map);  
       });   */
       }


   
   function displayArea(coordinates, name) {
      var path = [];            //폴리곤 그려줄 path
       var points = [];        //중심좌표 구하기 위한 지역구 좌표들
       $.each(coordinates, function(index, coordinate) {        //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
          for(var i=0; i<coordinate.length; i++){
             $.each(coordinate[i], function(index, cc) {
                var point = new Object(); 
                  point.x = cc[1];
                  point.y = cc[0];
                  points.push(point);
                  path.push(new kakao.maps.LatLng(cc[1], cc[0]));
            });
          }           


       // 다각형을 생성합니다 
       var polygon = new kakao.maps.Polygon({
           map: map, // 다각형을 표시할 지도 객체
           path: path,
           strokeWeight: 2,
           strokeColor: '#004c80',
           strokeOpacity: 0.8,
           fillColor: '#fff',
           fillOpacity: 0.7 
       });

       // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
       // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
       kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
           polygon.setOptions({fillColor: '#09f'});
           customOverlay.setContent('<div class="area">' + name + '</div>');
        
           customOverlay.setPosition(mouseEvent.latLng); 
           customOverlay.setMap(map);
       });

       // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
       kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
        
           customOverlay.setPosition(mouseEvent.latLng); 
       });

       // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
       // 커스텀 오버레이를 지도에서 제거합니다 
       kakao.maps.event.addListener(polygon, 'mouseout', function() {
           polygon.setOptions({fillColor: '#fff'});
           customOverlay.setMap(null);
       }); 

       // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
        /*  kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        	 // location.href = '${pageContext.request.contextPath}/festi/festiList?category=1';
            var content = '<div class="info">' + 
                       '   <div class="title">' + name + '</div>' +
                       '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>' +
                       '</div>';

           infowindow.setContent(content); 
           infowindow.setPosition(mouseEvent.latLng); 
           infowindow.setMap(map); 
       });   */
       });
       
   }
   
   
</script>
</body>
</html>