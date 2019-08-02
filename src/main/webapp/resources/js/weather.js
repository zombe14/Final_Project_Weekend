jQuery(document).ready(function() {
	var bodyOffset = jQuery('body').offset();
	jQuery(window).scroll(function() {
		if (jQuery(document).scrollTop() > bodyOffset.top+400) {
			jQuery('#wingright').addClass('right_suv');
		} else {
			jQuery('#wingright').removeClass('right_suv');
		}
	});
});

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