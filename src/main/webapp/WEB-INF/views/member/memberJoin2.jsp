<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 약관동의------------------------------------------------------  -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/memberJoin.css">
<script src="../js/memberJoin.js" type="text/javascript"></script>
<style type="text/css">
	.Join_list{
		display: inline-block;
		font-size: 18px;
	}
	
</style>
</head>
<body>
<header id="simplefield-gnb" class="simplified-gnb">
	<div style="margin-top: 50px; margin-left: 50px;">
		 <a class="navigation-primary__logo" href="${pageContext.request.contextPath}/index.do" style="margin-right: 1px; color:black; text-decoration: none;">
			<img alt="homepage" src="${pageContext.request.contextPath}/img/home-heart.png" style="height: 35px; width: 45px;"><span>오늘의집</span>
		</a>
	</div>
</header>
<main role="main">
	<section id="member_wrap">
		<div>
			<div class="Join_list">
				<label class="form-radio-label"> 
				<input class="form-radio" type="radio" name="signup-form-type" value="0" checked="">
					<span class="radio-img" id="radio-img-first"></span>일반 유저
				</label>
			</div>
			<div class="Join_list">
				<!-- 전문가 페이지 이동 -->
				
				<a class="form-radio-label" href="${pageContext.request.contextPath}/seller/sellerJoin" style="text-decoration: none; color: black;"><input type="radio"> <span class="radio-img"></span>판매자회원가입
				</a>
			</div>
			<div class="Join_list">
				<!-- 전문가 페이지 이동 -->
				<a class="form-radio-label" href="${pageContext.request.contextPath}/expert/ExpertJoin"  style="text-decoration: none; color: black;"><input type="radio" > <span class="radio-img"></span>전문가
				</a>
			</div>
		</div>
		<h3 class="font_block">회원가입</h3>
		<form action="./memberJoin" method="POST" id="frm">
			<div class="form-group">
				<label for="title" id="email" name="email"
					class="font_block">이메일</label>
				<div style="width: 100%">
					<input type="text" class="form-control_first email-control" id="email_first"
						name="email_first"> 
						<span>@</span> 
						<input type="text" class="form-control_last email-control" id="email_last"
						name="email_last">
				</div>
				<div id="result" class="result_font"></div>
			</div>
			<br>
			<div class="form-group">
				<label for="title" id="pww" class="font_block">비밀번호</label>
				<p id="font_pw" class="font_block">8자이상 영문 대 소문자, 숫자, 특수문자를
					사용하세요.</p>
				<div style="width: 100%">
					<input type="password" class="form-controll  form-control" id="pw" name="pw">
				</div>
				<div id="result_pw" class="result_font"></div>
			</div>
			<div class="form-group">
				<label for="title" id="pwwcheck" class="font_block">비밀번호확인</label>
				<div style="width: 100%">
					<input type="password" class="form-controll  form-control" id="pwcheck"
						name="pwcheck">
				</div>
				<div id="result_pwpw" class="result_font"></div>
			</div>
			<div class="form-group" style="margin-top: 50px;">
				<label for="title" id="nickname1" class="font_block">별명</label>
				<p class="font_block">2~15자 자유롭게 입력해주세요.</p>
				<input type="text" class="form-controll  form-control" id="nickname"
					name="nickname" value="">
				<div id="result_nickname" class="result_font"></div>
			</div>
			
		<section id="signup-form__policy" class="signup-form__policy">
			<div class="signup-form__policy__check-all">
				<label class="bold">약관동의</label>
				<div class="form-check signup-form__policy__check-all__form-check">
                    <label class="form-check-label text-heading-5 bold ">
                        <input id="checkAll" class="form-check signup-form__policy__check-all__input" type="checkbox" style="width: 20px; height: 20px; margin-left: 5px;">
                       
                        전체 동의
                    </label>
                </div>
				<div class="signup-form__policy__policy-list">
				<div class="checkbox signup-form__policy__policy-item">
					<label for="signup-form__policy__more-14__input">만 14세 이상입니다.</label>
					<div class="form-check signup-form__policy__more-14__form-check">
					<label class="form-check-label bold">
                            <input type="checkbox" id="checka" class="check form-check form-check signup-form__policy__item__input signup-form__policy__more-14__input" style="width: 15px; height: 15px;" name="confirm_upper_14">
                            동의 <span class="text-red">(필수)</span>
                        </label>
					</div>
				</div>
				
				<div class="checkbox signup-form__policy__policy-item">
					<div class="signup-form__policy__policy-item">
                    <label for="signup-form__policy__use-policy__input">
                        <a class="bold simplified-footer__policy policy-use underline" href="./memberusepolicy">이용약관</a>
                    </label>
                    <div class="form-check signup-form__policy__use-policy__form-check">
                        <label class="form-check-label bold">
                            <input type="checkbox" id="checkb" class="check form-check signup-form__policy__item__input signup-form__policy__use-policy__input" name="confirm_use_policy">
                            동의 <span class="text-red">(필수)</span>
                        </label>
                    </div>
                </div>
				</div>
				<div class="checkbox signup-form__policy__policy-item">
                    <label for="signup-form__policy__privacy__input">
                        <a class="bold simplified-footer__policy policy-privacy underline" href="./memberprivacy">개인정보취급방침</a>
                    </label>
                    <div class="form-check signup-form__policy__privacy__form-check">
                        <label class="form-check-label bold">
                            <input type="checkbox" id="checkc" class="check check_font form-check signup-form__policy__item__input signup-form__policy__privacy__input"name="confirm_privacy">
                            동의 <span class="text-red">(필수)</span>
                        </label>
                    </div>
                </div>
				<div class="checkbox signup-form__policy__policy-item">
                    <label for="signup-form__policy__promotion__input" style="font-size: 13px;">이벤트 등 프로모션 알림 메일 수신</label>
                    <div class="form-check signup-form__policy__promotion__form-check">
                        <label class="form-check-label bold">
                            <input type="checkbox" id="checkid" class="check check_font form-check signup-form__policy__item__input signup-form__policy__promotion__input" name="confirm_market_email">
                            동의 <span class="text-gray-light">(선택)</span>
                        </label>
                    </div>
                </div>
				</div>
				<button id="join" class="btn btn-lg btn-priority btn-default" type="submit" form="new_normal_user">
            회원가입하기
        </button>
        <p id="has-account" style="margin-bottom: 50px;">이미 아이디가 있으신가요?
        <a class="bold underline" href="./memberLogin">로그인</a></p>
        
				
			</div>
		</section>
		</form>
		
	</section>
</main>	
</body>
</html>