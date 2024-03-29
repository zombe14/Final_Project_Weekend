/* 오른쪽 작은 컨테이너 움직임 조절*/
$(document).ready(function() {
	var bodyOffset = jQuery('body').offset();
	$(window).scroll(function() {
		if (jQuery(document).scrollTop() > bodyOffset.top+400) {
			jQuery('#wingright').addClass('right_suv');
		} else {
			jQuery('#wingright').removeClass('right_suv');
		}
	});
	
});

/* 티켓 오픈 */
$(document).ready(function(){
	$('.tm1').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/청춘페스티벌.gif');
	});
	$('.tm2').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/워라벨왕산비치.jpg');
	});
	$('.tm3').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/아시아뮤직페스티벌.jpg');
	});
	$('.tm4').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/냉이축제.jpg');
	});
	$('.tm5').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/신촌물총축제.jpg');
	});
});

/* 축제 랭크 */
$(document).ready(function(){
	$('.rankingItem1').mouseover(function(){
		$('.first2 img').attr('src','./resources/images/home/대박워터파크.jpg');
	});
	$('.rankingItem2').mouseover(function(){
		$('.first2 img').attr('src','./resources/images/home/옐로우리버비치.jpg');
	});
	$('.rankingItem3').mouseover(function(){
		$('.first2 img').attr('src','./resources/images/home/그리스보물전.jpg');
	});
	$('.rankingItem4').mouseover(function(){
		$('.first2 img').attr('src','./resources/images/home/이집트미술여행.jpg');
	});
	$('.rankingItem5').mouseover(function(){
		$('.first2 img').attr('src','./resources/images/home/대한통운.jpg');
	});
});

/* 공연 랭크 */
$(document).ready(function(){
	$('.ranking1').mouseover(function(){
		$('.first3 img').attr('src','./resources/images/Rrank/블루레인.jpg');
	});
	$('.ranking2').mouseover(function(){
		$('.first3 img').attr('src','./resources/images/Rrank/10cm.jpg');
	});
	$('.ranking3').mouseover(function(){
		$('.first3 img').attr('src','./resources/images/Rrank/테레즈.jpg');
	});
	$('.ranking4').mouseover(function(){
		$('.first3 img').attr('src','./resources/images/Rrank/정글라이프.jpg');
	});
	$('.ranking5').mouseover(function(){
		$('.first3 img').attr('src','./resources/images/Rrank/푸에르자.jpg');
	});
});


/* 날씨API */
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul+&appid=e06624cd1f1a4c3231e492d1970e4aed";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );                 
	
    var imgURL = "http://openweathermap.org/img/w/"+resp.weather[0].icon+".png";
    var a = "온도: "+Math.round(resp.main.temp- 273.15);
    var b = "지역: "+resp.name;
	$("#weather").attr("src", imgURL);
	$(".a").attr("value", a);
	$(".b").attr("value", b);
    }
});