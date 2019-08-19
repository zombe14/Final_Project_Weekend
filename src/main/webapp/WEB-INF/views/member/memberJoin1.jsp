<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <c:import url="../temp/boot.jsp"></c:import>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberJoin.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
     <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
  <script type="text/javascript" src="../resources/js/member/memberJoin.js?ver=1"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Weekend - 회원가입</title>

</head>
<body>
<div id="wrap">
	<div id="container">
	<div class="conta">
		<div class="join_wrap">
			<div class="join_logo">
				<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo111.png"></a>
			</div>
		<div class="joinWrap">
			<div>
				<h3>간편 회원가입</h3>
			</div>
			<div>
				<img id="kakaologin" class="btn" src="../resources/images/kakao_account_login_btn_medium_narrow.png">
			</div>
		</div>

		<div class="join_footer">
						<div class="join_menu">
							<a href="${pageContext.request.contextPath}/footer/personalInformation">개인정보처리방침</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/footer/youth">청소년보호정책</a>
							<span>|</span> 
							<a href="${pageContext.request.contextPath}/footer/use">이용약관</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
						</div>
					</div>
		</div>
	</div>
	<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.JPG"></a>
</div>
</div>
<script type='text/javascript'>
	
    Kakao.init('fa1849bdb6305a08ea8baf674234b306');
    // 카카오 로그인 버튼을 생성합니다.
    $("#kakaologin").click(function() {
    	Kakao.Auth.loginForm({
    		//login이 성공했을때
    		success : function(authObj){
    			location.href="./getInfo1?access_token="+authObj.access_token;
    		},
    		//login이 실패했을때
    		fail : function(errorObj){
    			alert(errorObj);
    		}
    	});
	});

    
    //현재상태
   function status() {
	Kakao.Auth.getStatus(function(statusObj) {
		console.log(statusObj);
	});
	
}
  //]]>
</script>
</body>
</html>