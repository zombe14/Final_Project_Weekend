<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 카카오맵 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />

<!-- 카카오맵  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc046e4f4893e653801de407847c4b15"></script> 

</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="../inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<div class="conta">
		
			<!-- 카카오맵 -->
			<div id="map" style="width:1000px;height:600px;"></div>
		</div>
	</div>
	<div id="footer">
		<c:import url="../inc/footer.jsp"></c:import>
	</div>
</div>
<script>

	// 카카오맵 jsp에 띄우기
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(36.2683, 127.6358),
		level: 12
	};

	var map = new kakao.maps.Map(container, options);  
	customOverlay = new kakao.maps.CustomOverlay({}),
	infowindow = new kakao.maps.InfoWindow({removable: true});
	
    $.getJSON("${pageContext.request.contextPath}/resources/json/korea.geojson", function(geojson){
    	
    	var data = geojson.features;
    	var coordinates = []; // 좌표 저장할 배열
    	var name = '';	// 행정 구 이름
    	
    	console.log(data);
    	$.each(data, function(index, val){
    		
    		coordinates = val.geometry.coordinates;
    		name = val.properties.CTP_KOR_NM;
		/*  console.log(coordinates);
    		console.log(name);         */
    		displayArea(coordinates, name);
    	})
    })
    
   var polygons = [];
		
     
// 다각형을 생성하고 이벤트를 등록하는 함수입니다
function displayArea(coordinates, name) {
	var path =[];
	var points = [];
	$.each(coordinates[0], function(index, coordinate){
		var point = new Object();
		point.x = coordinate[1];
		point.y = coordinate[0];
		points.push(point);
		/* console.log(point.x);
		console.log(point.y); */
		/* console.log(points); */
		path.(push(new kakao.maps.LatLng(point.x, point.y));
		
		console.log(path);   
	})
	
	var polygon = new kakao.maps.Polygon({
		map : map,
		path : path,
		strokeWeight : 2,
		strokeColor : '#004c80',
		strokeOpacity : 0.8,
		fillColor : '#fff',
		fillOpacity : 0.7
	});
	
	// 폴리곤 이벤트 주기 < 마지막에 >
	
	/* polygons.push(polygon);
	
	daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent){
		polygon.setOptions({
			fillColor : '#09f'
		});
		
		customOverlay.setContent('<div class="area">'+name+'</div>');
		
		customOverlay.setPosition(mouseEvent.latLng);
		customOverlay.setMap(map);
	});
	
	daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent){
		customOverlay.setPosition(mouseEvent.latLng);
	});
	
	daum.maps.event.addListener(polygon,'mouseout', function(){
		polygon.setOptions({
			fillColor : '#fff'
		});
		customOverlay.setMap(null);
	});
	
	daum.maps.event.addListener(polygon, 'click', function(){
		var level = map.getLevel()-2;
	
		map.setLevel(level, {anchor: centroid(points), animate: {
			duration: 350
		}});
		
		deletePolygon(polygons);
	}); */
	
}
</script>
</body>
</html>